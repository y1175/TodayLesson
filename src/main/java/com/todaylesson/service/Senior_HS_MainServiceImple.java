package com.todaylesson.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.DTO.SeniorDTO;
import com.todaylesson.Mapper.Senior_HS_MainMapper;

@Service(value="senior_HS_MainService")
public class Senior_HS_MainServiceImple implements Senior_HS_MainService {

	@Resource(name="senior_HS_MainMapper")
	private Senior_HS_MainMapper seniorMainMapper;

	@Override
	public SeniorDTO seniorPageInfo(String member_id) {
		// TODO Auto-generated method stub
		return seniorMainMapper.seniorPageInfo(member_id);
	}
}
