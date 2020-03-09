package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.LessonDTO;

public interface JY_US_LessonService {

	public int insert_Lesson(LessonDTO dto);

	public List<LessonDTO> list();

	public int select_senior_no(String member_id);

	public LessonDTO detail_lesson(int lesson_no);

	public int insert_Online_Lesson(LessonDTO dto);

	


}
