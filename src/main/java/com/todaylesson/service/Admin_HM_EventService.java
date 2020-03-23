package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.EventDTO;

public interface Admin_HM_EventService {

	public int eventinsert(EventDTO dto);

	public List<EventDTO> eventlist(String search, String searchtxt, int startRow, int endRow);

	public EventDTO eventdetail(int event_no);

	public int eventupdate(EventDTO dto);

	public int delete(int event_no);

	public int eventupdatenothumbnail(EventDTO dto);

	public int totalCount(String search, String searchtxt);

}
