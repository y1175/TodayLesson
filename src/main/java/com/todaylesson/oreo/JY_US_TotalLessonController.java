package com.todaylesson.oreo;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.todaylesson.DTO.AllLessonDTO;
import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.service.JY_US_TotalLessonService;

@Controller
public class JY_US_TotalLessonController {

	
	@Resource(name="totallesson_service")
	private JY_US_TotalLessonService ttlesson_service;
	
	
	@RequestMapping("total_lesson_list")
	public String ttlesson_list(Model model) {

		List<LessonDTO> list = ttlesson_service.ttlesson_list();
		model.addAttribute("list",list);
		
		return "TodayLesson_UserPage/jy_us_total_lesson_list.us_main_section";
	}
	
	@RequestMapping("lesson_detail/{lesson_no}")
	public String ttlesson_detail(Model model, @PathVariable int lesson_no) {
		
		AllLessonDTO dto = ttlesson_service.ttlesson_select(lesson_no);
		model.addAttribute("dto",dto);
		
		return "TodayLesson_UserPage/jy_us_total_lesson_detail.us_main_section";
	}
	
	@RequestMapping("lesson_buy/{lesson_no}")
	public String lesson_buy(Model model, @PathVariable int lesson_no) {
		
		AllLessonDTO dto = ttlesson_service.ttlesson_select(lesson_no);
		model.addAttribute("dto",dto);
		
		return "";
	}
}
