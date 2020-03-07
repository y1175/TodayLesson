package com.todaylesson.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.Mapper.JY_US_LessonMapper;

@Service(value="lessonservice")
public class JY_US_LessonServiceImple implements JY_US_LessonService {

	@Autowired
	public JY_US_LessonMapper mapper;
	
	@Override
	public int insert_Lesson(LessonDTO dto) {	
		return mapper.insert_lesson(dto);
	}

	@Override
	public List<LessonDTO> list() {
		return mapper.list_lesson();
	}

	@Override
	public int select_senior_no(String member_id) {
		return mapper.select_senior_no(member_id);
	}

	@Override
	public LessonDTO detail_lesson(int lesson_no) {
		return mapper.detail_lesson(lesson_no);
	}

	
	

	
}
