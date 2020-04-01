package com.todaylesson.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.Mapper.User_HM_Bird_Mapper;

@Service(value="user_hm_bird_service")
public class User_HM_Bird_ServiceImple implements User_HM_Bird_Service {

	@Resource(name="user_HM_Bird_Mapper")
	private User_HM_Bird_Mapper mapper;

	@Override
	public LessonDTO test() {
		// TODO Auto-generated method stub
		return mapper.test();
	}
	
}
