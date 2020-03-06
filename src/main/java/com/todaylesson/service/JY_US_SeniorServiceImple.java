package com.todaylesson.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.todaylesson.Mapper.JY_US_SeniorMapper;

@Service(value="senior_service")
public class JY_US_SeniorServiceImple implements JY_US_SeniorService {

	@Autowired
	private JY_US_SeniorMapper jY_US_SeniorMapper;
	
	@Override
	public void new_senior(String member_id) {
		jY_US_SeniorMapper.new_senior(member_id);
	}

	
	
}
