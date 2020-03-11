package com.todaylesson.oreo;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.todaylesson.DTO.PageMaker;
import com.todaylesson.DTO.Question_1_1DTO;
import com.todaylesson.service.Admin_HM_QuestionService;

@Controller
public class Admin_HM_Question_Controller {

	
	@Resource(name="admin_hm_questionservice")
	private Admin_HM_QuestionService service;
	
	//1:1문의 관리페이지로 가기
	@RequestMapping("/hm_ad_question")
	private String hm_ad_question(
			@RequestParam(required=false, defaultValue="") String search
			,@RequestParam(required=false, defaultValue="") String searchtxt
			,@RequestParam(required=false, defaultValue="1") int currPage
			,Model model)
	{
		int totalCount= service.hmtotalCount(search, searchtxt);
		int pageSize=15;
		int blockSize=5;
		
		PageMaker page = new PageMaker(currPage, totalCount, pageSize, blockSize);
		
		
		
		List<Question_1_1DTO> list = service.hm_ad_questionlist(search,searchtxt,page.getStartRow()
				,page.getEndRow());
		model.addAttribute("list",list);
		model.addAttribute("page",page);
		model.addAttribute("search",search);
		model.addAttribute("searchtxt",searchtxt);
		
		System.out.println(search);
		System.out.println(searchtxt);
		System.out.println(totalCount);
		
		return "/TodayLesson_AdminPage/hm_ad_question.hs_ad_main_section";
	}

	@RequestMapping("/hm_ad_question_detail/{no}")
	private String hm_ad_question_detail(@PathVariable int no, Model model)
	{
		int question_no = no;
		System.out.println(question_no);
		Question_1_1DTO dto = service.hm_ad_question_detail(question_no);
		model.addAttribute("dto",dto);
		
		return "/TodayLesson_AdminPage/hm_ad_question_detail.hs_ad_main_section";
		
	}
	
	@RequestMapping("/hm_ad_question_update/{no}")
	private String hm_ad_question_update(@PathVariable int no
								,@RequestParam("question_answer") String question_answer)
	{
		int question_no = no;
		System.out.println(question_no);
		System.out.println(question_answer);
		HashMap<String, Object>map = new HashMap<>();
		map.put("question_no", question_no);
		map.put("question_answer", question_answer);
		
		service.hm_ad_question_update(map);
		
		
		return "/TodayLesson_AdminPage/hm_ad_question_detail.hs_ad_main_section";
	}
}
