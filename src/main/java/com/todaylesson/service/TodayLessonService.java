package com.todaylesson.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.Mapper.TodayLessonMapper;

@Service(value="todaylessonService")
public class TodayLessonService {
	
	@Autowired
	private TodayLessonMapper mapper;
	
	@Resource(name="passwordEncoder")
	private BCryptPasswordEncoder encoder;
	
	@Transactional
	public int insert(MemberDTO dto){
	   ///System.out.println(dto);
       String changepwd= encoder.encode(dto.getMember_pwd());
       dto.setMember_pwd(changepwd);
	   mapper.insertMember(dto);
       //System.out.println(dto.getAuthList().get(0).getMember_id());
	   int r=mapper.insertMemberSub(dto);
	   return r;
	}
	
}
