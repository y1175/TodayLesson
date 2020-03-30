package com.todaylesson.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Stat_LogDTO {
	
	private int stat_log_no;
	private String stat_logdate;
	private String member_id;
	
	private int total;
	private int member_total;
	
	//AmChart용 데이터
	private String regYear;
	private String regMonth;
	private String regDay;
}
