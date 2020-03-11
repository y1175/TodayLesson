package com.todaylesson.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.AllLessonDTO;

@Mapper
public interface JY_Admin_SeniorMapper {

	public List<AllLessonDTO> all_senior();

}
