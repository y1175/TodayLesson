package com.todaylesson.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.todaylesson.DTO.SeniorDTO;
import com.todaylesson.Mapper.JY_Admin_SeniorMapper;

@Service(value="ad_senior_service")
public class JY_Admin_SeniorServiceImple implements JY_Admin_SeniorService{

	
	@Autowired
	private JY_Admin_SeniorMapper mapper;
	
	@Override
	public List<SeniorDTO> all_senior() {
		return mapper.all_senior();
	}

	

	
	
}
