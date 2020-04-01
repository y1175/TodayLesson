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
public class PdReviewDTO {

	private int pdreview_no;
	private int orderlist_no;
	private String pdreview_title;
	private String pdreview_content;
	private String pdreview_date;
	//member테이블꺼
	private String member_id;
	private int product_no;
	//product테이블
	private String product_name;
	
}
