package com.todaylesson.service;

import java.util.HashMap;
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
	public List<Stat_LogDTO> allLog(String ymd, String start_date, String end_date) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm=new HashMap<>();
		hm.put("ymd", ymd);
		hm.put("start_date", start_date);
		hm.put("end_date", end_date);
		return mapper.allLog(hm);
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

	@Override
	public List<Stat_LogDTO> chartOutput() {
		// TODO Auto-generated method stub
		return mapper.chartOutput();
	}
	
}
