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
			,Model model) throws Exception {
		
	Pattern p=Pattern.compile("(^[0-9]*$)");
		if(search=="member_nick"|| "member_nick".equals(search))
		{
			Matcher m=p.matcher(searchtxt);
			if(!m.find())
			{
				searchtxt="";
				model.addAttribute("searchtxt","");
				
			}
			else
			{
				model.addAttribute("searchtxt",searchtxt);
				
			}
		}
		
		int totalCount= service.totalCount(search, searchtxt);
		int pageSize=15;
		int blockSize=5;
		
		
		Freeboard_PageMaker page=new Freeboard_PageMaker(currPage,totalCount,pageSize,blockSize);
		List<SQLjoin_Member_FreeBoardDTO> list=service.list(search, searchtxt
										,page.getStartRow()
										,page.getEndRow());
		
			model.addAttribute("list",list);
			model.addAttribute("page",page);
/*			model.addAttribute("search",search);
			model.addAttribute("searchtxt",searchtxt);*/
		
		return "TodayLesson_UserPage/yi_freeboard";
	}
		

	@RequestMapping("/detail/{freeboard_no}")
	public String detail(@PathVariable int freeboard_no,Model model)
	{
		SQLjoin_Member_FreeBoardDTO dto= service.freeboard_detail(freeboard_no);
		model.addAttribute("dto",dto);
		return "TodayLesson_UserPage/yi_freeboard_detail";
	}


}
