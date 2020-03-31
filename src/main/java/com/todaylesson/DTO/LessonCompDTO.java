package com.todaylesson.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class LessonCompDTO {

	private String member_id;
	private int lessondetail_comp;
	private int lessondetail_no;
	private int lesson_no;
	
}
