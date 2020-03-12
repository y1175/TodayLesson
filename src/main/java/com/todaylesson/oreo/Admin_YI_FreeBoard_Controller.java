package com.todaylesson.oreo;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.todaylesson.DTO.NoticeDTO;
import com.todaylesson.DTO.PageMaker;
import com.todaylesson.DTO.SQLjoin_Member_FreeBoardDTO;
import com.todaylesson.service.Admin_YI_FreeBoard_Service;

@Controller
public class Admin_YI_FreeBoard_Controller {

	@Resource(name="admin_YI_FreeBoard_Service")
	private Admin_YI_FreeBoard_Service service;
	
	@RequestMapping("/admin_freeboard")
	public String admin_freeboard_list(@RequestParam(required=false, defaultValue="") String search
			,@RequestParam(required=false, defaultValue="") String searchtxt
			,@RequestParam(required=false, defaultValue="1") int currPage
			,@RequestParam(required=false, defaultValue="1") int hidden_freeboard_no
			,Model model)
	{
		
		//총 게시글 수
				int totalCount= service.totalCount(search, searchtxt);
				int pageSize=15;
				int blockSize=5;
				
				
				PageMaker page=new PageMaker(currPage,totalCount,pageSize,blockSize);
				
				//공지 리스트
				List<NoticeDTO> notice=service.notice();
				model.addAttribute("notice",notice);
				
				
				//게시물 리스트
				List<SQLjoin_Member_FreeBoardDTO> list=service.list(search, searchtxt
												,page.getStartRow()
												,page.getEndRow());
				
				model.addAttribute("list",list);
				model.addAttribute("page",page);
				model.addAttribute("search",search);
				model.addAttribute("searchtxt",searchtxt);
				
				//게시물 옆 답글 숫자 표시
				List<Integer> replist=new ArrayList<>();
				for(int i=0; i<list.size();i++)
				{
					int replycount=service.freeboard_replycount(list.get(i).getFreeboard_no());
					replist.add(replycount);
				}
				
				
					model.addAttribute("replist",replist);
		
		return "/TodayLesson_AdminPage/yi_ad_freeboard";
	}
}
