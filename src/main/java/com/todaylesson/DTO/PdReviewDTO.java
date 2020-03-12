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
	private String pdreview_filepath;
	private String pdreview_content;
	private String pdreview_date;
	//memberÅ×ÀÌºí²¨
	private String member_id;
	private int product_no;
	
}
