package com.todaylesson.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.LessonDetailDTO;
import com.todaylesson.Mapper.JY_SN_Approve_LessonMapper;

@Service(value="approve_service")
@Transactional(rollbackFor={Exception.class} , propagation=Propagation.REQUIRED , isolation=Isolation.DEFAULT)
public class JY_SN_Approve_LessonServiceImple implements JY_SN_Approve_LessonService {

	@Autowired
	private JY_SN_Approve_LessonMapper mapper;

	@Override
	public List<LessonDTO> apl_list(String member_id) {
		int senior_no = mapper.getSenior_no(member_id);
		return mapper.apl_list(senior_no);
	}

	@Override
	public LessonDTO apl_detail(int lesson_no) {
		return mapper.apl_detail(lesson_no);
	} 

	@Override
	public int apl_upload(LessonDetailDTO dto) {
		return mapper.apl_upload(dto);
	}

	@Override
	public List<LessonDetailDTO> apld_list(int lesson_no) {
		return mapper.apld_list(lesson_no);
	}

	@Override
	public LessonDetailDTO apld_select(int lessondetail_no) {
		return mapper.apld_select(lessondetail_no);
	}




	
	
}
