package com.todaylesson.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.todaylesson.DTO.SeniorDTO;
import com.todaylesson.Mapper.JY_US_SeniorMapper;

@Transactional(rollbackFor={Exception.class} , propagation=Propagation.REQUIRED , isolation=Isolation.DEFAULT)
@Service(value="senior_service")
public class JY_US_SeniorServiceImple implements JY_US_SeniorService {

	@Autowired
	private JY_US_SeniorMapper mapper;
	
	@Override
	public void new_senior(String member_id) {
		// 시니어에 추가됨
		mapper.new_senior(member_id);
		
		// 시니어로 등급 변경
		mapper.member_level_up(member_id);
		mapper.member_levelup(member_id);
	}

	
	@Override
	public int plus_senior(SeniorDTO dto) {
		return mapper.plus_senior(dto);
	}


	@Override
	public int check_senior(String member_id) {
		return mapper.check_senior(member_id);
	}


	@Override
	public SeniorDTO select_senior(String member_id) {
		return mapper.select_senior(member_id);
	}


	@Override
	public int update_senior(SeniorDTO dto) {
		return mapper.update_senior(dto);
	}


	
	
}
