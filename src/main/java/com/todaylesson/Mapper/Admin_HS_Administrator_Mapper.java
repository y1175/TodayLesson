package com.todaylesson.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.MemberDTO;

@Mapper
public interface Admin_HS_Administrator_Mapper {

	public MemberDTO administratorDetail();
}
