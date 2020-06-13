package com.thebestshop.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thebestshop.service.CartService;

@Controller
public class CartController {
	@Autowired
	CartService cart;
	@Autowired
	HttpSession session;
	@ResponseBody
	@RequestMapping("cart/update/{id}/{qtt}")
	public Map<String, Object> update(@PathVariable("id") Integer id,
									@PathVariable("qtt") Integer qtt){
		cart.update(id, qtt);
		
		Map<String, Object> map = new HashMap<>();
		map.put("count", cart.getCount());
		map.put("amount", cart.getAmount());
		return map;
	}
	

	@RequestMapping("/cart/clear")
	public String clear(ModelMap model) {
		cart.clear();
		model.addAttribute("views", "cart/index");
		return "_layout";
	}
	
	
	@RequestMapping("/cart/remove/{id}")
	public String remove(ModelMap model, @PathVariable("id") Integer id){
		cart.remove(id);
		
		Map<String, Object> map = new HashMap<>();
		map.put("count", cart.getCount());
		map.put("amount", cart.getAmount());
		model.addAttribute("views", "cart/index");
		return "_layout";
	}
	
//	@ResponseBody
//	@RequestMapping("cart/add/{id}")
//	public Map<String, Object> add(@PathVariable("id") Integer id){
//		cart.add(id);
//		System.out.println(id);
//		Map<String, Object> map = new HashMap<>();
//		map.put("count", cart.getCount());
//		map.put("amount", cart.getAmount());
//		return map;
//	}
	
	@RequestMapping("/cart/view")
	public String view(ModelMap model) {
		model.addAttribute("cart", cart);
			
		
		model.addAttribute("views", "cart/index");
		return "_layout";
	}
	
	@RequestMapping("cart/add/{id}")
	public String add(ModelMap model, @PathVariable("id") Integer id) {
		cart.add(id);
		Map<String, Object> map = new HashMap<>();
		
		map.put("count", cart.getCount());
		map.put("amount", cart.getAmount());
		model.addAttribute("map", map);
		session.setAttribute("cart", cart);
		return "redirect:/product/detail/"+id+".htm";
	}
	
}
