package com.todaylesson.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.Mapper.JY_SN_LessonMapper;

@Service(value="lessonservice")
public class JY_SN_LessonServiceImple implements JY_SN_LessonService {

	@Autowired
	public JY_SN_LessonMapper mapper;
	
	@Override
	public int insert_Lesson(LessonDTO dto) {	
		return mapper.insert_lesson(dto);
	}

	@Override
	public List<LessonDTO> list(int senior_no) {
		return mapper.list_lesson(senior_no);
	}

	@Override
	public int select_senior_no(String member_id) {
		return mapper.select_senior_no(member_id);
	}

	@Override
	public LessonDTO detail_lesson(int lesson_no) {
		return mapper.detail_lesson(lesson_no);
	}

	@Override
	public int insert_Online_Lesson(LessonDTO dto) {
		return mapper.insert_online_lesson(dto);
	}

	@Override
	public int update_lesson(LessonDTO dto) {
		return mapper.update_lesson(dto);
	}

	@Override
	public int delete_lesson(int lesson_no) {
		return mapper.delete_lesson(lesson_no);
	}

	
	

	
}
