package com.todaylesson.Mapper;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.MemberDTO;

@Mapper
public interface Hm_Us_MymanageMapper {

	public MemberDTO myinfolist(String member_id);

	public int myinfoupdate(MemberDTO dto);

}
