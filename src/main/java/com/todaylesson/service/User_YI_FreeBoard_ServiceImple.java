package com.todaylesson.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.todaylesson.DTO.FreeBoardDTO;
import com.todaylesson.DTO.SQLjoin_Member_FreeBoardDTO;
import com.todaylesson.Mapper.User_YI_FreeBoard_Mapper;

@Service(value="user_YI_FreeBoard_Service")
public class User_YI_FreeBoard_ServiceImple implements User_YI_FreeBoard_Service {

	@Resource(name="user_YI_FreeBoard_Mapper")
	private User_YI_FreeBoard_Mapper mapper;
	

	@Override
	public SQLjoin_Member_FreeBoardDTO freeboard_detail(int freeboard_no) {
		// TODO Auto-generated method stub
		return mapper.freeboard_detail(freeboard_no);
	}

	@Override
	public List<SQLjoin_Member_FreeBoardDTO> freeboard_list(int start, int end, String searchOption, String keyword)
			throws Exception {
		// TODO Auto-generated method stub
		return mapper.freeboard_list(start, end, searchOption, keyword);
	}

	@Override
	public int countArticle(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}

}
