package com.todaylesson.service;

import java.util.List;
import java.util.Map;

import com.todaylesson.DTO.FreeBoardDTO;
import com.todaylesson.DTO.Freeboard_PageMaker;
import com.todaylesson.DTO.NoticeDTO;
import com.todaylesson.DTO.SQLjoin_Member_FreeBoardDTO;

public interface User_YI_FreeBoard_Service {
	//페이징 카운트
	public int totalCount(String search, String searchtxt);
	//게시물 전체보기
	public List<SQLjoin_Member_FreeBoardDTO> list(String search, String searchtxt, int startRow, int endRow);
	//게시물 상세보기
	public SQLjoin_Member_FreeBoardDTO freeboard_detail(int freeboard_no);
	//조회수 증가
	public void freeboard_readnoUp(int freeboard_no);
	public List<NoticeDTO> notice();
	public void notice_readnoUp(int notice_no);
	public NoticeDTO notice_detail(int notice_no);

	


	
	
}
