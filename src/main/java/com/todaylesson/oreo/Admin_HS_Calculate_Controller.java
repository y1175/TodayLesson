package com.todaylesson.oreo;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.todaylesson.service.Admin_HS_Calculate_Service;

@Controller
@RequestMapping("/todaylessonadmin/")
public class Admin_HS_Calculate_Controller {

	@Resource(name="admin_HS_Calculate_Service")
	private Admin_HS_Calculate_Service adminCalculateService;
	
	@RequestMapping("/admin_calculte_list")
	public String adminCalculteList(Model model) {
		
		return "/TodayLesson_AdminPage/hs_ad_calculte_list.hs_ad_main_section";
	}
	
	@RequestMapping("admin_calculte_datail")
	public String adminCalculteDetail() {
		
		return"/TodayLesson_AdminPage/hs_ad_calculte_detail.hs_ad_main_section";
	}
}
