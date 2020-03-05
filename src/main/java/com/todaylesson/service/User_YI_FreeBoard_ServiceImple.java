package com.todaylesson.service;

import java.util.HashMap;
import java.util.List;


import javax.annotation.Resource;


import org.springframework.stereotype.Service;

import com.todaylesson.DTO.SQLjoin_Member_FreeBoardDTO;
import com.todaylesson.Mapper.User_YI_FreeBoard_Mapper;

@Service(value="user_YI_FreeBoard_Service")
public class User_YI_FreeBoard_ServiceImple implements User_YI_FreeBoard_Service {

	@Resource(name="user_YI_FreeBoard_Mapper")
	private User_YI_FreeBoard_Mapper mapper;

	@Override
	public List<SQLjoin_Member_FreeBoardDTO> list(String search, String searchtxt, int startRow, int endRow) {
		HashMap<String, Object> hm=new HashMap<String, Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("startrow", startRow);
		hm.put("endrow", endRow);
		
		return mapper.list(hm);
	}



	@Override
	public SQLjoin_Member_FreeBoardDTO freeboard_detail(int freeboard_no) {
		// TODO Auto-generated method stub
		return mapper.freeboard_detail(freeboard_no);
	}



	@Override
	public int totalCount(String search, String searchtxt) {
		HashMap<String, Object> hm=new HashMap<String, Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		return mapper.getCount(hm);
	}




	//총 게시글 수 확인
	/*@Override
	public int getBoardListCnt() throws Exception {
		// TODO Auto-generated method stub
		return mapper.getBoardListCnt();

	}

	@Override
	public Object getBoardList(Freeboard_PageMaker pageMaker) {
		// TODO Auto-generated method stub
		return mapper.getBoardList(pageMaker);
	}*/

}
