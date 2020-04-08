package com.todaylesson.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.LessonDetailDTO;

@Mapper
public interface JY_SN_Approve_LessonMapper {

	public int getSenior_no(String member_id);

	public List<LessonDTO> apl_list(HashMap<String, Object> hm);

	public LessonDTO apl_detail(int lesson_no);

	public int apl_upload(LessonDetailDTO dto);

	public List<LessonDetailDTO> apld_list(int lesson_no);

	public LessonDetailDTO apld_select(int lessondetail_no);

	public int apld_update(LessonDetailDTO dto);

	public int apl_rtime(String lessondetail_running_time);

	public int totalCount(HashMap<String, Object> hm);





}
