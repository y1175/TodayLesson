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
	
	
	public SeniorDTO(String member_id, String senior_email, String senior_phone, String senior_crno,
			String senior_nick, String senior_bank_name, String senior_account_name, String senior_account_num) {
		this.member_id = member_id;
		this.senior_email = senior_email;
		this.senior_phone = senior_phone;
		this.senior_crno = senior_crno;
		this.senior_nick = senior_nick;
		this.senior_bank_name = senior_bank_name;
		this.senior_account_name = senior_account_name;
		this.senior_account_num = senior_account_num;
	}
	
	public SeniorDTO(String member_id, String senior_email, String senior_phone,
			String senior_nick, String senior_bank_name, String senior_account_name, String senior_account_num) {
		this.member_id = member_id;
		this.senior_email = senior_email;
		this.senior_phone = senior_phone;
		this.senior_nick = senior_nick;
		this.senior_bank_name = senior_bank_name;
		this.senior_account_name = senior_account_name;
		this.senior_account_num = senior_account_num;
	}
	
	
	
	
}
