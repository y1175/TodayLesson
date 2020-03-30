package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.Stat_LogDTO;

public interface Admin_YI_Statistics_Service {

	public List<Stat_LogDTO> allLog(String ymd, String start_date, String end_date);

	public void createTmp();

	public void setVariable();

	public void dropTmp();

	public List<Stat_LogDTO> distinct_member();

	public List<Stat_LogDTO> chartOutput();

}
