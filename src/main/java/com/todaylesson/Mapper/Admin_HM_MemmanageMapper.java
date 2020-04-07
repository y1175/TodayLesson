package com.todaylesson.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.MemberDTO;

@Mapper
public interface Admin_HM_MemmanageMapper {

	public List<MemberDTO> adminmemberlist(HashMap<String, Object> hm);

	public int adminlevelupdate(HashMap<String, Object> map);

	public int adminmemberauthupdate(HashMap<String, Object> map);

	public int getCount(HashMap<String, Object> hm);

	


	
	
	
}
