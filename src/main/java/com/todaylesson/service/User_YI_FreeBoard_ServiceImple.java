package com.todaylesson.service;

import java.util.HashMap;
import java.util.List;


import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.todaylesson.DTO.BoardReplyDTO;
import com.todaylesson.DTO.NoticeDTO;
import com.todaylesson.DTO.SQLjoin_Member_FreeBoardDTO;
import com.todaylesson.Mapper.User_YI_FreeBoard_Mapper;

@Service(value="user_YI_FreeBoard_Service")
public class User_YI_FreeBoard_ServiceImple implements User_YI_FreeBoard_Service {

	//@Resource(name="user_YI_FreeBoard_Mapper")
	@Inject
	private User_YI_FreeBoard_Mapper mapper;

	//페이징 카운트
	@Override
	public int totalCount(String search, String searchtxt) {
		HashMap<String, Object> hm=new HashMap<String, Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		return mapper.getCount(hm);
	}
	
	//게시물 전체보기
	@Override
	public List<SQLjoin_Member_FreeBoardDTO> list(String search, String searchtxt, int startRow, int endRow) {
		HashMap<String, Object> hm=new HashMap<String, Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("startrow", startRow);
		hm.put("endrow", endRow);
		return mapper.list(hm);
	}

	//게시물 상세보기
	@Override
	public SQLjoin_Member_FreeBoardDTO freeboard_detail(int freeboard_no) {
		// TODO Auto-generated method stub
		return mapper.freeboard_detail(freeboard_no);
	}

	//조회수 증가
	@Override
	public void freeboard_readnoUp(int freeboard_no) {
		mapper.freeboard_readnoUp(freeboard_no);
		
	}

	@Override
	public List<NoticeDTO> notice() {
		// TODO Auto-generated method stub
		return mapper.notice();
	}

	@Override
	public void notice_readnoUp(int notice_no) {
		// TODO Auto-generated method stub
		mapper.notice_readnoUp(notice_no);
	}

	@Override
	public NoticeDTO notice_detail(int notice_no) {
		// TODO Auto-generated method stub
		return mapper.notice_detail(notice_no);
	}

	@Override
	public SQLjoin_Member_FreeBoardDTO rep_detail(int freeboard_no) {
		// TODO Auto-generated method stub
		return mapper.rep_detail(freeboard_no);
	}

	@Override
	public void insert_reply(SQLjoin_Member_FreeBoardDTO dto) {
		// TODO Auto-generated method stub
		
	}


}
