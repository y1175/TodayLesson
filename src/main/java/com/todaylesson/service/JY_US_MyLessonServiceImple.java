package com.todaylesson.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.MyLessonDTO;
import com.todaylesson.Mapper.JY_US_MyLessonMapper;

@Service(value="mlservice")
@Transactional(rollbackFor={Exception.class} , propagation=Propagation.REQUIRED , isolation=Isolation.DEFAULT)
public class JY_US_MyLessonServiceImple implements JY_US_MyLessonService{

	@Autowired
	private JY_US_MyLessonMapper mapper;
	
	@Override
	public List<LessonDTO> mylesson_list(String member_id) {		
		return mapper.mylesson_list(member_id);
	}

}
