package com.todaylesson.DTO;

import lombok.AllArgsConstructor;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class CartDTO {
	

	private int cart_no;
	private int cart_amount;
	private int product_no;
	private int product_cost;
	private int product_after_cost;
	private String product_thumb;
	private String product_name;
	private int lesson_no;
	private String member_id;
}
