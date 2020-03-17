package com.todaylesson.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.Mapper.Admin_HS_Administrator_Mapper;

@Service(value="admin_HS_Administrator_Service")
public class Admin_HS_Administrator_ServiceImple implements Admin_HS_Administrator_Service {
	
	@Resource(name="admin_HS_Administrator_Mapper")
	private Admin_HS_Administrator_Mapper adminIstratorMapper;

	@Override
	public MemberDTO administratorDetail() {
		// TODO Auto-generated method stub
		return adminIstratorMapper.administratorDetail();
	}

}
