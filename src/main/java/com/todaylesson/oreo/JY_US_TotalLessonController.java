package com.todaylesson.oreo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.json.JSONArray;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.todaylesson.DTO.AllLessonDTO;
import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.Lesson_qaDTO;
import com.todaylesson.DTO.MyLikeDTO;
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
		
		return "TodayLesson_UserPage/jy_us_lesson_buy.us_main_section";
	}
	
	@ResponseBody
	@RequestMapping("lesson_like")
	public void lesson_like(@RequestParam(value="lesson_no") int lesson_no
			,@RequestParam(value="member_id") String member_id){
		
		MyLikeDTO dto = new MyLikeDTO();
		dto.setLesson_no(lesson_no);
		dto.setMember_id(member_id);
		
		ttlesson_service.add_like_lesson(dto);
		
	}
	@ResponseBody
	@RequestMapping("lesson_cart")
	public void lesson_cart(@RequestParam(value="lesson_no") int lesson_no
			,@RequestParam(value="member_id") String member_id){
		
		MyLikeDTO dto = new MyLikeDTO();
		dto.setLesson_no(lesson_no);
		dto.setMember_id(member_id);
		
		ttlesson_service.add_cart_lesson(dto);
		
	}
	
	
	@ResponseBody
	@RequestMapping("lesson_detail/{lesson_no}/lesson_reply_insert.do")
	public String lesson_reply_insert(@PathVariable int lesson_no, @RequestParam String member_id, @RequestParam String lesson_qa_reply_secret, @RequestParam String lesson_qa_reply_password, @RequestParam String lesson_qa_reply_content) {
		
		Lesson_qaDTO dto = new Lesson_qaDTO();
		
		dto.setLesson_no(lesson_no);
		dto.setMember_id(member_id);
		dto.setLesson_qa_reply_secret(lesson_qa_reply_secret);
		dto.setLesson_qa_reply_password(lesson_qa_reply_password);
		dto.setLesson_qa_reply_content(lesson_qa_reply_content);
		
			int result = ttlesson_service.add_lesson_reply(dto);
			if (result > 0) {
				return "success";
			} else {
				return "false";
			}
		
	}
		
	
	@ResponseBody
	@RequestMapping(value="lesson_detail/{lesson_no}/lesson_reply_list.do",produces="application/json; charset=utf8")
	public ResponseEntity lesson_reply_list(@PathVariable int lesson_no){
		
		HttpHeaders responseHeaders = new HttpHeaders();
		
		ArrayList<HashMap> rplist = new ArrayList<HashMap>();
		
		Lesson_qaDTO dto = new Lesson_qaDTO();
		dto.setLesson_no(lesson_no);
		
		List<Lesson_qaDTO> lesson_reply_list = ttlesson_service.select_lesson_reply(dto);
	
		if (lesson_reply_list.size() > 0) {
			for (int i = 0; i < lesson_reply_list.size(); i++) {
				HashMap hm = new HashMap<>();
				if (lesson_reply_list.get(i).getLesson_qa_reply_secret().equals('Y')) {
					hm.put("lesson_qa_reply_content", "작성자와 시니어만 확인할 수 있습니다.");
					hm.put("member_id","비밀 댓글입니다.");
					hm.put("lesson_qa_register_date", lesson_reply_list.get(i).getLesson_qa_register_date());

				} else {
				hm.put("lesson_qa_reply_content", lesson_reply_list.get(i).getLesson_qa_reply_content());
				hm.put("lesson_qa_register_date", lesson_reply_list.get(i).getLesson_qa_register_date());
				hm.put("member_id", lesson_reply_list.get(i).getMember_id());
				}
				rplist.add(hm);
			}
		}
		
		JSONArray json = new JSONArray(rplist);
		
		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
	
	
	
	
	
	
}
