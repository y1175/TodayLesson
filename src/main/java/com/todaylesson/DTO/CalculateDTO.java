package com.todaylesson.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class CalculateDTO {

	private int orderlist_no;
	private int calculate_no;
	private String calculate_date; //정산신청일
	private int lessondate_count; //레슨 수업일 or 레슨 수업일 +5 결제건수
}
