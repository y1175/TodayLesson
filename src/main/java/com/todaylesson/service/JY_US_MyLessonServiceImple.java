package com.todaylesson.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.todaylesson.DTO.LessonCompDTO;
import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.LessonDetailDTO;
import com.todaylesson.DTO.MyLessonDTO;
import com.todaylesson.Mapper.JY_US_MyLessonMapper;

@Service(value="mlservice")
@Transactional(rollbackFor={Exception.class} , propagation=Propagation.REQUIRED , isolation=Isolation.DEFAULT)
public class JY_US_MyLessonServiceImple implements JY_US_MyLessonService{

	@Autowired
	private JY_US_MyLessonMapper mapper;
	
	@Override
	public List<LessonDTO> mylesson_list(String member_id) {	
		return mapper.my_lesson_list(member_id);
	}


	@Override
	public LessonDetailDTO mylesson_detail_this_chapter(int lessondetail_no) {
		return mapper.my_lesson_detail_this_chapter(lessondetail_no);
	}


    @Override
	public int update_lesson_comp(int lessondetail_no, String member_id, int lesson_no) {
    	HashMap<String, Object> hm=new HashMap<String, Object>();
    	hm.put("member_id", member_id);
    	hm.put("lessondetail_no", lessondetail_no);
    	hm.put("lesson_no", lesson_no);
    	return mapper.update_lesson_comp(hm);
	}

	@Override
	public int select_my_lesson_comp(int lessondetail_no, String member_id, int lesson_no) {
    	HashMap<String, Object> hm=new HashMap<String, Object>();
    	hm.put("member_id", member_id);
    	hm.put("lessondetail_no", lessondetail_no);
    	hm.put("lesson_no", lesson_no);
    	
		return mapper.select_my_lesson_comp(hm);
	}

	@Override
	public List<LessonDetailDTO> my_lesson_select(int lesson_no, String member_id) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("lesson_no", lesson_no);
		hm.put("member_id", member_id);
		return mapper.my_lesson_select(hm);
	}
	
	@Override
	public List<LessonDetailDTO> my_lesson_select2(int lesson_no, String member_id) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("lesson_no", lesson_no);
		hm.put("member_id", member_id);
		return mapper.my_lesson_select2(hm);
	}


	@Override
	public Integer i_click_this_lesson_chapter(int lessondetail_no, String member_id) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("lessondetail_no", lessondetail_no);
		hm.put("member_id", member_id);
		return mapper.i_click_this_lesson_chapter(hm);
	}

	
	@Override
	public Integer i_click_this_lesson_chapter2(int lessondetail_no, String member_id) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("lessondetail_no", lessondetail_no);
		hm.put("member_id", member_id);
		return mapper.i_click_this_lesson_chapter2(hm);
	}
	

	@Override
	public void click_this_lesson_chapter(int lessondetail_no, String member_id, int lesson_no) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("lessondetail_no", lessondetail_no);
		hm.put("member_id", member_id);
		hm.put("lesson_no", lesson_no);
		mapper.click_this_lesson_chapter(hm);
	}


	@Override
	public float mylesson_procent(int lesson_no, String member_id) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("lesson_no", lesson_no);
		hm.put("member_id", member_id);
		return mapper.mylesson_procent(hm);
	}


	@Override
	public int reward_point_to_member(String member_id,  int lesson_no) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("lesson_no", lesson_no);
		hm.put("member_id", member_id);
		mapper.already_rewarded_point(hm);
		return mapper.reward_point_to_member(member_id);
	}


	@Override
	public int mylesson_reward(int lesson_no, String member_id) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("lesson_no", lesson_no);
		hm.put("member_id", member_id);
		return mapper.mylesson_reward(hm);
	}


	
}
