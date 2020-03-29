package com.todaylesson.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.Stat_LogDTO;

@Mapper
public interface Admin_YI_Statistics_Mapper {

	public List<Stat_LogDTO> allLog();

	public void createTmp();

	public void setVariable();

	public void dropTmp();

	public List<Stat_LogDTO> distinct_member();

}
