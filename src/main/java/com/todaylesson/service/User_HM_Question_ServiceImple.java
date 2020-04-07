package com.todaylesson.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.DTO.Question_1_1DTO;
import com.todaylesson.Mapper.User_HM_QuestionMapper;



@Service(value="user_hm_question_service")
public class User_HM_Question_ServiceImple implements User_HM_Question_Service {

	@Resource(name="user_HM_QuestionMapper")
	private User_HM_QuestionMapper mapper;

	@Override
	public List<Question_1_1DTO> hm_question_list(String member_id) {
		// TODO Auto-generated method stub
		return mapper.hm_question_list(member_id);
	}
	



	@Override
	public void hm_question_insert(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
		mapper.questioninsert(map);
	}




	@Override
	public Question_1_1DTO hm_question_detail(int question_no) {
		// TODO Auto-generated method stub
		return mapper.hm_question_detail(question_no);
	}




	@Override
	public int questiondelete(int question_no) {
		// TODO Auto-generated method stub
		return mapper.questiondelete(question_no);
	}


	
	
	
}