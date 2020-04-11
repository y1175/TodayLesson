package com.todaylesson.service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.todaylesson.Mapper.JY_Admin_LessonMapper;

@Service
public class JY_SN_Mail_service {

	@Autowired 
	private JY_Admin_LessonMapper mapper;
	
	@Autowired
	private JavaMailSender mailSender;
	
	public void mailSendLessonApprove(String member_id, String senior_email, String lesson_title, HttpServletRequest request) {
				
		
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2> 안녕하세요 '"+ member_id +"' 님</h2><br><br>" 
				+ "<p> 신청해주신 레슨 '" +lesson_title + "' 의 심사가 끝났습니다.</p>"
				+ "<p><b> 심사 결과 큰 무리없이 레슨을 진행 할 수 있을 것 같습니다.</b></p><br>"
				+ "<p> 레슨을 수강하시는 주니어분께 보내드리는 키트 제작을 위해</p>"
				+ "<p> 담당자(김진영 : 010-7144-3797)가 연락을 드릴 예정입니다.</p><br>"
				+ "<p> 수많은 레슨 플랫폼 중 저희 '오늘의 레슨'을 선택해주셔서 감사드리며,</p>"
				+ "<p> 오늘의 레슨은 이 땅에 있는 모든 이들이 하나의 취미를 가지는 그날까지! 열심히 노력하겠습니다!</p>";
		try {
			mail.setSubject("[TodayLesson] 신청하신 레슨 심사가 완료 되었습니다.", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(senior_email));
			mailSender.send(mail);
		} catch (MessagingException e) { 
			e.printStackTrace();
		}	
	
	}

	public void mailSendLessonReject(int lesson_no, String member_id, String senior_email, String lesson_title,HttpServletRequest request) {
		
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 '"+ member_id +"' 님</h2><br><br>" 
				+ "<p> 신청해주신 레슨 '" +lesson_title + "'  의 심사가 끝났습니다.</p><br>"
				+ "<p> 아쉽게도 이번에는 저희 오늘의 레슨과 레슨을 진행하기 어려울 것 같습니다.</p>"
				+ "<p> 비록 연이 닿지 않았지만 수많은 레슨 플랫폼 중 저희 '오늘의 레슨'을 선택해주셔서 감사합니다.</p>"
				+ "<p> 레슨과 관련해 궁금하신 점이 있다면 담당자(김진영 : 010-7144-3797)께 연락 부탁드립니다.</p>";
		try {
			mail.setSubject("[TodayLesson] 신청하신 레슨 심사가 완료 되었습니다.", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(senior_email));
			mailSender.send(mail);
		} catch (MessagingException e) { 
			e.printStackTrace();
		}	
		
	}



	
	
}
