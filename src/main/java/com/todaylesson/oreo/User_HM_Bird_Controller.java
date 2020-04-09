package com.todaylesson.oreo;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.todaylesson.DTO.CartDTO;
import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.MyLikeDTO;
import com.todaylesson.service.JY_US_TotalLessonService;
import com.todaylesson.service.User_HM_Bird_Service;

@Controller
@RequestMapping("/todaylesson/")
public class User_HM_Bird_Controller {

	@Resource(name="user_hm_bird_service")
	private User_HM_Bird_Service service;
	
	@Resource(name = "totallesson_service")
	private JY_US_TotalLessonService ttlesson_service;
	
	@RequestMapping("/hm_us_bird")
	public String hm_us_bird(Model model)
	{
		List<LessonDTO> list = service.bestlesson();
		List<LessonDTO> newbird = service.newbirdlesson();
		List<LessonDTO> endbird = service.endbirdlesson();
		
		model.addAttribute("list",list);
		model.addAttribute("newbird",newbird);
		model.addAttribute("endbird",endbird);
		return "/TodayLesson_UserPage/hm_us_bird.us_main_section";
	}
	
	
	@ResponseBody
	@RequestMapping("/hm_lesson_like")
	public String hm_lesson_like(@RequestParam(value = "lesson_no") int lesson_no,
			@RequestParam(value = "member_id") String member_id) {

		MyLikeDTO dto = new MyLikeDTO();
		dto.setLesson_no(lesson_no);
		dto.setMember_id(member_id);
		String result;
		List<MyLikeDTO> has_dto = ttlesson_service.has_like_lesson(dto);

		if (has_dto.isEmpty()) {
			ttlesson_service.add_like_lesson(dto);
			result = "success";
		} else {
			result = "false";
		}
		System.out.println(result);
		return result;

	}
	
	@ResponseBody
	@RequestMapping("/hm_lesson_cart")
	public String hm_lesson_cart(@RequestParam(value = "lesson_no") int lesson_no,
			@RequestParam(value = "member_id") String member_id) {

		CartDTO dto = new CartDTO();
		dto.setLesson_no(lesson_no);
		dto.setMember_id(member_id);
		String result;
		List<CartDTO> lesson_in_cart = ttlesson_service.has_cart_lesson(dto);
		if (lesson_in_cart.isEmpty()) {
			ttlesson_service.add_cart_lesson(dto);
			result = "success";
		} else {
			result = "false";
		}
		return result;
	}
	
	
	
}
