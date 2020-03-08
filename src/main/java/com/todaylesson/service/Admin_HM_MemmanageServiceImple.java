package com.todaylesson.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.Mapper.Admin_HM_MemmanageMapper;

@Service(value="admin_hm_memmanage")
public class Admin_HM_MemmanageServiceImple implements Admin_HM_MemmanageService {

	@Resource(name="admin_HM_MemmanageMapper")
	private Admin_HM_MemmanageMapper mapper;
	
	@Override
	public List<MemberDTO> adminmemberlist() {
		// TODO Auto-generated method stub
		return mapper.adminmemberlist();
	}

	@Override
	public int adminlevelupdate(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.adminlevelupdate(map);
	}

}
