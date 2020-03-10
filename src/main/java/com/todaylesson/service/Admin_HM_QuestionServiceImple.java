package com.todaylesson.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.DTO.Question_1_1DTO;
import com.todaylesson.Mapper.Admin_HM_QuestionMapper;

@Service(value="admin_hm_questionservice")
public class Admin_HM_QuestionServiceImple implements Admin_HM_QuestionService {

	@Resource(name="admin_HM_QuestionMapper")
	private Admin_HM_QuestionMapper mapper;

	@Override
	public List<Question_1_1DTO> hm_ad_questionlist(String search, String searchtxt, int startRow, int endRow) {
		// TODO Auto-generated method stub
		HashMap<String, Object>hm = new HashMap<String,Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("startrow", startRow);
		hm.put("endrow", endRow);
		return mapper.hm_ad_questionlist(hm);
	}

	@Override
	public int hmtotalCount(String search, String searchtxt) {
		// TODO Auto-generated method stub
		HashMap<String,Object> hm=new HashMap<String,Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		return mapper.hmgetCount(hm);
	}
}
