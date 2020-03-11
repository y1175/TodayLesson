package com.todaylesson.service;


import java.util.HashMap;
import java.util.List;

import com.todaylesson.DTO.Question_1_1DTO;

public interface Admin_HM_QuestionService {

	public List<Question_1_1DTO> hm_ad_questionlist(String search, String searchtxt, int startRow, int endRow);

	public int hmtotalCount(String search, String searchtxt);

public Question_1_1DTO hm_ad_question_detail(int question_no);

	public void hm_ad_question_update(HashMap<String, Object> map);

	
=======
import java.util.List;

import com.todaylesson.DTO.Question_1_1DTO;

public interface Admin_HM_QuestionService {

	public List<Question_1_1DTO> hm_ad_questionlist(String search, String searchtxt, int startRow, int endRow);

	public int hmtotalCount(String search, String searchtxt);

	public Question_1_1DTO hm_ad_question_detail(int question_no);


}
