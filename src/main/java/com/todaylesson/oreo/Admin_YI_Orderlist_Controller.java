package com.todaylesson.oreo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Admin_YI_Orderlist_Controller {

	@RequestMapping("/todaylessonadmin/admin_orderlist")
	public String orderlist()
	{
		return "/TodayLesson_AdminPage/yi_ad_orderlist";
	}
}
