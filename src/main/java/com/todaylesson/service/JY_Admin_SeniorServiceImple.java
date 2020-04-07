package com.todaylesson.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.todaylesson.DTO.AllLessonDTO;
import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.SeniorDTO;
import com.todaylesson.Mapper.JY_Admin_SeniorMapper;

@Service(value="ad_senior_service")
public class JY_Admin_SeniorServiceImple implements JY_Admin_SeniorService{

	
	@Autowired
	private JY_Admin_SeniorMapper mapper;
	


	
	@Override
	public List<LessonDTO> senior_lesson(int senior_no) {
		return mapper.senior_lesson(senior_no);
	}
	
	@Override
	public SeniorDTO select_senior(int senior_no) {
		return mapper.select_senior(senior_no);
	}

	@Override
	public int totalCount(String search, String searchtxt) {
		HashMap<String, Object> hm=new HashMap<String, Object>();
			hm.put("search", search);
			hm.put("searchtxt", searchtxt);
			return mapper.getCount(hm);
	}

	@Override
	public List<SeniorDTO> all_senior(String search, String searchtxt, String order, int startrow, int endrow) {
		HashMap<String, Object> hm=new HashMap<String, Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("startrow", startrow);
		hm.put("endrow", endrow);
		hm.put("order", order);
		return mapper.all_senior(hm);
	}

	

	
	
}
