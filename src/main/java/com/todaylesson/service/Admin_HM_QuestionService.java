package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.Question_1_1DTO;

public interface Admin_HM_QuestionService {

	public List<Question_1_1DTO> hm_ad_questionlist(String search, String searchtxt, int startRow, int endRow);

	public int hmtotalCount(String search, String searchtxt);

}
