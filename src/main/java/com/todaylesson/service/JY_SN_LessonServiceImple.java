package com.todaylesson.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.SeniorDTO;
import com.todaylesson.Mapper.JY_SN_LessonMapper;

@Service(value="lessonservice")
public class JY_SN_LessonServiceImple implements JY_SN_LessonService {

	@Autowired
	public JY_SN_LessonMapper mapper;
	
	
	@Override
	public int insert_Lesson(LessonDTO dto) {	
		return mapper.insert_lesson(dto);
	}


	@Override
	public int select_senior_no(String member_id) {
		return mapper.select_senior_no(member_id);
	}

	@Override
	public LessonDTO detail_lesson(int lesson_no) {
		return mapper.detail_lesson(lesson_no);
	}


	@Override
	public int update_lesson(LessonDTO dto) {
		return mapper.update_lesson(dto);
	}

	@Override
	public int delete_lesson(int lesson_no) {
		return mapper.delete_lesson(lesson_no);
	}

	@Override
	public List<LessonDTO> reject_lesson_list(int senior_no) {
		return mapper.reject_lesson_list(senior_no);
	}

	@Override
	public SeniorDTO select_senior_info(int senior_no) {
		return mapper.select_senior_info(senior_no);
	}

	@Override
	public List<LessonDTO> list(int senior_no, String search, String searchtxt, int order, int i, int j) {
		HashMap<String, Object> hm=new HashMap<String, Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("startrow", i);
		hm.put("endrow", j);
		hm.put("order", order);
		hm.put("senior_no", senior_no);
		return mapper.list_lesson(hm);
	}

	@Override
	public int totalCount(String search, String searchtxt, int order, int senior_no) {
		HashMap<String, Object> hm=new HashMap<String, Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("senior_no", senior_no);
		hm.put("order", order);

		
		return mapper.totalCount(hm);
	}

	
	

	
}
