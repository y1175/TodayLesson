package com.todaylesson.oreo;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.todaylesson.DTO.SeniorDTO;
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
	public String senior_Switch(@PathVariable String member_id) {
		return "TodayLesson_UserPage/jy_us_senior_switch";
	}
	
	@RequestMapping("plus_senior")
	public String plus_senior(SeniorDTO dto, Model model) {
		int result = seniorservice.plus_senior(dto);
		model.addAttribute("result",result);
		return "TodayLesson_UserPage/jy_us_insertresult";
	}
	
	
}
