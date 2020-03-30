package com.todaylesson.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class MyLessonDTO {

	private int order_detail_no;
	private int orderlist_no;
	private int product_no;
	private int lesson_no;
	private int order_count;
	private String product_name;
	private String lesson_title;

	private String member_id;
	private String orderlist_receiver;
	private String orderlist_addr;
	private int orderlist_zipcode;
	private String orderlist_phone;
	private int cart_no;
	private String orderlist_date;
	private int orderlist_orderstatus;
	private int orderlist_paystatus;
	private int orderlist_cost;
	private int orderlist_calculatestatus;
	private int orderlist_usepoint;
	private String orderlist_msg;
	
}
