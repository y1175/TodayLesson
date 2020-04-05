package com.todaylesson.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.DTO.EventDTO;
import com.todaylesson.DTO.SQLjoin_Member_EventDTO;
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
	public List<EventDTO> hm_us_eventlist(String search, String searchtxt, int startRow, int endRow,String event) {
		// TODO Auto-generated method stub
		HashMap<String, Object>hm = new HashMap<String,Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("startrow", startRow);
		hm.put("endrow", endRow);
		hm.put("event", event);
		return mapper.eventlist(hm);
	}

	@Override
	public EventDTO hm_us_event_detail(int event_no) {
		// TODO Auto-generated method stub
		return mapper.eventdetail(event_no);
	}

	@Override
	public List<SQLjoin_Member_EventDTO> eventreply_list(int event_no) {
		// TODO Auto-generated method stub
		return mapper.eventreply_list(event_no);
	}
	
	
}
