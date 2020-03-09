package com.todaylesson.oreo;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.todaylesson.DTO.AllLessonDTO;
import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.service.JY_Admin_LessonService;

@Controller
public class JY_Admin_Lesson_Controller {

	
	@Resource(name="adminservice")
	private JY_Admin_LessonService adminservice;
	
	// 전체 레슨 조회
	@RequestMapping("alllesson")
	public String all_lesson(Model model) {
		List<AllLessonDTO> list = adminservice.all_lesson();
		model.addAttribute("list",list);
		return "TodayLesson_AdminPage/jy_ad_all_lesson";
	}
	
	
	// 승인이 필요한 레슨들 조회
	@RequestMapping("wait_lesson")
	public String wait_lesson(Model model) {
		List<AllLessonDTO> list = adminservice.wait_lesson();
		model.addAttribute("list",list);
		return "TodayLesson_AdminPage/jy_ad_wait_lesson";
	}
	


	//승인 해줘야하는 레슨 디테일
	@RequestMapping("admin_wait_lesson_detail/{lesson_no}")
	public String wait_lesson_detail(Model model, @PathVariable int lesson_no) {	
		// 선택한 레슨에 대한 정보
		AllLessonDTO dto = adminservice.select_lesson(lesson_no);
		// 레슨을 신청한 사람에 대한 정보
		///int senior_no = dto.getSenior_no();
		//List<LessonDTO> list = adminservice.select_lesson_list(senior_no);
				
		model.addAttribute("dto",dto);
		//model.addAttribute("list",list);
		
		return "TodayLesson_AdminPage/jy_ad_wait_lesson_detail";
	}
	
	
	//레슨 디테일
	@RequestMapping("admin_lesson_detail/{lesson_no}")
	public String detail_lesson(Model model, @PathVariable int lesson_no) {	
		// 선택한 레슨에 대한 정보
		AllLessonDTO dto = adminservice.select_lesson(lesson_no);
		// 레슨을 신청한 사람에 대한 정보
		///int senior_no = dto.getSenior_no();
		//List<LessonDTO> list = adminservice.select_lesson_list(senior_no);
				
		model.addAttribute("dto",dto);
		//model.addAttribute("list",list);
		
		return "TodayLesson_AdminPage/jy_ad_lesson_detail";
	}
	
	
	@RequestMapping("lesson_result_update/{lesson_no}")
	public String lesson_result_update(@PathVariable int lesson_no,Model model) {
		model.addAttribute("lesson_no",lesson_no);
		return "TodayLesson_AdminPage/jy_ad_lesson_result_update";
	}
	
	@RequestMapping("lesson_approve/{lesson_no}")
	public String lesson_approve(@PathVariable int lesson_no, Model model) {
		int result = adminservice.approve(lesson_no);
		model.addAttribute("result",result);
		return "TodayLesson_AdminPage/jy_ad_lesson_approve";
	}
	
	
	
	@RequestMapping("lesson_reject/{lesson_no}")
	public String lesson_reject(@PathVariable int lesson_no, Model model) {
		int result = adminservice.reject(lesson_no);
		model.addAttribute("result",result);
		return "TodayLesson_AdminPage/jy_ad_lesson_reject";
	}
	
	
}
