package com.todaylesson.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.LessonDetailDTO;
import com.todaylesson.DTO.Lesson_LessonDetailDTO;

@Mapper
public interface JY_SN_Approve_LessonMapper {

	public int getSenior_no(String member_id);

	public List<LessonDTO> apl_list(int senior_no);

	public LessonDTO apl_detail(int lesson_no);

	public int apl_upload(LessonDetailDTO dto);


}
