package com.thebestshop.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thebestshop.dao.OrderDAO;
import com.thebestshop.dao.OrderDetailDAO;
import com.thebestshop.entity.Customer;
import com.thebestshop.entity.Order;
import com.thebestshop.entity.OrderDetail;
import com.thebestshop.entity.Product;
import com.thebestshop.service.CartService;

@Controller
public class OrderController {
	@Autowired
	CartService cart;
	@Autowired
	HttpSession session;
	@Autowired
	OrderDAO odao;
	@Autowired
	OrderDetailDAO oddao;
	
	@RequestMapping("/order/items")
	public String getPurchasedItems(ModelMap model) {
		Customer user = (Customer)session.getAttribute("user");
		List<Product> products = odao.findItemsByUser(user.getId());
		
		model.addAttribute("prods", products);
		model.addAttribute("views", "order/items");
		return "_layout";
	}
	
	@RequestMapping("order/checkout")
	public String checkout(ModelMap model) {
		Order order = new Order();
		order.setOrderDate(new Date());
		
		order.setAmount(cart.getAmount());
		order.setCustomer((Customer)session.getAttribute("user"));
		
		model.addAttribute("order", order);
		model.addAttribute("views", "order/checkout");
		return "_layout";
	}
	
	@RequestMapping("order/list")
	public String list(ModelMap model) {
		Customer user = (Customer) session.getAttribute("user");
		List<Order> orders = odao.findByUser(user.getId());
		
		model.addAttribute("orders", orders);
		model.addAttribute("views", "order/list");
		return "_layout";
	}
	
	@RequestMapping("order/purchase")
	public String purchase(ModelMap model, Order order) {
		List<OrderDetail> details = new ArrayList<>();
		for(Product p: cart.getItems()) {
			OrderDetail detail = new OrderDetail();
			detail.setProduct(p);
			detail.setOrder(order);
			detail.setUnitPrice(p.getUnitPrice());
			detail.setDiscount(p.getDiscount());
			detail.setQuantity(p.getQuantity());
			details.add(detail);
		}
		odao.create(order, details);
		cart.clear();
		return "redirect:list.htm";
	}
	@RequestMapping("order/detail/{id}")
	public String detail(ModelMap model, @PathVariable("id") Integer id) {
		Order order = odao.findById(id);
		model.addAttribute("order", order);
		model.addAttribute("views", "order/detail");
		return "_layout";
	}
}
