package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.AmChartDTO;
import com.todaylesson.DTO.Stat_LogDTO;

public interface Admin_YI_Statistics_Service {

	public List<Stat_LogDTO> allLog(String ymd, String start_date, String end_date);

	public List<Stat_LogDTO> distinct_member(String ymd, String start_date, String end_date);

	public List<AmChartDTO> chartOutput();

	public int joinCount(String ymwd, String countdate);

	public List<AmChartDTO> chartOutput2();

}
