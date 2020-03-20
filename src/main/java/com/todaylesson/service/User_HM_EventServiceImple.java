package com.todaylesson.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.Mapper.User_HM_EventMapper;

@Service(value="user_hm_eventservice")
public class User_HM_EventServiceImple implements User_HM_EventService {

	@Resource(name="user_HM_EventMapper")
	private User_HM_EventMapper mapper;
	
	
}
