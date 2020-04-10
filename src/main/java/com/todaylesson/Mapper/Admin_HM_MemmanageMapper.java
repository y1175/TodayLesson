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

	public int adminlevelup(HashMap<String, Object> map);

	public MemberDTO oldlevel(String member_id);

	public int adminmemberauthdelete(HashMap<String, Object> map);

	public int deladminrole(HashMap<String, Object> map);

	public int leveluptojr(HashMap<String, Object> map);

	public int deljrauth(HashMap<String, Object> map);

	public int delblockauth(HashMap<String, Object> map);

	public int plusadmin(HashMap<String, Object> map);

	public int delauth(HashMap<String, Object> map);

	public int insertsenior(String member_id);

	public int insertblock(HashMap<String, Object> map);

	public int delnotblock(HashMap<String, Object> map);

	


	
	
	
}
