package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.SeniorDTO;

public interface JY_Admin_SeniorService {

	public List<SeniorDTO> all_senior(String search, String searchtxt, String order, int startrow, int endrow);

	public List<LessonDTO> senior_lesson(int senior_no);

	public SeniorDTO select_senior(int senior_no);

	public int totalCount(String search, String searchtxt);



}
