package com.todaylesson.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.AmChartDTO;
import com.todaylesson.DTO.Stat_LogDTO;

@Mapper
public interface Admin_YI_Statistics_Mapper {

	public List<Stat_LogDTO> allLog(HashMap<String, Object> hm);

	public void createTmp();

	public void setVariable();

	public void dropTmp();

	public List<Stat_LogDTO> distinct_member();

	public List<AmChartDTO> chartOutput();

	public int joinCount(HashMap<String, Object> hm);

	public List<AmChartDTO> chartOutput2();

}
