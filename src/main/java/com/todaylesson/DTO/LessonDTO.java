

package com.todaylesson.DTO;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class LessonDTO {

	private int lesson_no;
	private String lesson_title;
	private String lesson_content;
	private int lesson_cost;
	private int lesson_member_max;
	private int lesson_category;
	private String lesson_thumb;
	private String lesson_register_date;
	private String lesson_open_period;
	private String lesson_close_period;
	private int lesson_number;
	private int lesson_type;
	private int lesson_junior_count;
	private int lesson_result;
	private String lesson_date_time;
	private String lesson_addr;
	private String lesson_lat;
	private String lesson_long;
	private int lesson_readno;
	private String lesson_senior_title;
	private String lesson_senior_content;
	private String lesson_zipno;
	private int senior_no;
	private int lesson_earlybird;
	private int lesson_like;
	
	//얼리버드 senior조인 시 쓰기위해 한개 추가
	private String senior_nick;
	
	// 퍼센트 가져올라고
	private float lesson_procent;
	
	// 보상 여부 가져올라고
	private int lesson_reward;
	

	
}
