package com.thebestshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminHomeController {
	@RequestMapping("admin/home/index")
	public String index(ModelMap model) {
		model.addAttribute("views", "home/index");
		return "admin/_master";
	}
}
