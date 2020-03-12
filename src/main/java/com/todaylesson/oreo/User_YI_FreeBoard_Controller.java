package com.todaylesson.oreo;


import java.util.ArrayList;
import java.util.List;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.todaylesson.DTO.PageMaker;
import com.todaylesson.DTO.BoardReplyDTO;
import com.todaylesson.DTO.NoticeDTO;
import com.todaylesson.DTO.SQLjoin_Member_FreeBoardDTO;
import com.todaylesson.service.User_YI_FreeBoard_Service;

@Controller
public class User_YI_FreeBoard_Controller {

	@Resource(name="user_YI_FreeBoard_Service")
	private User_YI_FreeBoard_Service service;
	//리스트
	@RequestMapping(value="/freeboard")
	public String getBoardList(
			@RequestParam(required=false, defaultValue="") String search
			,@RequestParam(required=false, defaultValue="") String searchtxt
			,@RequestParam(required=false, defaultValue="1") int currPage
			,@RequestParam(required=false, defaultValue="1") int hidden_freeboard_no
			,Model model)  {
		
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

		
		return "TodayLesson_UserPage/yi_freeboard";
	}
		
	//글 상세보기
	@RequestMapping("/freeboard_detail/{freeboard_no}")
	public String detail(@PathVariable int freeboard_no,Model model)
	{	
		service.freeboard_readnoUp(freeboard_no);
		SQLjoin_Member_FreeBoardDTO dto= service.freeboard_detail(freeboard_no);
		
		List<SQLjoin_Member_FreeBoardDTO> list=service.boardreply_list(freeboard_no);
		model.addAttribute("rep_list",list);
		
		
		model.addAttribute("dto",dto);
		return "TodayLesson_UserPage/yi_freeboard_detail";
	}
	//글 쓰기
	@RequestMapping("/freeboard_insert")
	public String freeboard_insert()
	{
		return "TodayLesson_UserPage/yi_freeboard_insert";
	}
	//글 쓰기
	@RequestMapping("/freeboard_insertresult")
	public String freeboard_insertresult(@RequestParam String member_id
			,@RequestParam String freeboard_title
			,@RequestParam String freeboard_content
			,@RequestParam int freeboard_category
			,Model model)
	{
		SQLjoin_Member_FreeBoardDTO dto=new SQLjoin_Member_FreeBoardDTO();
		dto.setMember_id(member_id);
		dto.setFreeboard_title(freeboard_title);
		dto.setFreeboard_content(freeboard_content);
		dto.setFreeboard_category(freeboard_category);
		int result=service.freeboard_insert(dto);
		
		model.addAttribute("result",result);
		
		return "TodayLesson_UserPage/yi_freeboard_insertresult";
	}
	//게시글 수정
	@RequestMapping("/freeboard_modify/{freeboard_no}")
	public String boardModifyForm(@PathVariable int freeboard_no,Model model)
	{
		SQLjoin_Member_FreeBoardDTO dto =service.modify_placehold(freeboard_no);
		model.addAttribute("dto",dto);
		return "TodayLesson_UserPage/yi_freeboard_modify";
	}
	//게시글 수정
	@RequestMapping("/freeboard_modifyresult")
	public String boardModifyresult(@RequestParam String member_id
								   ,@RequestParam int freeboard_no
								   ,@RequestParam int freeboard_category
								   ,@RequestParam String freeboard_title
								   ,@RequestParam String freeboard_content
								   ,Model model)
	{
		SQLjoin_Member_FreeBoardDTO dto = new SQLjoin_Member_FreeBoardDTO();
		dto.setMember_id(member_id);
		dto.setFreeboard_category(freeboard_category);
		dto.setFreeboard_content(freeboard_content);
		dto.setFreeboard_title(freeboard_title);
		dto.setFreeboard_no(freeboard_no);				
		int result=service.modify_result(dto);
		
		model.addAttribute("result",result);
		
		return "TodayLesson_UserPage/yi_freeboard_modifyresult";
	}
	
	//게시글 삭제
	@RequestMapping("/freeboard_delete/{freeboard_no}")
	public String boardDelete(@PathVariable int freeboard_no,Model model) 
	{
		int result=service.freeboard_delete(freeboard_no);
		model.addAttribute("result",result);
		return "TodayLesson_UserPage/yi_freeboard_delresult";
	}
	
	//리플창 json . 사용 보류
	@ResponseBody
	@RequestMapping("/freeboard_detailjson/{freeboard_no}")
	public SQLjoin_Member_FreeBoardDTO detailjson(@PathVariable int freeboard_no
			,@RequestParam String boardreply_content
			,@RequestParam String member_id
			,Model model)
	{
		SQLjoin_Member_FreeBoardDTO dto = new SQLjoin_Member_FreeBoardDTO();
		
		String member_nick=service.getNick_reply(member_id);
		
		dto.setFreeboard_no(freeboard_no);
		dto.setMember_id(member_id);
		dto.setMember_nick(member_nick);
		dto.setBoardreply_content(boardreply_content);
		
		
		int insertResult=service.insert_reply(dto);

		return dto;
	}
	//댓글 달기
	@RequestMapping("/insert_boardreply/")
	public String insert_reply(@RequestParam int freeboard_no
			,@RequestParam String boardreply_content
			,@RequestParam String member_id
			,Model model)
	{
		SQLjoin_Member_FreeBoardDTO dto = new SQLjoin_Member_FreeBoardDTO();
		dto.setFreeboard_no(freeboard_no);
		dto.setMember_id(member_id);
		dto.setBoardreply_content(boardreply_content);
		
		int insertResult=service.insert_reply(dto);
		model.addAttribute("insertResult",insertResult);
		model.addAttribute("freeboard_no",freeboard_no);
		
		return "/TodayLesson_UserPage/yi_boardreply_insertresult";
	}
	//댓글 삭제
	@RequestMapping("/boardreply_delete/{boardreply_no}")
	public String replydelete(@PathVariable int boardreply_no,Model model)
	{
		int deleteResult=service.delete_reply(boardreply_no);
		model.addAttribute("deleteResult",deleteResult);
		
		return "/TodayLesson_UserPage/yi_boardreply_delresult";
	}
	//공지 보기
	@RequestMapping("/notice_detail/{notice_no}")
	public String notice_detail(@PathVariable int notice_no,Model model)
	{	
		service.notice_readnoUp(notice_no);
		NoticeDTO dto= service.notice_detail(notice_no);
		model.addAttribute("dto",dto);
		return "TodayLesson_UserPage/yi_notice_detail";
	}
	
	//@RequestMapping("/boardreply_delete")


}
