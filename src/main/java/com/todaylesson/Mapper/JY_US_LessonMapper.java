package com.todaylesson.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.LessonDTO;


@Mapper
public interface JY_US_LessonMapper {

	public int insert_lesson(LessonDTO dto);

	
	public List<LessonDTO> list_lesson();


	public int select_senior_no(String member_id);


	public LessonDTO detail_lesson(int lesson_no);


	public int insert_online_lesson(LessonDTO dto);

}
