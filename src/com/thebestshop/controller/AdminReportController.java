package com.thebestshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thebestshop.dao.ReportDAO;

@Controller
public class AdminReportController {
	@Autowired
	ReportDAO dao;
	@RequestMapping("admin/report/revenue-by-quarter")
	public String revenueByCategoryQuarter(ModelMap model) {
		List<Object[]> data = dao.revenueByQuarter();
		model.addAttribute("data", data);
		model.addAttribute("views", "report/revenue-by-quarter");
		return "admin/_master";
	}
	@RequestMapping("/admin/report/revenue-by-category")
	public String revenueByCategory(ModelMap model) {
		List<Object[]> data = dao.revenueByCategory();
		model.addAttribute("data", data);
		model.addAttribute("views", "report/revenue-by-category");
		return "admin/_master";
	}
	@RequestMapping("admin/report/inventory")
	public String inventory(ModelMap model) {
		List<Object[]> data = dao.inventoryByCategory();
		model.addAttribute("data", data);
		model.addAttribute("views", "report/inventory");
		return "admin/_master";
	}
}
