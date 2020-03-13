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
public class JY_Mail_Test_service {

	@Autowired 
	private JY_Admin_LessonMapper mapper;
	
	@Autowired
	private JavaMailSender mailSender;
	
	public int mailSendWithPassword(String member_id, String senioir_email, String lesson_title, HttpServletRequest request) {
				
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 '"+ member_id +"' 님</h2><br><br>" 
				+ "<p>신청해주신 레슨" +lesson_title +"의 심사가 끝났습니다.</p>"
				+ "<p>" + lesson_title +"큰 무리없이 레슨을 진행 할 수 있을 것 같습니다</p>"
				+ "<p> 레슨을 신청하시는 분들께 보내드리는 키트 제작을 위해</p>"
				+ "<p> 담당자(김진영 : 010-7144-3797)가 연락을 드릴 예정입니다.</p>"
				+ "<p>수많은 레슨 플랫폼 중 저희 '오늘의 레슨'을 선택해주셔서 감사드리며,</p>"
				+ "<p>오늘의 레슨은 이 땅에 있는 모든 이들이 하나의 레슨을 가지는 그날까지! 열심히 노력하겠습니다!</p>";
		try {
			mail.setSubject("[TodayLesson] 신청하신 레슨 심사가 완료 되었습니다.", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(senioir_email));
			mailSender.send(mail);
		} catch (MessagingException e) { 
			e.printStackTrace();
		}
		return mapper.lessonResult(member_id, senioir_email,lesson_title);	
	
	}

	
	
}
