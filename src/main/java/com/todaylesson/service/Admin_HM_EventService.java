package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.EventDTO;

public interface Admin_HM_EventService {

	public int eventinsert(EventDTO dto);

	public List<EventDTO> eventlist();

}
