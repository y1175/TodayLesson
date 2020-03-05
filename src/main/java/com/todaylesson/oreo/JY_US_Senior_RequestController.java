package com.todaylesson.oreo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JY_US_Senior_RequestController {

	
	@RequestMapping("senior_request")
	public String senior_Request_PopUp() {
		return "TodayLesson_UserPage/jy_senior_request";
	}
	

	@RequestMapping("senior_request_form/{member_id}")
	public String senior_Request_Button() {
		return "TodayLesson_UserPage/jy_senior_form";
	}
	
	@RequestMapping("senior_switch/{member_id}")
	public String senior_Form() {
		return "TodayLesson_UserPage/jy_senior_switch";
	}
	
}
