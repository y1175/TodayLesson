package com.todaylesson.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.Mapper.TodayLessonMapper;

@Service(value="todaylessonService")
public class TodaylessonService {
	
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
	//로그인시 stat_log에 기록
	public void loginCount(String id) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm=new HashMap<>();
		hm.put("id", id);
		mapper.loginCount(hm);
		
	}
	public void googleinsert(MemberDTO dto) {
		// TODO Auto-generated method stub
		String changepwd= encoder.encode(dto.getMember_pwd());
	       dto.setMember_pwd(changepwd);
		   mapper.oauth2insert(dto);
	       //System.out.println(dto.getAuthList().get(0).getMember_id());
		   mapper.insertMemberSub(dto);
		
	}
	public int oauth2idcheck(String id) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm=new HashMap<>();
		hm.put("id", id);
		return mapper.oauth2idcheck(hm);
	}
	
}
