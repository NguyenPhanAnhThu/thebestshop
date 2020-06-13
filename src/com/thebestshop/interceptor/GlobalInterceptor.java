package com.thebestshop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.thebestshop.dao.CategoryDAO;
@Component
public class GlobalInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	CategoryDAO cdao;
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) {
		request.setAttribute("tenloai", cdao.findAll());
		
	}
	
}
