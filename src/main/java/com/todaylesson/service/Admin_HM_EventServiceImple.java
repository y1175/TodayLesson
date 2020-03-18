package com.todaylesson.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.DTO.EventDTO;
import com.todaylesson.Mapper.Admin_HM_EventMapper;

@Service(value ="admin_hm_eventservice")
public class Admin_HM_EventServiceImple implements Admin_HM_EventService {

	@Resource(name="admin_HM_EventMapper")
	private Admin_HM_EventMapper mapper;
	
	@Override
	public int eventinsert(EventDTO dto) {
		// TODO Auto-generated method stub
		return mapper.eventinsert(dto);
	}

	@Override
	public List<EventDTO> eventlist() {
		// TODO Auto-generated method stub
		return mapper.eventlist();
	}

	@Override
	public EventDTO eventdetail(int event_no) {
		// TODO Auto-generated method stub
		return mapper.eventdetail(event_no);
	}

}
