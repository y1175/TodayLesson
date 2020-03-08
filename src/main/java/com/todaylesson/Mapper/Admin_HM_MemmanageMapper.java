package com.todaylesson.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.MemberDTO;

@Mapper
public interface Admin_HM_MemmanageMapper {

	public List<MemberDTO> adminmemberlist();

	public int adminlevelupdate(HashMap<String, Object> map);

	public int adminmemberauthupdate(HashMap<String, Object> map);


	
	
	
}
