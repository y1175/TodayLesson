package com.todaylesson.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.AllLessonDTO;
import com.todaylesson.DTO.SeniorDTO;

@Mapper
public interface JY_Admin_SeniorMapper {

	public List<SeniorDTO> all_senior();

}
