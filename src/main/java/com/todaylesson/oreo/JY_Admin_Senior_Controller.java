package com.todaylesson.oreo;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.todaylesson.DTO.AllLessonDTO;
import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.SeniorDTO;
import com.todaylesson.service.JY_Admin_SeniorService;

@Controller
public class JY_Admin_Senior_Controller {

	
	@Resource(name="ad_senior_service")
	private JY_Admin_SeniorService ad_senior_service;
	
	// 전체시니어 목록
	@RequestMapping("all_senior")
	public String all_senior(Model model) {
		
		List<SeniorDTO> list = ad_senior_service.all_senior();
		model.addAttribute("list",list);
		
		return "TodayLesson_AdminPage/jy_ad_senior_list";
	}
	
	// 시니어 상세페이지
	@RequestMapping("select_senior/{senior_no}")
	public String select_senior(@PathVariable int senior_no,Model model) {
		List<LessonDTO> list = ad_senior_service.senior_lesson(senior_no);	
		SeniorDTO dto = ad_senior_service.select_senior(senior_no);
		model.addAttribute("list",list);
		model.addAttribute("dto",dto);
		return "TodayLesson_AdminPage/jy_ad_senior_select";
	}
	
}
