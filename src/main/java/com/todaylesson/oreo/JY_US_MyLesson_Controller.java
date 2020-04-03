package com.todaylesson.oreo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.todaylesson.DTO.LessonCompDTO;
import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.LessonDetailDTO;
import com.todaylesson.DTO.LessonListDTO;
import com.todaylesson.DTO.MyLessonDTO;
import com.todaylesson.service.JY_US_MyLessonService;

@Controller
@RequestMapping("/todaylessonmypage/")
public class JY_US_MyLesson_Controller {

	@Autowired
	private JY_US_MyLessonService mlservice;

	@RequestMapping("my_lesson_list")
	public String my_lesson_list(Model model, Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String member_id = userDetails.getUsername();
		
		List<LessonDTO> lesson_list = mlservice.mylesson_list(member_id);
		
		List<Float> lesson_procent = new ArrayList();
		List<Integer> lesson_reward = new ArrayList();
		
		for (int i = 0; i < lesson_list.size(); i++) {
			int lesson_no = lesson_list.get(i).getLesson_no();
			float lesson_pro = mlservice.mylesson_procent(lesson_no, member_id);
			int lesson_rew = mlservice.mylesson_reward(lesson_no, member_id);
			lesson_procent.add(lesson_pro);
			lesson_reward.add(lesson_rew);
		}
				
		
		for (int i = 0; i < lesson_list.size(); i++) {
			float lesson_p = lesson_procent.get(i);
			int lesson_r = lesson_reward.get(i);

			lesson_list.get(i).setLesson_procent(lesson_p);
			lesson_list.get(i).setLesson_reward(lesson_r);

		}
		
		System.out.println(lesson_procent.toString());
		
		model.addAttribute("list", lesson_list);
		
		return "TodayLesson_UserPage/jy_us_my_lesson_list.us_main_section";
	}

	@RequestMapping("mylesson_detail/{lesson_no}")
	public String my_lesson_detail(@PathVariable int lesson_no, Model model, Authentication authentication) {

		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String member_id = userDetails.getUsername();

		List<LessonDetailDTO> list = mlservice.my_lesson_select(lesson_no, member_id);
				
		System.out.println(list.toString().toString());
		model.addAttribute("list", list);
		
		return "TodayLesson_UserPage/jy_us_my_lesson_detail.us_main_section";
		
	}
	

	@RequestMapping("select_lessondetail_this_chapter/{lessondetail_no}")
	public String my_lesson_detail_this_chapter(@PathVariable int lessondetail_no, Model model, Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String member_id = userDetails.getUsername();
	
		LessonDetailDTO dto = mlservice.mylesson_detail_this_chapter(lessondetail_no);

		int result = mlservice.i_click_this_lesson_chapter(lessondetail_no, member_id);

		int lesson_no = dto.getLesson_no();
		
		if (result == 0) {
			
			mlservice.click_this_lesson_chapter(lessondetail_no, member_id, lesson_no);
						
		} 
		
		
		String lesson_title = mlservice.mylesson_name(lesson_no);

		dto.setLesson_title(lesson_title);

		model.addAttribute("dto", dto);

		return "TodayLesson_UserPage/jy_us_select_lessondetail_this_chapter.us_main_section";

	}

	@RequestMapping("update_lesson_comp")
	public String update_lesson_comp(@RequestParam int lessondetail_no, @RequestParam int time_change,
			Authentication authentication, Model model, @RequestParam int lesson_no) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String member_id = userDetails.getUsername();

		int comp = mlservice.select_my_lesson_comp(lessondetail_no, member_id, lesson_no);
		
		if (comp == 0) {
		
			if (time_change == 0) {

				int result = mlservice.update_lesson_comp(lessondetail_no, member_id, lesson_no );
				model.addAttribute("result", result);
				model.addAttribute("member_id", member_id);
				model.addAttribute("lesson_no",lesson_no);
				return "TodayLesson_UserPage/jy_us_select_lessondetail_update_comp";

			} else {
				
				model.addAttribute("result", 0);
				model.addAttribute("member_id", member_id);
				model.addAttribute("lesson_no",lesson_no);
				return "TodayLesson_UserPage/jy_us_select_lessondetail_update_comp";
			}

		} else {
	
			List<LessonDetailDTO> list = mlservice.my_lesson_select(lesson_no, member_id);
			model.addAttribute("list", list);
			return "TodayLesson_UserPage/jy_us_my_lesson_detail.us_main_section";
	
		}
	}
	
	
	@ResponseBody
	@RequestMapping("reward_point")
	public String reward_point_to_member(Authentication authentication, @RequestParam int lesson_no) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String member_id = userDetails.getUsername();
		int ok = mlservice.reward_point_to_member(member_id, lesson_no);
		
		String result = "";
		
		if (ok > 0) {
			result = "success";
		} else {
			result = "false";
		}
		
		return result;
		
	}
}
