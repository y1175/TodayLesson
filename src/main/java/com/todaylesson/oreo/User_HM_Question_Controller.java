
package com.todaylesson.oreo;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.todaylesson.DTO.PageMaker;
import com.todaylesson.DTO.Question_1_1DTO;
import com.todaylesson.service.User_HM_Question_Service;

@Controller
@RequestMapping("/todaylessonmypage/")
public class User_HM_Question_Controller {

	
	@Resource(name="user_hm_question_service")
	private User_HM_Question_Service service;
	
	@RequestMapping("/hm_us_question")
	private String hm_us_question(Authentication authentication
			,@RequestParam(required=false, defaultValue="1") int currPage
			, Model model)
	{
		//현재 로그인한 사람의 아이디값을 시큐리티로 받아오기
		UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
		String member_id = userDetails.getUsername();
		
		//총 게시글 수
				int totalCount= service.totalCount(member_id);
				int pageSize=15;
				int blockSize=5;
				PageMaker page=new PageMaker(currPage,totalCount,pageSize,blockSize);
				
		List<Question_1_1DTO> list = service.hm_question_list(member_id
				,page.getStartRow()
				,page.getEndRow());
		model.addAttribute("list",list);
		model.addAttribute("page",page);
	
		return "/TodayLesson_UserPage/hm_us_question.us_my_section";
		
	}
	

	//문의 등록페이지 이동
	@RequestMapping("/hm_question_insert")
	private String hm_question_insert()
	{
		
		return "/TodayLesson_UserPage/hm_us_question_insert.us_my_section";
	}
	
	@RequestMapping("/hm_question_create")
	private String hm_question_create(
			Authentication authentication
			,@RequestParam("question_group") int question_group
			,@RequestParam("question_title") String question_title
			,@RequestParam("question_content") String question_content
			,@RequestParam(required=false, defaultValue="1") int currPage
			,Model model)
	{
		UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
		String member_id = userDetails.getUsername();
		HashMap<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("question_group", question_group);
		map.put("question_title", question_title);
		map.put("question_content", question_content);
		
		service.hm_question_insert(map);
		
		int totalCount= service.totalCount(member_id);
		int pageSize=15;
		int blockSize=5;
		PageMaker page=new PageMaker(currPage,totalCount,pageSize,blockSize);
		
List<Question_1_1DTO> list = service.hm_question_list(member_id
		,page.getStartRow()
		,page.getEndRow());
model.addAttribute("list",list);
model.addAttribute("page",page);
		
		return "/TodayLesson_UserPage/hm_us_question.us_my_section";

	}
	
	@RequestMapping("/hm_us_question_detail/{no}")
	private String hm_us_question_detail(@PathVariable int no , Model model)
	{
		int question_no = no;
		Question_1_1DTO dto = service.hm_question_detail(question_no);
		model.addAttribute("dto",dto);
		
		
		return "/TodayLesson_UserPage/hm_us_question_detail.us_my_section";
		
	}
	

	@RequestMapping("/hm_us_question_delete/{no}")
	private String hm_us_question_delete(@PathVariable int no, Model model)
	{
		int question_no = no;
		
		int result = service.questiondelete(question_no);
		model.addAttribute("result",result);
		
		return "/TodayLesson_UserPage/hm_us_question_deleteresult";
		
	}
	
	
}