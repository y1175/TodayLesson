package com.todaylesson.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.AllLessonDTO;
import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.SeniorDTO;

@Mapper
public interface JY_Admin_LessonMapper {

	public List<AllLessonDTO> all_lesson(HashMap<String, Object> hm);

	public AllLessonDTO select_lesson(int lesson_no);

	public int lesson_approve(int lesson_no);

	public int lesson_reject(int lesson_no);

	public List<AllLessonDTO> wait_lesson(String order);

	public List<LessonDTO> select_lesson_list(int senior_no);

	public List<AllLessonDTO> apply_lesson();

	public int apply_lesson_result(List<Integer> checkvalue);

	public SeniorDTO get_senior_info(int lesson_no);

	public int get_senior_no(int lesson_no);

	public int getCount(HashMap<String, Object> hm);



}
