package com.todaylesson.Mapper;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.MemberDTO;

@Mapper
public interface User_HS_MyPageMapper {

	public MemberDTO myPageMyLevel_MyPoint(String member_id);

}
