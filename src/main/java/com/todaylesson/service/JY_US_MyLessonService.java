package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.MyLessonDTO;

public interface JY_US_MyLessonService {

	public List<LessonDTO> mylesson_list(String member_id);

}
