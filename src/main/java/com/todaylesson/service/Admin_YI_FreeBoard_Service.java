package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.NoticeDTO;
import com.todaylesson.DTO.SQLjoin_Member_FreeBoardDTO;

public interface Admin_YI_FreeBoard_Service {

	int totalCount(int category,String search, String searchtxt);

	List<SQLjoin_Member_FreeBoardDTO> list(int category,String search, String searchtxt,  int startRow, int endRow);

	List<NoticeDTO> notice();

	int freeboard_replycount(int freeboard_no);

	int notice_insert(NoticeDTO dto);

	List<SQLjoin_Member_FreeBoardDTO> boardreply_list(int freeboard_no);

	void del_replyajax(int boardreply_no);

	int admin_replyinsert(SQLjoin_Member_FreeBoardDTO dto);

	int admin_boarddelete(int freeboard_no);

	NoticeDTO noticeModifyPlacehold(int notice_no);
	
	int admin_noticemodify(NoticeDTO dto);

	int admin_noticedelete(int notice_no);

	

}
