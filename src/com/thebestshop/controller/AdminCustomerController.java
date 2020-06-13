package com.thebestshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thebestshop.dao.CustomerDAO;
import com.thebestshop.entity.Customer;

@Controller
public class AdminCustomerController {
	@Autowired
	CustomerDAO cdao;
	
	@RequestMapping("/admin/customer/index")
	public String index(ModelMap model) {
		model.addAttribute("form", new Customer());
		model.addAttribute("list", cdao.findAll());
		model.addAttribute("views", "customer/index");
		return "admin/_master";
	}
}
