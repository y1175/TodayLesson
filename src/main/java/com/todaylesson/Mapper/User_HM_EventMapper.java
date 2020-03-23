package com.todaylesson.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.EventDTO;

@Mapper
public interface User_HM_EventMapper {

	public int getCount(HashMap<String, Object> hm);

	public List<EventDTO> eventlist(HashMap<String, Object> hm);

}
