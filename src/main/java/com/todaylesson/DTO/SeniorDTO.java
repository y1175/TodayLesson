package com.todaylesson.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class SeniorDTO {

	private int senior_no;
	private String member_id;
	private String senior_email;
	private String senior_phone;
	private String senior_crno;
	private String senior_nick;
	private String senior_bank_name;
	private String senior_account_name;
	private String senior_account_num;
}
