package com.todaylesson.Mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.LessonDTO;



@Mapper
public interface User_HM_Bird_Mapper {

	public List<LessonDTO> bestlesson();



	
	
	
}
