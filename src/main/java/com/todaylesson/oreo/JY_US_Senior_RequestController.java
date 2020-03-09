package com.todaylesson.oreo;

import javax.annotation.Resource;

import org.apache.maven.plugin.descriptor.MojoDescriptor;
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
	
	// 시니어 지원 버튼
	@RequestMapping("senior_request")
	public String senior_Request_PopUp() {
		return "TodayLesson_UserPage/jy_us_senior_request";
	}
	
	// 시니어 지원 버튼 팝업 > 예 누르면 시니어로 전환됨
	@RequestMapping("senior_request_form/{member_id}")
	public String senior_Request_Button(@PathVariable String member_id, Model model) {
		int mem_level=seniorservice.check_senior(member_id);
		
		if (mem_level == 1) {
			// 시니어로 레벨업됨
			seniorservice.new_senior(member_id);
			model.addAttribute("mem_level",mem_level);

		} else {
			model.addAttribute("mem_level",mem_level);
		}


		return "TodayLesson_UserPage/jy_us_senior_form";

	}
	
	// 시니어 지원 버튼 팝업에서 예 누르면 나오는 폼
	@RequestMapping("senior_switch/{member_id}")
	public String senior_Switch(@PathVariable String member_id) {
			return "TodayLesson_UserPage/jy_us_senior_switch";
	}
	
	// 당신은 이미 시니어 입니다.
	@RequestMapping("you_are_senior")
	public String you_are_senior() {
		return "TodayLesson_SeniorPage/jy_sn_you_are_senior";
	}
	
	// 관련 정보 입력하면 시니어 정보 업데이트
	@RequestMapping("plus_senior")
	public String plus_senior(SeniorDTO dto, Model model) {
		int result = seniorservice.plus_senior(dto);
		model.addAttribute("result",result);
		return "TodayLesson_UserPage/jy_us_insertresult";
	}
	
	
}
