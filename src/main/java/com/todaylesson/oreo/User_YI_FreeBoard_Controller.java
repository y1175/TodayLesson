package com.todaylesson.oreo;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.todaylesson.DTO.FreeBoardDTO;
import com.todaylesson.DTO.Freeboard_Pager;
import com.todaylesson.DTO.SQLjoin_Member_FreeBoardDTO;
import com.todaylesson.service.User_YI_FreeBoard_Service;

@Controller
public class User_YI_FreeBoard_Controller {

	@Resource(name="user_YI_FreeBoard_Service")
	private User_YI_FreeBoard_Service service;
	
	@RequestMapping(value="/freeboard", method=RequestMethod.GET)
	public String list(
			@RequestParam(defaultValue="title") String searchOption
			,@RequestParam(defaultValue="") String keyword
			,@RequestParam(defaultValue="1") int curPage 
			,Model model)throws Exception
	{
		// 레코드 갯수 계산
		int count= service.countArticle(searchOption, keyword);
		
		// 페이지 나누기 관련 처리
		Freeboard_Pager boardPager= new Freeboard_Pager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		
		
		List<SQLjoin_Member_FreeBoardDTO> list
				=service.freeboard_list(start,end,searchOption,keyword);
		
		model.addAttribute("list",list);
		model.addAttribute("count",count);
		model.addAttribute("searchOption",searchOption);
		model.addAttribute("keyword",keyword);
		model.addAttribute("boardPager",boardPager);
		
		return "yi_freeboard";
	}
	
	@RequestMapping("/detail/{freeboard_no}")
	public String detail(@PathVariable int freeboard_no,Model model)
	{
		SQLjoin_Member_FreeBoardDTO dto= service.freeboard_detail(freeboard_no);
		model.addAttribute("dto",dto);
		return "yi_freeboard_detail";
	}
}
