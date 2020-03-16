package com.todaylesson.oreo;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.todaylesson.service.Admin_HM_EventService;

@Controller
public class Admin_HM_Event_Controller {

	
	@Resource(name="admin_hm_eventservice")
	private Admin_HM_EventService service;
	
	@RequestMapping("/hm_ad_event_manage")
	private String eventmanagelist()
	{
		
		return "TodayLesson_AdminPage/hm_ad_event_manage.hs_ad_main_section";
	}
	
	
	@RequestMapping("/hm_ad_event_insert")
	private String eventinsert()
	{
		
		return "TodayLesson_AdminPage/hm_ad_event_insertresult.hs_ad_main_section";
	}
}
