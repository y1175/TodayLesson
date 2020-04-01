package com.todaylesson.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class AmChartDTO {
	private int stat_log_no;
	private String stat_logdate;
	private String member_id;
	
	private int total;
	private int member_total;
	
	//AmChart용 데이터
	private String regYear;
	private String regMonth;
	private String regDay;
	
	private String member_join_date;
}
