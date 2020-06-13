package com.thebestshop.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
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

import com.thebestshop.dao.CategoryDAO;
import com.thebestshop.dao.ProductDAO;
import com.thebestshop.entity.Category;
import com.thebestshop.entity.Product;

@Controller
public class AdminProductController {
	@Autowired
	ProductDAO pdao;
	
	@Autowired
	ServletContext context;
	
	@Autowired
	CategoryDAO cdao;
	
	@ModelAttribute("cates")
	public List<Category> getCategories(){
		return cdao.findAll();
	}
	

	@RequestMapping(value="admin/product/create", method=RequestMethod.POST)
	public String create(ModelMap model,@RequestParam("upimage") MultipartFile _photo, 
			@ModelAttribute("form") @Validated Product form,BindingResult errors) throws IllegalStateException,Exception{
		if(form.getName().trim().length()==0) {
			errors.rejectValue("name", "form", "Vui lòng điền tên sản phẩm!");
		}
		if(form.getUnitPrice() == 0) {
			errors.rejectValue("unitPrice", "form", "Vui lòng điền giá thành sản phẩm!");
		}
		if(form.getProductDate()==null) {
			errors.rejectValue("productDate", "form", "Vui lòng nhập ngày nhập hàng!");
		}
		if(form.getQuantity()==0) {
			errors.rejectValue("quantity", "form", "Vui lòng nhập số lượng!");
		}
		if(!_photo.isEmpty()) {		
			
				String filename = _photo.getOriginalFilename();
				form.setImage(filename);
				String path = context.getRealPath("/resource/images/products/" +form.getImage());
				_photo.transferTo(new File(path));

			
		}
		else {
			errors.rejectValue("image", "form", "Chọn ảnh cho sản phẩm!");
		}
		if(errors.hasErrors()) {
			model.addAttribute("message", "Some fileds are not valid. Please fix them!");
		}
		else {
			
			pdao.create(form);
			model.addAttribute("form", new Product());
			model.addAttribute("list", pdao.findAll());
			model.addAttribute("message", "Thêm sản phẩm mới thành công!");
		}

		model.addAttribute("views", "product/index");
		return "admin/_master";
	}
	//Xóa
	@RequestMapping("admin/product/delete/{id}")
	public String delete(ModelMap model, @PathVariable("id") Integer id) {
	
		Integer c_id = pdao.findById(id).getCategory().getId();
		pdao.delete(id);
		model.addAttribute("form", new Product());
		model.addAttribute("list", pdao.findAll());
		model.addAttribute("views", "category/list-by-category");
		return "redirect:/admin/category/list/"+c_id+".htm";
	}
	
	//Cập nhật
	@RequestMapping("admin/product/update")
	public String update(ModelMap model, @ModelAttribute("form") Product form, 
			@RequestParam("upimage") MultipartFile _photo) throws Exception{
		if(!_photo.isEmpty()) {
			String filename = _photo.getOriginalFilename();
			form.setImage(filename);
			String path = context.getRealPath("resource/images/products/" +form.getImage());
			_photo.transferTo(new File(path));
		}
		Integer c_id = form.getCategory().getId();
		
		pdao.update(form);
		model.addAttribute("list", pdao.findAll());
		//model.addAttribute("views", "category/list-by-category/"+form.getCategory().getId()+".htm");
		model.addAttribute("message", "Cập nhật thành công!");
		return	"redirect:/admin/category/list/"+c_id+".htm";
	}
	
	//Edit
	@RequestMapping("admin/product/edit/{id}")
	public String edit(ModelMap model, @PathVariable("id") Integer id) {
		model.addAttribute("form", pdao.findById(id));
		model.addAttribute("list", pdao.findAll());
		model.addAttribute("views", "product/edit");
		return "admin/_master";
	
	}
	@RequestMapping("admin/product/index")
	public String index(ModelMap model) {
		model.addAttribute("form", new Product());
		model.addAttribute("list", pdao.findAll());
		model.addAttribute("views", "product/index");
		return "admin/_master";
	}
	
	
	
}
