package com.todaylesson.oreo;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.todaylesson.DTO.BannerDTO;
import com.todaylesson.DTO.EventDTO;
import com.todaylesson.DTO.PageMaker;
import com.todaylesson.DTO.SQLjoin_Member_EventDTO;
import com.todaylesson.service.User_HM_EventService;

@Controller
@RequestMapping("/todaylesson/")
public class User_HM_Event_Controller {

	@Resource(name="user_hm_eventservice")
	private User_HM_EventService service;
	
	
	@RequestMapping("/hm_us_event")
	public String hm_us_event_main(
			@RequestParam(required=false, defaultValue="") String search
			,@RequestParam(required=false, defaultValue="") String searchtxt
			,@RequestParam(required=false, defaultValue="1") int currPage
			,@RequestParam(required=false, defaultValue="start") String event
			,Model model
			) {
		int totalCount= service.totalCount(search, searchtxt);
		int pageSize=15;
		int blockSize=5;
		
 
		PageMaker page = new PageMaker(currPage, totalCount, pageSize, blockSize);
		
		
		List<EventDTO> list = service.hm_us_eventlist(search,searchtxt,page.getStartRow()
				,page.getEndRow(),event);
		
		List<BannerDTO> banner = service.hm_us_bannerlist();
		
		
		model.addAttribute("list",list);
		model.addAttribute("page",page);
		model.addAttribute("search",search);
		model.addAttribute("searchtxt",searchtxt);
		model.addAttribute("banner",banner);
		
		return "/TodayLesson_UserPage/hm_us_event.us_main_section";
	}
	

	@RequestMapping("/hm_us_event_detail/{event_no}")
	public String hm_us_event_detail(@PathVariable int event_no,Model model) {
		
		EventDTO dto = service.hm_us_event_detail(event_no);
		model.addAttribute("dto",dto);
		
		return "/TodayLesson_UserPage/hm_us_event_detail.us_main_section";
	}
	
	

}

