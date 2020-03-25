package com.todaylesson.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.AllLessonDTO;
import com.todaylesson.DTO.CartDTO;
import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.Lesson_qaDTO;
import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.DTO.MyLikeDTO;

@Mapper
public interface JY_US_TotalLessonMapper {

	public List<LessonDTO> ttlesson_list();

	public AllLessonDTO ttlesson_select(int lesson_no);

	public void ttlesson_readno_plus(int lesson_no);

	public int add_like_lesson(MyLikeDTO dto);

	public void ttlesson_like_count_plus(int lesson_no);

	public int add_cart_lesson(CartDTO dto);

	public int add_lesson_reply(Lesson_qaDTO dto);

	public int add_lesson_secret_reply(Lesson_qaDTO dto);

	public List<Lesson_qaDTO> select_lesson_reply(int lesson_no);

	public List<MyLikeDTO> has_like_lesson(MyLikeDTO dto);

	public List<CartDTO> has_cart_lesson(CartDTO dto);

	public int add_lesson_reply_answer(Lesson_qaDTO dto);

	public List<Lesson_qaDTO> select_lesson_reply_answer(int lesson_no);

	public int has_answer_reply(Lesson_qaDTO dto);

	public MemberDTO select_member_info(String member_id);


}
