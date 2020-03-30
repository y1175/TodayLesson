package com.todaylesson.oreo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.MyLessonDTO;
import com.todaylesson.service.JY_US_MyLessonService;

@Controller
public class JY_US_MyLesson_Controller {

	@Autowired
	private JY_US_MyLessonService mlservice;
	
	@RequestMapping("my_lesson_list")
	public String my_lesson_list(Model model,Authentication authentication) {
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
		String member_id = userDetails.getUsername();
		
		List<LessonDTO> lesson_list = mlservice.mylesson_list(member_id);
		model.addAttribute("list",lesson_list);
		
		return "TodayLesson_UserPage/jy_us_my_lesson_list.us_main_section";
	}
	 
}
