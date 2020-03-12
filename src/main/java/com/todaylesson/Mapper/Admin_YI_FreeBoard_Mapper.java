package com.todaylesson.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.NoticeDTO;
import com.todaylesson.DTO.SQLjoin_Member_FreeBoardDTO;

@Mapper
public interface Admin_YI_FreeBoard_Mapper {

	int getCount(HashMap<String, Object> hm);

	List<SQLjoin_Member_FreeBoardDTO> list(HashMap<String, Object> hm);

	List<NoticeDTO> notice();

	int freeboard_replycount(int hidden_freeboard_no);

}
