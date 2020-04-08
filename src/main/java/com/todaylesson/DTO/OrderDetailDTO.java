package com.todaylesson.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class OrderDetailDTO {
	private int order_detail_no;
	private int orderlist_no;
	private int product_no;
	private int lesson_no;
	private int order_count;
	
	//DTO에만 추가했음
	private String product_name;
	private String product_thumb;
	private String product_after_cost;
	private String lesson_title;
	private int product_stock;

}
