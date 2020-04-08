package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.LessonDetailDTO;

public interface JY_SN_Approve_LessonService {


	public List<LessonDTO> apl_list(String member_id);

	public LessonDTO apl_detail(int lesson_no);

	public int apl_upload(LessonDetailDTO dto);

	public List<LessonDetailDTO> apld_list(int lesson_no);

	public LessonDetailDTO apld_select(int lessondetail_no);

	public int apld_update(LessonDetailDTO dto);

	public int apl_rt(String lessondetail_running_time);







}
