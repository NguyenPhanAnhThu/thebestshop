package com.thebestshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thebestshop.dao.OrderDAO;
import com.thebestshop.entity.Order;

@Controller
public class AdminOrderController {
	@Autowired
	OrderDAO odao;
	@RequestMapping("/admin/order/list")
	public String index(ModelMap model) {
		model.addAttribute("form", new Order());
		model.addAttribute("list", odao.findAll());
		model.addAttribute("views", "order/index");
		return "admin/_master";
	}
	
	@RequestMapping("admin/order/invoice/{id}")
	public String invoice(ModelMap model, @PathVariable("id") Integer id) {
		Order order = odao.findById(id);
		model.addAttribute("order", order);
		
		model.addAttribute("views", "order/invoice");
		return "admin/_master";
	}
}
