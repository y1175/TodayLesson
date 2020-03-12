package com.todaylesson.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.todaylesson.DTO.AllLessonDTO;
import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.SeniorDTO;
import com.todaylesson.Mapper.JY_Admin_SeniorMapper;

@Service(value="ad_senior_service")
public class JY_Admin_SeniorServiceImple implements JY_Admin_SeniorService{

	
	@Autowired
	private JY_Admin_SeniorMapper mapper;
	
	@Override
	public List<SeniorDTO> all_senior() {
		return mapper.all_senior();
	}

	
	@Override
	public List<LessonDTO> senior_lesson(int senior_no) {
		return mapper.senior_lesson(senior_no);
	}
	
	@Override
	public SeniorDTO select_senior(int senior_no) {
		return mapper.select_senior(senior_no);
	}


	

	
	
}
