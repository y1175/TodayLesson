package com.todaylesson.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.LessonDetailDTO;
import com.todaylesson.DTO.MyLessonDTO;
import com.todaylesson.Mapper.JY_US_MyLessonMapper;

@Service(value="mlservice")
@Transactional(rollbackFor={Exception.class} , propagation=Propagation.REQUIRED , isolation=Isolation.DEFAULT)
public class JY_US_MyLessonServiceImple implements JY_US_MyLessonService{

	@Autowired
	private JY_US_MyLessonMapper mapper;
	
	@Override
	public List<LessonDTO> mylesson_list(String member_id) {	
		return mapper.my_lesson_list(member_id);
	}

	@Override
	public List<LessonDetailDTO> mylesson_select(int lesson_no) {
		return mapper.my_lesson_select(lesson_no);
	}

	@Override
	public LessonDetailDTO mylesson_detail_this_chapter(int lessondetail_no) {
		return mapper.my_lesson_detail_thil_chapter(lessondetail_no);
	}

	@Override
	public String mylesson_name(int lesson_no) {
		return mapper.my_lesson_name(lesson_no);
	}

	@Override
	public int update_lesson_comp(String member_id, int lessondetail_no, int time_change) {
		return mapper.update_lesson_comp(member_id, lessondetail_no, time_change);
	}
	
}