package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.LessonDetailDTO;
import com.todaylesson.DTO.MyLessonDTO;

public interface JY_US_MyLessonService {

	public List<LessonDTO> mylesson_list(String member_id);

	public List<LessonDetailDTO> mylesson_select(int lesson_no);

	public LessonDetailDTO mylesson_detail_this_chapter(int lessondetail_no);
	
	public String mylesson_name(int lesson_no);

	public int update_lesson_comp(String member_id, int lessondetail_no, int time_change);
}
