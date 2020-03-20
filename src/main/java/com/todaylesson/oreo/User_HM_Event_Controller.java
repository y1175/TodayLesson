package com.todaylesson.oreo;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.todaylesson.service.User_HM_EventService;

@Controller
public class User_HM_Event_Controller {

	@Resource(name="user_hm_eventservice")
	private User_HM_EventService service;
	
	
	@RequestMapping("/hm_us_event")
	public String hm_us_event_main() {
		
		return "/TodayLesson_UserPage/hm_us_event.us_my_section";
	}
	
}
