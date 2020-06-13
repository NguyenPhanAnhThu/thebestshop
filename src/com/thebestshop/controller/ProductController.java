package com.thebestshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.thebestshop.dao.CategoryDAO;
import com.thebestshop.dao.ProductDAO;
import com.thebestshop.entity.Category;
import com.thebestshop.entity.Product;

@Controller
public class ProductController {
	@Autowired
	CategoryDAO cdao;
	@Autowired
	ProductDAO pdao;
	@RequestMapping("product/list-by-category/{id}")
	public String listByCategory(ModelMap model, @PathVariable("id") Integer id) {
		Category category = cdao.findById(id);
		List<Product> listDiscount = pdao.findBySpecials(2);
		model.addAttribute("discount_prod", listDiscount);
		model.addAttribute("category", category);
		model.addAttribute("prods", category.getProducts());
		model.addAttribute("views", "product/list");

		return "_layout";
	}
	
	@RequestMapping("product/detail/{id}")
	public String detail(ModelMap model, @PathVariable("id") Integer id) {
		Product product = pdao.findById(id);
	
		
		product.setViewCount(product.getViewCount()+1);
	
		pdao.update(product);
		model.addAttribute("prod", product);
		model.addAttribute("views", "product/detail");
		return "_layout";
	}
	
	@RequestMapping("product/list-by-keywords")
	public String listByKeywords(ModelMap model, @RequestParam("keywords") String keywords) {
		List<Product> products = pdao.findByKeywords(keywords);
		model.addAttribute("prods", products);
		model.addAttribute("keywords", keywords);
		model.addAttribute("views", "product/search");
		return "_layout";
	}
}
