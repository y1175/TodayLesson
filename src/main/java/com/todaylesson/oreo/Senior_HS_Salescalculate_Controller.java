package com.todaylesson.oreo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Senior_HS_Salescalculate_Controller {
	
	@RequestMapping("/hs_sn_sales_list")
	public String salesList() {
		return "/TodayLesson_SeniorPage/hs_sn_sales_list.sn_main_section";
	}

}
