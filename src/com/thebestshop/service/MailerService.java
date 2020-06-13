package com.thebestshop.service;

import java.io.File;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailerService {
	@Autowired
	JavaMailSender mailer;
	
	/**
	 * Gửi email
	 * @param to Email nguoi nhan
	 * @param subject Tieu de email
	 * @param body Noi dung
	 * @param others Cac thong so khac theo thu tu From, CC, BCC, Attachments.
	 * Cac thanh phan trong CC, BCC và Attachments cach nhau boi dau phay	
	 * */
	
	public void send(String to, String subject, String body, String...others) {
		try {
			//Tạo mail
			MimeMessage mail = mailer.createMimeMessage();
			//Sử dung lớp trợ giúp
			MimeMessageHelper helper = new MimeMessageHelper(mail);
			helper.setTo(to);
			helper.setSubject(subject);
			helper.setText(body, true);
			
			if(others.length > 1 && others[0]!=null && others[0].length() > 0) {
				helper.setFrom(others[0], others[0]);
				helper.setReplyTo(others[0], others[0]);		
			}
			else {
				helper.setFrom("master@gmail.com", "The Best Shop");
				helper.setReplyTo("master@gmail.com", "The Best Shop");
			}
			
			if(others.length > 1 && others[1] != null && others[1].length() > 0) {
				helper.setCc(others[1]);
			}
			
			if(others.length > 2 && others[2] != null && others[2].length() > 0) {
				helper.setBcc(others[2]);
			}
			if(others.length > 3 && others[3] != null && others[3].length() > 0) {
				String[] paths = others[3].trim().split("[,;]+");
				for(String path : paths) {
					File file = new File(path);
					helper.addAttachment(file.getName(), file);
				}
			}
			
			mailer.send(mail);
			
		}catch(Exception e) {
			throw new RuntimeException(e);
		}
	}
}
