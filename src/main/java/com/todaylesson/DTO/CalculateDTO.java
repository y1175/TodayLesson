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
	//private int calculate_cost; //정산금액
	private String calculate_bank_name; //정산계좌 은행명
	private String calculate_account_name; //정산계좌 계좌주
	private String calculate_account_num; // 정산계좌 계좌번호
	private String calculate_crno; //정산 사업자번호
	private String calculate_crno_name; // 정산 사업자명
	private String calculate_name; //정산신청자
	private String calculate_phone; // 정산신청자폰번호
	
	//시니어 정보
	private int senior_no;
	
}
