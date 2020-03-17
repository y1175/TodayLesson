package com.todaylesson.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.EventDTO;

@Mapper
public interface Admin_HM_EventMapper {

	public int eventinsert(EventDTO dto);

	public List<EventDTO> eventlist();

	

}
