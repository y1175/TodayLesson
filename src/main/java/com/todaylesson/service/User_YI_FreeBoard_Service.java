package com.todaylesson.service;

import java.util.List;
import java.util.Map;

import com.todaylesson.DTO.FreeBoardDTO;
import com.todaylesson.DTO.Freeboard_PageMaker;
import com.todaylesson.DTO.SQLjoin_Member_FreeBoardDTO;

public interface User_YI_FreeBoard_Service {

	public List<SQLjoin_Member_FreeBoardDTO> list(String search, String searchtxt, int startRow, int endRow);

	public SQLjoin_Member_FreeBoardDTO freeboard_detail(int freeboard_no);

	public int totalCount(String search, String searchtxt);

	


	
	
}
