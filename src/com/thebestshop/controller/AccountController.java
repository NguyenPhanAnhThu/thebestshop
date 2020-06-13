package com.thebestshop.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.thebestshop.dao.CustomerDAO;
import com.thebestshop.entity.Customer;
import com.thebestshop.service.CookieService;
import com.thebestshop.service.MailerService;

@Controller
public class AccountController {
	@Autowired
	CustomerDAO cusDao;
	@Autowired
	MailerService mailer;

	@Autowired
	ServletContext context;
	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest request;

	/*
	 * REGISTER & ACTIVATE
	 * */
	@RequestMapping(value="/account/register", method=RequestMethod.GET)
	public String register(ModelMap model, @ModelAttribute("user") Customer user) {
		model.addAttribute("views", "account/register");
		return "_layout";
	}
	@RequestMapping(value="/account/register", method=RequestMethod.POST)
	public String register(ModelMap model, @Validated @ModelAttribute("user") Customer user,
							BindingResult errors, @RequestParam("_photo") MultipartFile file) throws Exception {
		user.setActivated(false);
		user.setAdmin(false);
		if(!file.isEmpty()) {
			String filename = file.getOriginalFilename();
			filename = file.getOriginalFilename();
			user.setPhoto(filename);
			String path = context.getRealPath("resource/images/customers/" +user.getPhoto());
			file.transferTo(new File(path));
		}
		else {
			errors.rejectValue("photo", "user", "Vui lòng chọn ảnh!");
		}
		if(errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây!");
		}
		else {
			cusDao.create(user);
			model.addAttribute("message", "Đăng ký thành công!Vui lòng check mail để kích hoạt tài khoản!");
			

			String subject = "Welcome mail";
			String url = request.getRequestURL().toString().replace("register", "activate/"+user.getId());
			String body = "Xin chào<hr><a href='?'>Activate</a>".replace("?", url);
			mailer.send(user.getEmail(), subject, body);
		}
		model.addAttribute("views", "account/register");
		return "_layout";
	}
	
	@RequestMapping("account/activate/{id}")
	public String activate(@PathVariable("id") String id) {
		Customer user = cusDao.findById(id);
		user.setActivated(true);
		cusDao.update(user);
		return "redirect:/account/login.htm";
	}
	
	/*
	 * 	LOGIN & LOGOUT
	 * */
	
	@RequestMapping(value="account/login", method=RequestMethod.GET)
	public String login(ModelMap model) {
		
		//String[] user = cookie.getValue("user", "").split("~");
//		if(user.length==2) {
//			model.addAttribute("username", user[0]);
//			model.addAttribute("password", user[1]);
//		}
		model.addAttribute("views", "account/login");
		return "_layout";
	}
	@RequestMapping(value="account/login", method=RequestMethod.POST)
	public String login(ModelMap model,
						@RequestParam("id") String id,
						@RequestParam("password") String pw) {
		Customer user = cusDao.findById(id);
		if(user == null) {
			model.addAttribute("message", "Invalid username!");
		}else if(!user.getPassword().equals(pw)) {
			model.addAttribute("message", "Invalid password!");
		}else if(!user.isActivated()) {
			model.addAttribute("message", "Tài khoản của bạn chưa được kích hoạt!");
		}else {
			model.addAttribute("message", "Đăng nhập thành công!");
			session.setAttribute("user", user);
//			if(rm==false) {
//				cookie.create("user", "", 0);
//			}else {
//				cookie.create("user", id+"~"+pw, 30);
//			}
			
			String secureUrl = (String) session.getAttribute("secure-url");
			if(secureUrl != null) {
				return "redirect:"+secureUrl;
			}
		}
		
		return "redirect:/home/index.htm";
		
	}
	@RequestMapping("account/logout")
	public String logout(ModelMap model) {
		session.removeAttribute("user");
		return "redirect:/home/index.htm";
	}
	/*
	 * FORGOT PASSWORD
	 * */
	@RequestMapping(value="account/forgot", method=RequestMethod.GET)
	public String forgot(ModelMap model) {
		model.addAttribute("views", "account/forgot");
		return "_layout";
	}
	@RequestMapping(value="account/forgot", method=RequestMethod.POST)
	public String forgot(ModelMap model,
						@RequestParam("id") String id,
						@RequestParam("email") String email) {
		Customer user = cusDao.findById(id);
		if(user == null) {
			model.addAttribute("message", "Invalid username");
		}
		else if(!email.equals(user.getEmail())) {
			model.addAttribute("message", "Invalid Email Address");
		}else {
			model.addAttribute("message", "Mật khẩu của bạn đã được gửi qua Gmail. Vui lòng kiểm tra hộp thư!");
			String subject = " Your Password";
			String body = user.getPassword();
			mailer.send(user.getEmail(), subject, body);
		}
		model.addAttribute("views", "account/forgot");
		return "_layout";
	}
	/*
	 * CHANGE PASSWORD
	 * */
	@RequestMapping(value="account/change", method=RequestMethod.GET)
	public String change(ModelMap model) {
		model.addAttribute("views", "account/change");
		return "_layout";
	}
	@RequestMapping(value="account/change", method=RequestMethod.POST)
	public String change(ModelMap model,
						@RequestParam("id") String id,
						@RequestParam("password") String pw,
						@RequestParam("password1") String pw1,
						@RequestParam("password2") String pw2) {
		if(!pw1.equals(pw2)) {
			model.addAttribute("message", "Confirm password is invalid!");
		}else {
			Customer user = cusDao.findById(id);
			if(user==null) {
				model.addAttribute("message", "Invalid username");
			}else if(!pw.equals(user.getPassword())) {
				model.addAttribute("message", "Invalid current password!");
			}else {
				user.setPassword(pw1);
				cusDao.update(user);
				model.addAttribute("message", "Your password was changed!");
			}
		}
		model.addAttribute("views", "account/change");
		return "_layout";
	}
	/*
	 * PROFILE EDITION
	 * */
	@RequestMapping(value="account/edit", method=RequestMethod.GET)
	public String edit(ModelMap model) {
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("views", "account/edit");
		return "_layout";
	}
	@RequestMapping(value="account/edit", method=RequestMethod.POST)
	public String edit(ModelMap model,
						@Validated @ModelAttribute("user") Customer user,
						BindingResult errors,
						@RequestParam("_photo") MultipartFile file) throws Exception{
		if(!file.isEmpty()) {
			String filename = file.getOriginalFilename();
			filename = UUID.randomUUID()+filename.substring(filename.lastIndexOf('.'));
			user.setPhoto(filename);
			String path = context.getRealPath("/resource/images/customers/"+user.getPhoto());
			file.transferTo(new File(path));
		}
		if(errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau!");
		}else {
			cusDao.update(user);
			session.setAttribute("user", user);
			model.addAttribute("message", "Cập nhật thành công!");
		}
		model.addAttribute("views", "account/edit");
		return "_layout";
	}

	
}
