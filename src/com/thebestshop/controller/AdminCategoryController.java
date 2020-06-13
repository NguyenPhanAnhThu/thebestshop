package com.thebestshop.controller;

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

import com.thebestshop.dao.CategoryDAO;
import com.thebestshop.entity.Category;

@Controller
public class AdminCategoryController {
	@Autowired
	CategoryDAO cdao;

	
	//thêm mới
	@RequestMapping(value="admin/category/create", method=RequestMethod.POST)
	public String create(ModelMap model, @Validated @ModelAttribute("form") Category form, BindingResult errors) {
	
		if(errors.hasErrors()) {
			model.addAttribute("message", "Some fileds are not valid. Please fix them!");
		}
		else {
			cdao.create(form);
			model.addAttribute("form", new Category());
			model.addAttribute("list", cdao.findAll());
			model.addAttribute("message", "Thêm loại mới thành công!");
			
		}
		model.addAttribute("views", "category/index");
		return "admin/_master";
	}
	
	//Xóa
	@RequestMapping("admin/category/delete")
	public String delete(ModelMap model, @RequestParam("id") Integer id) {
		cdao.delete(id);
		model.addAttribute("form", new Category());
		model.addAttribute("list", cdao.findAll());
		model.addAttribute("message", "Xóa thành công!");
		model.addAttribute("views", "category/index");
		return "admin/_master";
	}
	//Sửa
	@RequestMapping("admin/category/edit/{id}")
	public String edit(ModelMap model, @PathVariable("id") Integer id) {
		model.addAttribute("form", cdao.findById(id));
		model.addAttribute("list", cdao.findAll());
		model.addAttribute("views", "category/index");
		return "admin/_master";
		
	}
	//Cập nhật
	@RequestMapping("admin/category/update")
	public String update(ModelMap model, @ModelAttribute("form") Category form) {
		cdao.update(form);
		model.addAttribute("list", cdao.findAll());
		model.addAttribute("message", "Cập nhật thành công!");
		model.addAttribute("views", "category/index");
		return "admin/_master";
	}
	@RequestMapping("admin/category/index")
	public String index(ModelMap model) {
		model.addAttribute("form", new Category());
		model.addAttribute("list", cdao.findAll());
		
		model.addAttribute("views", "category/index");
		return "admin/_master";
	}
	//show list product by Category
	@RequestMapping("admin/category/list/{id}")
	public String listByCategory(ModelMap model, @PathVariable("id") Integer id) {
		Category category = cdao.findById(id);
		model.addAttribute("prods", category.getProducts());
		model.addAttribute("views", "category/list-by-category");
		model.addAttribute("title", category.getName());
		return "admin/_master";
	}


	
}
