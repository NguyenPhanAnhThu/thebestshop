package com.thebestshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thebestshop.dao.ProductDAO;
import com.thebestshop.entity.Product;

@Controller
public class HomeController {
	@Autowired
	ProductDAO pdao;
	@RequestMapping("home/index")
	public String index(ModelMap model) {
		List<Product> listSpecial = pdao.findBySpecials(0);
		List<Product> listNew = pdao.findBySpecials(1);
		List<Product> listDiscount = pdao.findBySpecials(2);
		List<Product> listView = pdao.findBySpecials(3);
		model.addAttribute("special_prod", listSpecial);
		model.addAttribute("new_prod",listNew);
		model.addAttribute("discount_prod", listDiscount);
		model.addAttribute("view_prod", listView);
		model.addAttribute("views", "home/index");
		return "_layout";
	}
}
