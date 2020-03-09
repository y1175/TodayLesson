package com.todaylesson.service;

import java.util.HashMap;
import java.util.List;

import com.todaylesson.DTO.MemberDTO;

public interface Admin_HM_MemmanageService {

	public List<MemberDTO> adminmemberlist(String search, String searchtxt, int startRow, int endRow);

	public int adminlevelupdate(HashMap<String, Object> map);

	public int adminmemberauthupdate(HashMap<String, Object> map);

	public int totalCount(String search, String searchtxt);

	public MemberDTO detail(int member_no);

}
