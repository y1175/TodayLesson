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
public class MyLikeDTO {

	private int mylike_no;
	private int product_no;
	private String product_thumb;
	private int lesson_no;
	private int product_cost;
	private int product_after_cost;
	private String product_name;
	private String member_id;
}
