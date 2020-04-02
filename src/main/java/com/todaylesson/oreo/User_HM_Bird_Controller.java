package com.todaylesson.oreo;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.service.User_HM_Bird_Service;

@Controller
@RequestMapping("/todaylesson/")
public class User_HM_Bird_Controller {

	@Resource(name="user_hm_bird_service")
	private User_HM_Bird_Service service;
	
	
	@RequestMapping("/hm_us_bird")
	public String hm_us_bird(Model model)
	{
		List<LessonDTO> list = service.bestlesson();
		model.addAttribute("list",list);
		
		return "/TodayLesson_UserPage/hm_us_bird.us_main_section";
	}
	
}
