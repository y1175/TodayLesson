package com.todaylesson.csrf;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.todaylesson.service.TodaylessonService;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

    @Resource(name="todaylessonService")
    private TodaylessonService todaylessonService;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
		
		
		// TODO Auto-generated method stub
		List<String> roleNames= new ArrayList<>();
		auth.getAuthorities().forEach(authority ->{
			roleNames.add(authority.getAuthority());
		});
		String id=auth.getName();
		System.out.println("id:"+id);
		//stat_log에 로그인 기록 남김
		todaylessonService.loginCount(id);
		if(roleNames.contains("ROLE_ADMIN")) {
			//ADMIN권한이 있을시 로그인 후 이동경로
			response.sendRedirect("/TodayLesson/todaylesson");
			return;
		}
		
		//나머지 권한의 로그인후 이동경로
		response.sendRedirect("/TodayLesson/todaylesson");
	}

}
