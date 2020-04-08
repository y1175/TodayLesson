package com.todaylesson.service;

import java.util.HashMap;

import com.todaylesson.DTO.MemberDTO;

public interface Hm_Us_MymanageService {

	public MemberDTO MyInfolist(String member_id);

	public int MyInfoupdate(MemberDTO dto);

	public int MyInfoupdate2(MemberDTO dto);

	public String matchpwd(String member_id);


}
