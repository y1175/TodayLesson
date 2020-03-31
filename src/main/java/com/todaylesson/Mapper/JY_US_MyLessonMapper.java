package com.todaylesson.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.LessonCompDTO;
import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.LessonDetailDTO;
import com.todaylesson.DTO.MyLessonDTO;

@Mapper
public interface JY_US_MyLessonMapper {

	public List<LessonDTO> my_lesson_list(String member_id);

	public List<LessonDetailDTO> my_lesson_select(HashMap<String, Object> hm);

	public List<LessonDetailDTO> mylesson_select(int lesson_no);

	public LessonDetailDTO my_lesson_detail_this_chapter(int lessondetail_no);

	public String my_lesson_name(int lesson_no);

	//public int update_lesson_comp(String member_id, int lessondetail_no, int time_change);

	public int update_lesson_comp(HashMap<String, Object> hm);

	public LessonCompDTO select_my_lesson_comp(HashMap<String, Object> hm);

	public void lc_insert(HashMap<String, Object> hm);

	public List<LessonCompDTO> mylesson_comp_select(HashMap<String, Object> hm);



}
