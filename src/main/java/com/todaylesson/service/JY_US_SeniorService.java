package com.todaylesson.service;

import com.todaylesson.DTO.SeniorDTO;

public interface JY_US_SeniorService {

	public void new_senior(String member_id);

	public int plus_senior(SeniorDTO dto);

	public int check_senior(String member_id);

	public SeniorDTO select_senior(String member_id);

	public int update_senior(SeniorDTO dto);

	
}
