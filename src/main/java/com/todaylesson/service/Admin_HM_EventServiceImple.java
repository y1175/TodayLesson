package com.todaylesson.service;

import java.util.HashMap;
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
	public List<EventDTO> eventlist(String search, String searchtxt, int startRow, int endRow) {
		// TODO Auto-generated method stub
		HashMap<String, Object>hm = new HashMap<String,Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("startrow", startRow);
		hm.put("endrow", endRow);
		return mapper.eventlist(hm);
	}

	@Override
	public EventDTO eventdetail(int event_no) {
		// TODO Auto-generated method stub
		return mapper.eventdetail(event_no);
	}

	@Override
	public int eventupdate(EventDTO dto) {
		// TODO Auto-generated method stub
		return mapper.eventupdate(dto);
	}

	@Override
	public int delete(int event_no) {
		// TODO Auto-generated method stub
		return mapper.eventdelete(event_no);
	}

	@Override
	public int eventupdatenothumbnail(EventDTO dto) {
		// TODO Auto-generated method stub
		return mapper.eventupdatenothumbnail(dto);
	}

	@Override
	public int totalCount(String search, String searchtxt) {
		// TODO Auto-generated method stub
		HashMap<String,Object> hm=new HashMap<String,Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		return mapper.getCount(hm);
	}

}
