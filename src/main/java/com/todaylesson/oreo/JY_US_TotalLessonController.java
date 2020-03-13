package com.todaylesson.oreo;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.service.JY_US_TotalLessonService;

@Controller
public class JY_US_TotalLessonController {

	
	@Resource(name="totallesson_service")
	private JY_US_TotalLessonService ttlesson_service;
	
	
	@RequestMapping()
	public String totallesson_list(Model model) {

		List<LessonDTO> list = ttlesson_service.ttlesson_list();
		model.addAttribute("list",list);
		
		return "";
	}
	
}
