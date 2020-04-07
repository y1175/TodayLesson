package com.todaylesson.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.Question_1_1DTO;

@Mapper
public interface User_HM_QuestionMapper {

	public List<Question_1_1DTO> hm_question_list(String member_id);

    public void questioninsert(HashMap<String, Object> map);

	public Question_1_1DTO hm_question_detail(int question_no);

	public int questiondelete(int question_no);

}