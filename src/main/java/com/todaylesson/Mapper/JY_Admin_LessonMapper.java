package com.todaylesson.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.AllLessonDTO;
import com.todaylesson.DTO.LessonDTO;

@Mapper
public interface JY_Admin_LessonMapper {

	public List<AllLessonDTO> all_lesson();

	public AllLessonDTO select_lesson(int lesson_no);

	public int lesson_approve(int lesson_no);

	public int lesson_reject(int lesson_no);

	public List<AllLessonDTO> wait_lesson();

	//public List<LessonDTO> select_lesson_list(int senior_no);

}
