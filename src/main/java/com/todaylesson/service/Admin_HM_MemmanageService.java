package com.todaylesson.service;

import java.util.HashMap;
import java.util.List;

import com.todaylesson.DTO.MemberDTO;

public interface Admin_HM_MemmanageService {

	public List<MemberDTO> adminmemberlist();

	public int adminlevelupdate(HashMap<String, Object> map);

}
