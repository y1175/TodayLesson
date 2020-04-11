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
public class CartDTO {
	

	private Integer cart_no;
	private Integer cart_amount;
	private Integer product_no;
	private Integer product_cost;
	private Integer product_after_cost;
	private String product_thumb;
	private String product_name;
	private Integer lesson_no;
	private String lesson_title;
	private Integer lesson_cost;
	private String lesson_thumb;
	private String member_id;
}
