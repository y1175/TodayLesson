package com.todaylesson.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.MyLessonDTO;

@Mapper
public interface JY_US_MyLessonMapper {

	public List<LessonDTO> mylesson_list(String member_id);


}
