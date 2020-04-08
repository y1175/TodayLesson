package com.todaylesson.DTO;

import java.util.List;

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
public class SQLjoin_OrderList_Order_detail_MemberDTO {

	//oderlist
	private int orderlist_no;
	private int product_no;
	private int lesson_no;
	private int cart_no;
	private String orderlist_date;
	private int orderlist_orderstatus;
	private int orderlist_paystatus;
	private int orderlist_calculatestatus;
	private int orderlist_cost;
	private String orderlist_phone;
	private String orderlist_msg;
	private int orderlist_usepoint;
	private String orderlist_receiver;
	private String orderlist_addr;
	private int order_count;
	
	//member
	private String member_id;
	private int member_no;
	private String member_pwd;
	private String member_name;
	private String member_birth;
	private String member_phone;
	private String member_addr;
	private int member_zipcode;
	private int member_point;
	private int member_level;
	private String member_email;
	private String member_nick;
	private String member_join_date;
	private String member_key;
	private String member_value;
	private String member_img;
	private boolean enabled;
	private List<Member_AuthDTO> authList;
	
	//product
	private String product_name;
	private int product_cost;
	private int product_after_cost;
	private int product_stock;
	private int product_like;
	private String product_content;
	private int product_category;
	private int product_sale;
	private String product_thumb;
	private String product_img;
	private int product_option;
	
	//lesson
	private String lesson_title;
	private String lesson_content;
	private int lesson_cost;
	private int lesson_member_max;
	private int lesson_category;
	private String lesson_thumb;
	private String lesson_register_date;
	private String lesson_open_period;
	private String lesson_close_period;
	private int lesson_number;
	private int lesson_type;
	private int lesson_junior_count;
	private int lesson_result;
	private String lesson_time;
	private String lesson_addr;
	private String lesson_lat;
	private String lesson_long;
	private int lesson_readno;
	private String lesson_senior_title;
	private String lesson_senior_content;
	private String lesson_zipno;
	private int senior_no;
	private String lesson_date;
	
	//senior
	private String senior_email;
	private String senior_phone;
	private String senior_crno;
	private String senior_nick;
	private int senior_bank_name;
	private String senior_account_name;
	private String senior_account_num;
	private String senior_register_date;
	private String senior_crno_name;
	
}
