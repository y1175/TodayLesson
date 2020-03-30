package com.todaylesson.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class EventreplyDTO {

	private int event_no;
	private String member_id;
	private String event_content;
	private int event_reply_no;
	private String event_reply_date;

}
