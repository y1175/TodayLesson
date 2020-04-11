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

	public int update_lesson_comp(HashMap<String, Object> hm);

	public int select_my_lesson_comp(HashMap<String, Object> hm);

	public int i_click_this_lesson_chapter(HashMap<String, Object> hm);

	public int i_click_this_lesson_chapter2(HashMap<String, Object> hm);

	
	public void click_this_lesson_chapter(HashMap<String, Object> hm);

	public List<LessonDetailDTO> my_lesson_select2(HashMap<String, Object> hm);

	public float mylesson_procent(HashMap<String, Object> hm);

	public int reward_point_to_member(String member_id);

	public void already_rewarded_point(HashMap<String, Object> hm);

	public int mylesson_reward(HashMap<String, Object> hm);





}
