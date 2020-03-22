package com.todaylesson.DTO;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class SQLjoin_Member_Senior_Lesson_OrderList_Sales_CalculateDTO {
	
	//MemberDTO
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
	
	//SeniorDTO
	private int senior_no;
	//private String member_id;
	private String senior_email;
	private String senior_phone;
	private String senior_crno;
	private String senior_nick;
	private String senior_bank_name;
	private String senior_account_name;
	private String senior_account_num;
	private String senior_register_date;
	
	//LessonDTO
	private int lesson_no;
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
	//private int senior_no;
	
	//OrderListDTO
	private int orderlist_no;
	private int product_no;
	//private String member_id; FK
	private String orderlist_receiver;
	private String orderlist_addr;
	private String orderlist_phone;
	private int cart_no;
	private String orderlist_date;
	private int orderlist_orderstatus;
	private int orderlist_paystatus;
	private int orderlist_cost;
	private int orderlist_usepoint;
	
	//OrderDetailDTO
	private int order_detail_no;
	//private int orderlist_no;
	//private int product_no;
	//private int lesson_no;
	private int order_count;
	
	//SalesDTO
	//private int orderlist_no; FK
	private int sales_comm;
	private int sales_surtax;
	private String sales_search_startdate;
	private String sales_search_enddate;

	
	//CalculateDTO
	//private int orderlist_no; FK
	private int calculate_no;
	private String calculate_date; //정산신청일
	private int lessondate_count; //레슨 수업일 or 레슨 수업일 +5 결제건수

}
