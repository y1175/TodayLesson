package com.todaylesson.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.DTO.Stat_LogDTO;
import com.todaylesson.Mapper.Admin_YI_Statistics_Mapper;

@Service(value="admin_YI_Statistics_Service")
public class Admin_YI_Statistics_ServiceImple implements Admin_YI_Statistics_Service {

	@Resource(name="admin_YI_Statistics_Mapper")
	private Admin_YI_Statistics_Mapper mapper;

	@Override
	public List<Stat_LogDTO> allLog() {
		// TODO Auto-generated method stub
		return mapper.allLog();
	}

	@Override
	public void createTmp() {
		// TODO Auto-generated method stub
		mapper.createTmp();
	}

	@Override
	public void setVariable() {
		// TODO Auto-generated method stub
		mapper.setVariable();
	}

	@Override
	public void dropTmp() {
		// TODO Auto-generated method stub
		mapper.dropTmp();
	}

	@Override
	public List<Stat_LogDTO> distinct_member() {
		// TODO Auto-generated method stub
		return mapper.distinct_member();
	}
	
}
