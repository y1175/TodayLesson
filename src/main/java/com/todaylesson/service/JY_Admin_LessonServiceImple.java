package com.todaylesson.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.todaylesson.DTO.AllLessonDTO;
import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.SeniorDTO;
import com.todaylesson.Mapper.JY_Admin_LessonMapper;

@Service(value="adminservice")
@Transactional(rollbackFor={Exception.class} , propagation=Propagation.REQUIRED , isolation=Isolation.DEFAULT)
public class JY_Admin_LessonServiceImple implements JY_Admin_LessonService {

	@Autowired
	private JY_Admin_LessonMapper mapper;
	
	
	@Override
	public List<AllLessonDTO> all_lesson() {
		return mapper.all_lesson();
	}


	@Override
	public AllLessonDTO select_lesson(int lesson_no) {
		return mapper.select_lesson(lesson_no);
	}


	@Override
	public int approve(int lesson_no) {
		return mapper.lesson_approve(lesson_no);
	}


	@Override
	public int reject(int lesson_no) {
		return mapper.lesson_reject(lesson_no);
	}


	@Override
	public List<AllLessonDTO> wait_lesson() {
		return mapper.wait_lesson();
	}


	@Override
	public List<LessonDTO> select_lesson_list(int senior_no) {
		return mapper.select_lesson_list(senior_no);
	}


	@Override
	public List<AllLessonDTO> apply_lesson() {
		return mapper.apply_lesson();
	}


	@Override
	public int apply_lesson_result(List<Integer> checkvalue) {
		return mapper.apply_lesson_result(checkvalue);
	}


	@Override
	public SeniorDTO get_senior_info(int lesson_no) {
		int senior_no = mapper.get_senior_no(lesson_no);
		return mapper.get_senior_info(senior_no);
	}


	





	
	
}
