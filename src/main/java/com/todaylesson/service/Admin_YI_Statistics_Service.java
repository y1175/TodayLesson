package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.Stat_LogDTO;

public interface Admin_YI_Statistics_Service {

	public List<Stat_LogDTO> allLog();

	public void createTmp();

	public void setVariable();

	public void dropTmp();

	public List<Stat_LogDTO> distinct_member();

}
