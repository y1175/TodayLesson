package com.todaylesson.oreo;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.todaylesson.service.Admin_HS_Sales_Service;

@Controller
@RequestMapping("/todaylessonadmin/")
public class Admin_HS_Sales_Controller {

	@Resource(name="admin_HS_Sales_Service")
	private Admin_HS_Sales_Service adminSalesService;
	
	@RequestMapping("/admin_sales_list")
	public String adminSalesList(Model model) {
		return "/TodayLesson_AdminPage/hs_ad_sales_list.hs_ad_main_section";
	}
}
