package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.SeniorDTO;

public interface JY_SN_LessonService {

	//public int insert_Lesson(LessonDTO dto);

	public List<LessonDTO> list(int senior_no, String search, String searchtxt, int order, int i, int j);

	public int select_senior_no(String member_id);

	public LessonDTO detail_lesson(int lesson_no);

	public int update_lesson(LessonDTO dto);

	public int delete_lesson(int lesson_no);

	public List<LessonDTO> reject_lesson_list(int senior_no);

	public SeniorDTO select_senior_info(int senior_no);

	public int insert_Lesson(LessonDTO dto);

	public int totalCount(String search, String searchtxt, int order, int senior_no);


	


}
