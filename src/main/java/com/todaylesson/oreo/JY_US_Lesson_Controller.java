package com.todaylesson.oreo;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.common.util.concurrent.ExecutionError;
import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.service.JY_US_LessonService;


@Controller
public class JY_US_Lesson_Controller {

	
	@Resource(name="lessonservice")
	private JY_US_LessonService lessonservice;

	 
	
	@RequestMapping("/lesson_list/{member_id}")
	public String list(Model model,@PathVariable String member_id){
		int senior_no = lessonservice.select_senior_no(member_id);
		List<LessonDTO> list = lessonservice.list(senior_no);
		model.addAttribute("list",list);
	
		return "TodayLesson_SeniorPage/jy_sn_lesson_list";
	}
	
	
	
	@RequestMapping("/lesson_write/{member_id}")
	public String write(@PathVariable String member_id,Model model) {
		int senior_no = lessonservice.select_senior_no(member_id);
		model.addAttribute("senior_no",senior_no);
		return "TodayLesson_SeniorPage/jy_sn_lesson_write";
	}
	
	@RequestMapping("/jusoPopup")
	public String jusoPopup() {
		return "TodayLesson_SeniorPage/jy_sn_jusoPopup";
	}	
	
	
	
	
	@RequestMapping("/insert_result")
	public String insertresult(LessonDTO dto, Model model) {
		
		System.out.println(dto.toString());
		
		if (dto.getLesson_type()==3) {
			int result =lessonservice.insert_Online_Lesson(dto);
			model.addAttribute("result",result);
		} else {
			int result =lessonservice.insert_Lesson(dto);
			model.addAttribute("result",result);
		}
		
		System.out.println("                     " +dto.toString());
					
		return "TodayLesson_SeniorPage/jy_sn_insert_result";
	}
	
	@RequestMapping("/lesson_detail/{lesson_no}")
	public String lesson_detail(@PathVariable int lesson_no, Model model) {
		LessonDTO dto = lessonservice.detail_lesson(lesson_no);
		model.addAttribute("dto",dto);
		return "TodayLesson_SeniorPage/jy_sn_lesson_detail";
	}
	
	@RequestMapping("/lesson_update/{lesson_no}")
	public String lesson_update(@PathVariable int lesson_no, Model model) {
		LessonDTO dto = lessonservice.detail_lesson(lesson_no);
		if (dto.getLesson_result() != 0) {
			return "TodayLesson_SeniorPage/jy_sn_lesson_can_not_update";
		} else {
			model.addAttribute("dto",dto);
			return "TodayLesson_SeniorPage/jy_sn_lesson_update";
		} 
	}
	
	@RequestMapping("/lesson_delete/{lesson_no}")
	public String lesson_delete(@PathVariable int lesson_no, Model model) {
		LessonDTO dto = lessonservice.detail_lesson(lesson_no);
		if (dto.getLesson_result() != 0) {
			return "TodayLesson_SeniorPage/jy_sn_lesson_can_not_delete";
		} else {
			int result = lessonservice.delete_lesson(lesson_no);
			model.addAttribute("result",result);
			return "TodayLesson_SeniorPage/jy_sn_delete_result";
		} 
	}
	
	
	
	@RequestMapping("/lesson_update_result")
	public String lesson_update_result (LessonDTO dto, Model model) {
		
		int result = lessonservice.update_lesson(dto);
		model.addAttribute("result",result);
		return "TodayLesson_SeniorPage/jy_sn_update_result";
	}

	
	
	
}
