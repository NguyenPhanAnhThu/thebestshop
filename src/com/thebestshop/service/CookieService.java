package com.thebestshop.service;

import java.util.Base64;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CookieService {
	@Autowired
	HttpServletResponse response;
	
	@Autowired
	HttpServletRequest request;
	/**
	 * Tạo và gửi cookie về client
	 * @param name tên cookie
	 * @param value giá trị cookie
	 * @param days số ngày tồn tại
	 * @return cookie được tạo ra và gửi về client
	 */
	public Cookie create(String name, String value, int days) {
		String encodedValue = Base64.getEncoder().encodeToString(value.getBytes());
	
		Cookie cookie = new Cookie(name, encodedValue);
		cookie.setMaxAge(days * 24 * 60 * 60);
		cookie.setPath("/");
		//response.addCookie(cookie);
		return cookie;
	}
	
	public Cookie get(String name) {
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equalsIgnoreCase(name)) {
					byte[] data = Base64.getDecoder().decode(cookie.getValue());
					cookie.setValue(new String(data));
					return cookie;
				}
			}
		}
		return null;
	}
	
	public void delete(String name) {
		this.create(name, "", 0);
	}
	
	public String getValue(String name, String defaultValue) {
		Cookie cookie = this.get(name);
		if(cookie != null) {
			return cookie.getValue();
		}
		return defaultValue;
	}
}
