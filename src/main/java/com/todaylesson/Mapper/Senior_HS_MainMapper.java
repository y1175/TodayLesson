package com.todaylesson.Mapper;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.SeniorDTO;

@Mapper
public interface Senior_HS_MainMapper {

	public SeniorDTO seniorPageInfo(String member_id);

}
