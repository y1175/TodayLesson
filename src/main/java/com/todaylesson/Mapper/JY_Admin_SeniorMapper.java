package com.todaylesson.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.AllLessonDTO;
import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.SeniorDTO;

@Mapper
public interface JY_Admin_SeniorMapper {

	public List<SeniorDTO> all_senior(HashMap<String, Object> hm);

	public List<LessonDTO> senior_lesson(int senior_no);

	public SeniorDTO select_senior(int senior_no);

	public int getCount(HashMap<String, Object> hm);


}
