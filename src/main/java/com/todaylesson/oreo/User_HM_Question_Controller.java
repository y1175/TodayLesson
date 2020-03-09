package com.todaylesson.oreo;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.todaylesson.service.User_HM_Question_Service;

@Controller
public class User_HM_Question_Controller {

	@Resource(name="user_hm_question_service")
	private User_HM_Question_Service service;
	
	@RequestMapping("/hm_us_question")
	private String hm_us_question()
	{
		
		return "/TodayLesson_UserPage/hm_us_question";
		
	}
	
	//문의 등록페이지 이동
	@RequestMapping("/hm_question_insert")
	private String hm_question_insert()
	{
		
		return "/TodayLesson_UserPage/hm_question_insert";
	}
	
	
	@RequestMapping("/hm_question_create")
	private String hm_question_create(
			@RequestParam("member_id")String member_id
			,@RequestParam("question_group") int question_group
			,@RequestParam("question_title") String question_title
			,@RequestParam("question_content") String question_content)
	{
		HashMap<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("question_group", question_group);
		map.put("question_title", question_title);
		map.put("question_content", question_content);
		
		service.hm_question_insert(map);
		
		
		return "/TodayLesson_UserPage/hm_us_question";
	}
	
}
