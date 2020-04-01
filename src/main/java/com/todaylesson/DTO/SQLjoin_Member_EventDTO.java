package com.todaylesson.DTO;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class SQLjoin_Member_EventDTO {
	//member
		private String member_id;
		private int member_no;
		private String member_pwd;
		private String member_name;
		private String member_birth;
		private String member_phone;
		private String member_addr;
		private int member_zipcode;
		private int member_point;
		private int member_level;
		private String member_email;
		private String member_nick;
		private String member_join_date;
		private String member_key;
		private String member_value;
		private String member_img;
		private List<Member_AuthDTO> authList;
	
		
		//event
		private int event_no;
		private int event_group;
		private String event_title;
		private String event_content;
		private String event_startperiod;
		private String event_endperiod;
		private String event_thumbnail;
		private String event_thumbexplain;
		
		//eventreply
		private int event_reply_no;
		private String event_reply_date;
		private String event_reply_content;
	
}
