package com.todaylesson.oreo;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.todaylesson.DTO.NoticeDTO;
import com.todaylesson.DTO.PageMaker;
import com.todaylesson.DTO.SQLjoin_Member_FreeBoardDTO;
import com.todaylesson.service.Admin_YI_FreeBoard_Service;

@Controller
@RequestMapping("/todaylessonadmin/")
public class Admin_YI_FreeBoard_Controller {

	@Resource(name="admin_YI_FreeBoard_Service")
	private Admin_YI_FreeBoard_Service service;
	
	@RequestMapping("/admin_freeboard")
	public String admin_freeboard_list(
			@RequestParam(required=false, defaultValue="3") int category
			,@RequestParam(required=false, defaultValue="") String search
			,@RequestParam(required=false, defaultValue="") String searchtxt
			,@RequestParam(required=false, defaultValue="1") int currPage
			,@RequestParam(required=false, defaultValue="1") int hidden_freeboard_no
			
			,Model model)
	{
		
		//총 게시글 수
				int totalCount= service.totalCount(category,search, searchtxt);
				int pageSize=15;
				int blockSize=5;
				
				
				PageMaker page=new PageMaker(currPage,totalCount,pageSize,blockSize);
				
				//공지 리스트
				List<NoticeDTO> notice=service.notice();
				model.addAttribute("notice",notice);
				
				
				//게시물 리스트
				List<SQLjoin_Member_FreeBoardDTO> list=service.list(category,search, searchtxt
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
		
		return "/TodayLesson_AdminPage/yi_ad_freeboard.hs_ad_main_section";
	}
	
	@RequestMapping("/freeboard_noticewrite")
	public String admin_noticewrite()
	{
		return "/TodayLesson_AdminPage/yi_ad_freeboard_noticeinsert.hs_ad_main_section";
	}
	
	@RequestMapping("/freeboard_noticewriteResult")
	public String admin_noticewriteResult(
			@RequestParam String member_id
			,@RequestParam int notice_category
			,@RequestParam String notice_title
			,@RequestParam String notice_content
			,Model model)
	{
		
		NoticeDTO dto= new NoticeDTO();
		dto.setMember_id(member_id);
		dto.setNotice_category(notice_category);
		dto.setNotice_title(notice_title);
		dto.setNotice_content(notice_content);
		
		
		int result=service.notice_insert(dto);
		model.addAttribute("result",result);
		
		return "/TodayLesson_AdminPage/yi_ad_freeboard_noticeinsertResult";
	}
	
	@RequestMapping("/admin_noticemodify/{notice_no}")
	public String admin_noticemodify(@PathVariable int notice_no
			,Model model)
	{
		NoticeDTO dto=service.noticeModifyPlacehold(notice_no);
		model.addAttribute("dto",dto);
		
		return "/TodayLesson_AdminPage/yi_ad_freeboard_noticemodify.hs_ad_main_section";
	}
	
	
	@RequestMapping("/admin_noticemodifyresult/")
	public String admin_noticemodifyresult(@RequestParam int notice_no
			,@RequestParam String notice_title
			,@RequestParam String notice_content
			,@RequestParam String member_id,Model model)
	{
		NoticeDTO dto=new NoticeDTO();
		dto.setMember_id(member_id);
		dto.setNotice_title(notice_title);
		dto.setNotice_content(notice_content);
		dto.setNotice_no(notice_no);
		
		int result=service.admin_noticemodify(dto);
		model.addAttribute("result",result);
		return "/TodayLesson_AdminPage/yi_ad_freeboard_modifyresult.hs_ad_main_section";
	}
	
	@RequestMapping("/admin_noticedelete/{notice_no}")
	public String admin_noticedelete(@PathVariable int notice_no
			,Model model)
	{
		int result=service.admin_noticedelete(notice_no);
		model.addAttribute("result",result);
		return "/TodayLesson_AdminPage/yi_ad_freeboard_deleteresult";
	}
	
	
	@ResponseBody
	@RequestMapping("/freeboard_replyjson/{freeboard_no}")
	public List<SQLjoin_Member_FreeBoardDTO> detailjson(@PathVariable int freeboard_no
			,Model model)
	{
				List<SQLjoin_Member_FreeBoardDTO> list=service.boardreply_list(freeboard_no);
				model.addAttribute("rep_list",list);

		return list;
	}
	
	@ResponseBody
	@RequestMapping("/del_replyajax/{boardreply_no}")
	public void del_replyajax(@PathVariable int boardreply_no)
	{
		service.del_replyajax(boardreply_no);
	}
	
	@RequestMapping("/admin_replyinsert/{freeboard_no}")
	public String admin_replyinsert(@PathVariable int freeboard_no
			,@RequestParam String boardreply_content
			,@RequestParam String member_id
			, Model model)
	{
		SQLjoin_Member_FreeBoardDTO dto= new SQLjoin_Member_FreeBoardDTO();
		dto.setFreeboard_no(freeboard_no);
		dto.setBoardreply_content(boardreply_content);
		dto.setMember_id(member_id);
		int result=service.admin_replyinsert(dto);
		model.addAttribute("result",result);
		return "/TodayLesson_AdminPage/yi_ad_freeboard_replyinsertResult";
	}
	
	@RequestMapping("/admin_delete/{freeboard_no}")
	public String admin_boarddelete(@PathVariable int freeboard_no
			,Model model)
	{
		int result=service.admin_boarddelete(freeboard_no);
		model.addAttribute("result",result);
		return "/TodayLesson_AdminPage/yi_ad_freeboard_deleteresult";
	}
	

}
