package com.todaylesson.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class OrderListDTO {

	private int orderlist_no;
	private String member_id;
	private int product_no;
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
