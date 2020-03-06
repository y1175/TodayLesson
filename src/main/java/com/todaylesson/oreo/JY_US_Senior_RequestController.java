package com.todaylesson.oreo;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.todaylesson.service.JY_US_SeniorService;

@Controller
public class JY_US_Senior_RequestController {

	@Resource(name="senior_service")
	private JY_US_SeniorService seniorservice;
	
	
	@RequestMapping("senior_request")
	public String senior_Request_PopUp() {
		return "TodayLesson_UserPage/jy_us_senior_request";
	}
	

	@RequestMapping("senior_request_form/{member_id}")
	public String senior_Request_Button(@PathVariable String member_id) {
		seniorservice.new_senior(member_id);
		return "TodayLesson_UserPage/jy_us_senior_form";
	}
	
	@RequestMapping("senior_switch/{member_id}")
	public String senior_Form() {
		return "TodayLesson_UserPage/jy_us_senior_switch";
	}
	
}
