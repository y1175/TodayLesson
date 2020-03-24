package com.todaylesson.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.todaylesson.DTO.AllLessonDTO;
import com.todaylesson.DTO.CartDTO;
import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.Lesson_qaDTO;
import com.todaylesson.DTO.MyLikeDTO;
import com.todaylesson.Mapper.JY_US_TotalLessonMapper;

@Service(value="totallesson_service")
@Transactional(rollbackFor={Exception.class} , propagation=Propagation.REQUIRED , isolation=Isolation.DEFAULT)
public class JY_US_TotalLessonImple implements JY_US_TotalLessonService {

	@Autowired
	private JY_US_TotalLessonMapper mapper;
	
	
	@Override
	public List<LessonDTO> ttlesson_list() {
		return mapper.ttlesson_list();
	}


	@Override
	public AllLessonDTO ttlesson_select(int lesson_no) {
		mapper.ttlesson_readno_plus(lesson_no);
		return mapper.ttlesson_select(lesson_no);
	}


	@Override
	public int add_like_lesson(MyLikeDTO dto) {
		mapper.ttlesson_like_count_plus(dto.getLesson_no());
		return mapper.add_like_lesson(dto);
	}


	@Override
	public int add_cart_lesson(CartDTO dto) {
		return mapper.add_cart_lesson(dto);
	}


	@Override
	public int add_lesson_reply(Lesson_qaDTO dto) {
		return mapper.add_lesson_reply(dto);
	}


	@Override
	public int add_lesson_secret_reply(Lesson_qaDTO dto) {
		return mapper.add_lesson_secret_reply(dto);
	}


	@Override
	public List<Lesson_qaDTO> select_lesson_reply(Lesson_qaDTO dto) {
		return mapper.select_lesson_reply(dto);
	}


	@Override
	public List<MyLikeDTO> has_like_lesson(MyLikeDTO dto) {
		return mapper.has_like_lesson(dto);
	}


	@Override
	public List<CartDTO> has_cart_lesson(CartDTO dto) {
		return mapper.has_cart_lesson(dto);
	}

}
