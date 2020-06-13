package com.thebestshop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.thebestshop.entity.Customer;
@Component
public class AuthInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		HttpSession session = request.getSession();
		Customer user = (Customer) session.getAttribute("user");
		if(user==null) {
	
			String uri = request.getRequestURI();
			String uri_get = uri.substring(12);
			
			session.setAttribute("secure-url", uri_get);
			response.sendRedirect(request.getContextPath()+ "/account/login.htm");
			return false;
		}
		return true;
	}
}
