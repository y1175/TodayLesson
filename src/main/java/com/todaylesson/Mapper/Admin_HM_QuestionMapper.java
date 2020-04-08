package com.todaylesson.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.Question_1_1DTO;

@Mapper
public interface Admin_HM_QuestionMapper {

	public List<Question_1_1DTO> hm_ad_questionlist(HashMap<String, Object> hm);

	public int hmgetCount(HashMap<String, Object> hm);

	public Question_1_1DTO hm_ad_question_detail(int question_no);


	public int hm_ad_question_update(HashMap<String, Object> map);

	public int hm_ad_question_delete(int question_no);



}
