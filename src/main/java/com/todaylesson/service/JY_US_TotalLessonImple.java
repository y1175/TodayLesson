package com.todaylesson.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.Mapper.JY_US_TotalLessonMapper;

@Service(value="totallesson_service")
public class JY_US_TotalLessonImple implements JY_US_TotalLessonService {

	@Autowired
	private JY_US_TotalLessonMapper mapper;
	
	
	@Override
	public List<LessonDTO> ttlesson_list() {
		return mapper.ttlesson_list();
	}

}
