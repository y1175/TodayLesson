package com.todaylesson.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.DTO.EventDTO;
import com.todaylesson.Mapper.User_HM_EventMapper;

@Service(value="user_hm_eventservice")
public class User_HM_EventServiceImple implements User_HM_EventService {

	@Resource(name="user_HM_EventMapper")
	private User_HM_EventMapper mapper;

	@Override
	public int totalCount(String search, String searchtxt) {
		// TODO Auto-generated method stub
		HashMap<String,Object> hm=new HashMap<String,Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		return mapper.getCount(hm);
	}

	@Override
	public List<EventDTO> hm_us_eventlist(String search, String searchtxt, int startRow, int endRow) {
		// TODO Auto-generated method stub
		HashMap<String, Object>hm = new HashMap<String,Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("startrow", startRow);
		hm.put("endrow", endRow);
		return mapper.eventlist(hm);
	}
	
	
}
