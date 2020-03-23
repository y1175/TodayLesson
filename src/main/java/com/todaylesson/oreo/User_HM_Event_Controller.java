package com.todaylesson.oreo;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.todaylesson.DTO.EventDTO;
import com.todaylesson.service.User_HM_EventService;

@Controller
@RequestMapping("/todaylessonuser/")
public class User_HM_Event_Controller {

	@Resource(name="user_hm_eventservice")
	private User_HM_EventService service;
	
	
/*	@RequestMapping("/hm_us_event")
	public String hm_us_event_main() {
		
		List<EventDTO> list = service.hm_us_eventlist();
		return "/TodayLesson_UserPage/hm_us_event.us_main_section";
	}*/
	
	
	
/*
	@RequestMapping("/hm_us_event_detail/{no}")
	public String hm_us_event_detail(@PathVariable int no,Model model) {
		
		int event_no = no;
		EventDTO dto = service.hm_us_event_detail(no);
		model.addAttribute("dto",dto);
		
		return "/TodayLesson_UserPage/hm_us_event_detail.us_main_section";
	}*/
}

