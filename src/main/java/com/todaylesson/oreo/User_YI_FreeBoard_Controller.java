package com.todaylesson.oreo;


import java.util.List;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;


import com.todaylesson.DTO.Freeboard_PageMaker;
import com.todaylesson.DTO.NoticeDTO;
import com.todaylesson.DTO.SQLjoin_Member_FreeBoardDTO;
import com.todaylesson.service.User_YI_FreeBoard_Service;

@Controller
public class User_YI_FreeBoard_Controller {

	@Resource(name="user_YI_FreeBoard_Service")
	private User_YI_FreeBoard_Service service;
	
	@RequestMapping(value="/freeboard")
	public String getBoardList(
			@RequestParam(required=false, defaultValue="") String search
			,@RequestParam(required=false, defaultValue="") String searchtxt
			,@RequestParam(required=false, defaultValue="1") int currPage
			,Model model)  {
		
		int totalCount= service.totalCount(search, searchtxt);
		int pageSize=15;
		int blockSize=5;
		
		
		Freeboard_PageMaker page=new Freeboard_PageMaker(currPage,totalCount,pageSize,blockSize);
		
		List<NoticeDTO> notice=service.notice();
		model.addAttribute("notice",notice);
		
		List<SQLjoin_Member_FreeBoardDTO> list=service.list(search, searchtxt
										,page.getStartRow()
										,page.getEndRow());
		
			model.addAttribute("list",list);
			model.addAttribute("page",page);
			model.addAttribute("search",search);
			model.addAttribute("searchtxt",searchtxt);
		
		System.out.println(search);
		System.out.println(searchtxt);
		System.out.println(totalCount);
		return "TodayLesson_UserPage/yi_freeboard";
	}
		

	@RequestMapping("/detail/{freeboard_no}")
	public String detail(@PathVariable int freeboard_no,Model model)
	{	
		service.freeboard_readnoUp(freeboard_no);
		SQLjoin_Member_FreeBoardDTO dto= service.freeboard_detail(freeboard_no);
		model.addAttribute("dto",dto);
		return "TodayLesson_UserPage/yi_freeboard_detail";
	}
	
	@RequestMapping("/notice_detail/{notice_no}")
	public String notice_detail(@PathVariable int notice_no,Model model)
	{	
		service.notice_readnoUp(notice_no);
		NoticeDTO dto= service.notice_detail(notice_no);
		model.addAttribute("dto",dto);
		return "TodayLesson_UserPage/yi_notice_detail";
	}


}
