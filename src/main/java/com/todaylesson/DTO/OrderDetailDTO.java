package com.todaylesson.DTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderDetailDTO {
	private int order_detail_no;
	private int orderlist_no;
	private int product_no;
	private int lesson_no;
	private int order_count;

}
