package com.todaylesson.Mapper;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.SeniorDTO;

@Mapper
public interface JY_US_SeniorMapper {

	// 시니어에 추가
	public void new_senior(String member_id);

	// 멤버 등급 레벨업
	public void member_level_up(String member_id);

	// 시니어 관련 정보 입력
	public int plus_senior(SeniorDTO dto);

	// 시니어 인지 멤버 레벨 확인
	public int check_senior(String member_id);
	

}
