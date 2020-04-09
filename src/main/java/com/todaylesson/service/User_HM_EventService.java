package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.BannerDTO;
import com.todaylesson.DTO.EventDTO;
import com.todaylesson.DTO.SQLjoin_Member_EventDTO;

public interface User_HM_EventService {

	public int totalCount(String search, String searchtxt);

	public List<EventDTO> hm_us_eventlist(String search, String searchtxt, int startRow, int endRow, String event);

	public EventDTO hm_us_event_detail(int event_no);

	public List<SQLjoin_Member_EventDTO> eventreply_list(int event_no);

	public List<BannerDTO> hm_us_bannerlist();

}
