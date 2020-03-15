package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.AllLessonDTO;
import com.todaylesson.DTO.LessonDTO;

public interface JY_US_TotalLessonService {

	public List<LessonDTO> ttlesson_list();

	public AllLessonDTO ttlesson_select(int lesson_no);

}
