package com.todaylesson.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.todaylesson.DTO.AllLessonDTO;
import com.todaylesson.DTO.CartDTO;
import com.todaylesson.DTO.LReviewDTO;
import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.Lesson_qaDTO;
import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.DTO.MyLikeDTO;
import com.todaylesson.DTO.OrderDetailDTO;
import com.todaylesson.DTO.OrderListDTO;
import com.todaylesson.Mapper.JY_US_TotalLessonMapper;

@Service(value="totallesson_service")
@Transactional(rollbackFor={Exception.class} , propagation=Propagation.REQUIRED , isolation=Isolation.DEFAULT)
public class JY_US_TotalLessonServiceImple implements JY_US_TotalLessonService {

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
	public List<Lesson_qaDTO> select_lesson_reply(int lesson_no) {
		return mapper.select_lesson_reply(lesson_no);
	}


	@Override
	public List<MyLikeDTO> has_like_lesson(MyLikeDTO dto) {
		return mapper.has_like_lesson(dto);
	}


	@Override
	public List<CartDTO> has_cart_lesson(CartDTO dto) {
		return mapper.has_cart_lesson(dto);
	}


	@Override
	public int add_lesson_reply_answer(Lesson_qaDTO dto) {
		return mapper.add_lesson_reply_answer(dto);
	}


	@Override
	public List<Lesson_qaDTO> select_lesson_reply_answer(int lesson_no) {
		return mapper.select_lesson_reply_answer(lesson_no);
	}


	@Override
	public int has_answer_reply(Lesson_qaDTO dto) {
		return mapper.has_answer_reply(dto);
	}


	@Override
	public MemberDTO select_member_info(String member_id) {
		return mapper.select_member_info(member_id);
	}


	@Override
	public int insertorderdetail(OrderDetailDTO oddto) {
		return mapper.insertorderdetail(oddto);
	}


	@Override
	public int insertorderlist(OrderListDTO oldto) {
		return mapper.insertorderlist(oldto);
	}


	@Override
	public int updatepoint(MemberDTO memberdto) {
		return mapper.updatepoint(memberdto);
	}


	@Override
	public List<OrderDetailDTO> selectorderdetail(int orderlist_no) {
		return mapper.selectorderdetail(orderlist_no);
	}


	@Override
	public OrderListDTO selectorderlist(int orderlist_no) {
		return mapper.selectorderlist(orderlist_no);
	}


	@Override
	public List<LReviewDTO> select_lesson_lreview(int lesson_no) {
		return mapper.select_lesson_lreview(lesson_no);
	}


	@Override
	public int add_lesson_review(LReviewDTO dto) {
		return mapper.add_lesson_review(dto);
	}


}