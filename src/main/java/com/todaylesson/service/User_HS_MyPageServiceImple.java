package com.todaylesson.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.Mapper.User_HS_MyPageMapper;

@Service(value="user_HS_MyPageService")
public class User_HS_MyPageServiceImple implements User_HS_MyPageService {

	@Resource(name="user_HS_MyPageMapper")
	private User_HS_MyPageMapper userMyPageMapper;

	@Override
	public MemberDTO myPageMyLevel_MyPoint(String member_id) {
		// TODO Auto-generated method stub
		return userMyPageMapper.myPageMyLevel_MyPoint(member_id);
	}
}
