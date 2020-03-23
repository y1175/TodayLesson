package com.todaylesson.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.EventDTO;

@Mapper
public interface Admin_HM_EventMapper {

	public int eventinsert(EventDTO dto);

	public List<EventDTO> eventlist(HashMap<String, Object> hm);

	public EventDTO eventdetail(int event_no);

	public int eventupdate(EventDTO dto);

	public int eventdelete(int event_no);

	public int eventupdatenothumbnail(EventDTO dto);

	public int getCount(HashMap<String, Object> hm);

	

}
