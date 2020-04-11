package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.AllLessonDTO;
import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.SeniorDTO;

public interface JY_Admin_LessonService {

	public List<AllLessonDTO> all_lesson(String search, String searchtxt, String order, int startrow, int endrow, String start_date, String end_date);

	public AllLessonDTO select_lesson(int lesson_no);

	public int approve(int lesson_no);

	public int reject(int lesson_no);

	public List<AllLessonDTO> wait_lesson(String order);

	public List<LessonDTO> select_lesson_list(int senior_no);

	public List<AllLessonDTO> apply_lesson();

	public int apply_lesson_result(List<Integer> list);

	public SeniorDTO get_senior_info(int lesson_no);

	public int totalCount(String search, String searchtxt, String start_date, String end_date);




}
