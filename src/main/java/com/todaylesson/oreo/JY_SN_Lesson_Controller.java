package com.todaylesson.oreo;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.common.util.concurrent.ExecutionError;
import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.SeniorDTO;
import com.todaylesson.service.Hm_Us_MailSendService;
import com.todaylesson.service.JY_Admin_LessonService;
import com.todaylesson.service.JY_SN_LessonService;
import com.todaylesson.service.JY_US_SeniorService;


@Controller
public class JY_SN_Lesson_Controller {

	
	@Resource(name="lessonservice")
	private JY_SN_LessonService lesson_service;
	
	   

	@RequestMapping("/lesson_list/{member_id}")
	public String list(Model model,@PathVariable String member_id){
		int senior_no = lesson_service.select_senior_no(member_id);
		SeniorDTO dto = lesson_service.select_senior_info(senior_no);
		
		if (dto.getSenior_nick() == null) {
			
			return "TodayLesson_SeniorPage/jy_sn_senior_info_null";

		} else {
		
		List<LessonDTO> list = lesson_service.list(senior_no);
		model.addAttribute("list",list);
	
		return "TodayLesson_SeniorPage/jy_sn_lesson_list";
		}
	}
	
	
	
	@RequestMapping("/lesson_write/{member_id}")
	public String write(@PathVariable String member_id,Model model) {
		int senior_no = lesson_service.select_senior_no(member_id);
		List<LessonDTO> list = lesson_service.reject_lesson_list(senior_no);
		if (list.size() > 5) {
			return "TodayLesson_SeniorPage/jy_sn_you_cant_write_lesson";
		} else {
			model.addAttribute("senior_no",senior_no);
			return "TodayLesson_SeniorPage/jy_sn_lesson_write";
		}
	}
	
	@RequestMapping("/jusoPopup")
	public String jusoPopup() {
		return "TodayLesson_SeniorPage/jy_sn_jusoPopup";
	}	
	
	
	
	
	@RequestMapping("/insert_result")
	public String insertresult(LessonDTO dto, Model model) {
		
		System.out.println(dto.toString());
		
			int result =lesson_service.insert_Lesson(dto);
			model.addAttribute("result",result);
		
		System.out.println("                     " +dto.toString());
					
		return "TodayLesson_SeniorPage/jy_sn_insert_result";
	}
	
	@RequestMapping("/my_lesson_detail/{lesson_no}")
	public String lesson_detail(@PathVariable int lesson_no, Model model) {
		LessonDTO dto = lesson_service.detail_lesson(lesson_no);
		model.addAttribute("dto",dto);
		return "TodayLesson_SeniorPage/jy_sn_lesson_detail";
	}
	
	@RequestMapping("/lesson_update/{lesson_no}")
	public String lesson_update(@PathVariable int lesson_no, Model model) {
		LessonDTO dto = lesson_service.detail_lesson(lesson_no);
		if (dto.getLesson_result() != 0) {
			return "TodayLesson_SeniorPage/jy_sn_lesson_can_not_update";
		} else {
			model.addAttribute("dto",dto);
			return "TodayLesson_SeniorPage/jy_sn_lesson_update";
		} 
	}
	
	@RequestMapping("/lesson_delete/{lesson_no}")
	public String lesson_delete(@PathVariable int lesson_no, Model model) {
		LessonDTO dto = lesson_service.detail_lesson(lesson_no);
		if (dto.getLesson_result() != 0) {
			return "TodayLesson_SeniorPage/jy_sn_lesson_can_not_delete";
		} else {
			int result = lesson_service.delete_lesson(lesson_no);
			model.addAttribute("result",result);
			return "TodayLesson_SeniorPage/jy_sn_delete_result";
		} 
	}
	
	
	
	@RequestMapping("/lesson_update_result")
	public String lesson_update_result (LessonDTO dto, Model model) {
		
		int result = lesson_service.update_lesson(dto);
		model.addAttribute("result",result);
		
		return "TodayLesson_SeniorPage/jy_sn_update_result";
	}

	
	
	
}
