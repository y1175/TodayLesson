package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.LessonDTO;

public interface JY_SN_LessonService {

	public int insert_Lesson(LessonDTO dto);

	public List<LessonDTO> list(int senior_no);

	public int select_senior_no(String member_id);

	public LessonDTO detail_lesson(int lesson_no);

	public int insert_Online_Lesson(LessonDTO dto);

	public int update_lesson(LessonDTO dto);

	public int delete_lesson(int lesson_no);

	


}
