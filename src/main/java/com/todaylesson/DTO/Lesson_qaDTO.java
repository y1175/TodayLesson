package com.todaylesson.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Lesson_qaDTO {

	private int lesson_qa_no;
	private int lesson_qa_group;
	private int lesson_qa_group_layer;
	private String member_id;
	private String lesson_qa_reply_content;
	private String lesson_qa_register_date;
	private String lesson_qa_reply_secret;
	private String lesson_qa_reply_password;
	private int lesson_no;
	private String lesson_qa_answer_content;
	private int lesson_qa_originno;
	
}
