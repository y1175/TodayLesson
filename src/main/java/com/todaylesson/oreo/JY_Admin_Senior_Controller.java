package com.todaylesson.oreo;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.todaylesson.DTO.AllLessonDTO;
import com.todaylesson.service.JY_Admin_LessonService;
import com.todaylesson.service.JY_Admin_SeniorService;

@Controller
public class JY_Admin_Senior_Controller {

	
	@Resource(name="ad_senior_service")
	private JY_Admin_SeniorService ad_senior_service;
	
	@RequestMapping("all_senior")
	public String all_senior(Model model) {
		
		List<AllLessonDTO> list = ad_senior_service.all_senior();
		
		
		return "";
	}
	
	
}
