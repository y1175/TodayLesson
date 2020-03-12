package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.NoticeDTO;
import com.todaylesson.DTO.SQLjoin_Member_FreeBoardDTO;

public interface Admin_YI_FreeBoard_Service {

	int totalCount(String search, String searchtxt);

	List<SQLjoin_Member_FreeBoardDTO> list(String search, String searchtxt, int startRow, int endRow);

	List<NoticeDTO> notice();

	int freeboard_replycount(int freeboard_no);

}
