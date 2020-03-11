package com.todaylesson.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.Question_1_1DTO;

@Mapper
public interface User_HM_QuestionMapper {

	List<Question_1_1DTO> hm_question_list(String member_id);

    public void questioninsert(HashMap<String, Object> map);

}