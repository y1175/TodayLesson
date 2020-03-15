package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.LessonDetailDTO;

public interface JY_SN_Approve_LessonService {


	public List<LessonDTO> apl_list(String member_id);

	public LessonDTO apl_detail(int lesson_no);

	public int apl_upload(LessonDetailDTO dto);



}
