package com.todaylesson.oreo;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.todaylesson.service.User_YI_OrderList_Service;

@Controller
public class User_YI_OrderList_Controller {

	@Resource(name="user_YI_OrderList_Service")
	private User_YI_OrderList_Service service;
	
	@RequestMapping("/todaylessonmypage/user_orderlist")
	public String user_orderlist()
	{
		return "/TodayLesson_UserPage/yi_us_orderlist";
	}
}
