package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.AllLessonDTO;
import com.todaylesson.DTO.LessonDTO;

public interface JY_Admin_LessonService {

	public List<AllLessonDTO> all_lesson();

	public AllLessonDTO select_lesson(int lesson_no);

	public int approve(int lesson_no);

	public int reject(int lesson_no);

	public List<AllLessonDTO> wait_lesson();

	public List<LessonDTO> select_lesson_list(int senior_no);

	public List<AllLessonDTO> apply_lesson();

	public int apply_lesson_result(List<Integer> list);




}
