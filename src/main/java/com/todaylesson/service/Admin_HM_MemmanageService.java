package com.todaylesson.service;

import java.util.HashMap;
import java.util.List;

import com.todaylesson.DTO.MemberDTO;

public interface Admin_HM_MemmanageService {

	public List<MemberDTO> adminmemberlist(String search, String searchtxt, int startRow, int endRow);

	public int adminlevelupdate(HashMap<String, Object> map);

	public int adminmemberauthupdate(HashMap<String, Object> map);

	public int totalCount(String search, String searchtxt);

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
