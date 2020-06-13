package com.thebestshop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminLoginController {
@RequestMapping(value="admin/login", method=RequestMethod.GET)
public String login() {
	return "admin/login/login";
}
@RequestMapping(value="admin/login", method=RequestMethod.POST)
public String login(ModelMap model, HttpServletRequest request) {
	String id = request.getParameter("username");
	String pw = request.getParameter("password");
	if(id.equals("admin")&&pw.equals("ptithcm")) {
		return "redirect:/admin/home/index.htm";
	}
	else {
		model.addAttribute("message", "Sai thông tin đăng nhập!");
	}
	return "admin/login/login";
}
}
