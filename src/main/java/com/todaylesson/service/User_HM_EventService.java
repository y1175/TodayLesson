package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.EventDTO;

public interface User_HM_EventService {

	public int totalCount(String search, String searchtxt);

	public List<EventDTO> hm_us_eventlist(String search, String searchtxt, int startRow, int endRow);

}
