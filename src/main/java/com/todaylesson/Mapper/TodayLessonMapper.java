package com.todaylesson.Mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.MemberDTO;

@Mapper
public interface TodayLessonMapper {
	public int insertMember(MemberDTO dto);
	public int insertMemberSub(MemberDTO dto);
	public MemberDTO getUserById(String member_id);
	public int idCheck(String member_id);
	public String searchId(HashMap<String, Object> map);
	
	
	public int searchPassword(String member_id, String member_email, String key);
	
}
