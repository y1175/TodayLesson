package com.todaylesson.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.LessonDTO;

@Mapper
public interface JY_US_TotalLessonMapper {

	List<LessonDTO> ttlesson_list();

}
