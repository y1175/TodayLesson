package com.todaylesson.oreo;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.todaylesson.DTO.SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO;
import com.todaylesson.service.Admin_HS_Sales_Service;

@Controller
@RequestMapping("/todaylessonadmin/")
public class Admin_HS_Sales_Controller {

	@Resource(name="admin_HS_Sales_Service")
	private Admin_HS_Sales_Service adminSalesService;
	
	@RequestMapping("/admin_sales_list")
	public String adminSalesList(@RequestParam(required=false, defaultValue="") String search
			                    ,@RequestParam(required=false, defaultValue="") String searchtxt
			                    ,@RequestParam(required=false, defaultValue="") String start_date
			                    ,@RequestParam(required=false, defaultValue="") String end_date
			                    ,Model model) {
		
		List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> adminSeniorSalesList=
			adminSalesService.adminSeniorSalesList(search, search, start_date, end_date);
		
		model.addAttribute("adminSeniorSalesList", adminSeniorSalesList);
		model.addAttribute("search",search);
		model.addAttribute("searchtxt",searchtxt);
		model.addAttribute("start_date",start_date);
		model.addAttribute("end_date",end_date);
		
		return "/TodayLesson_AdminPage/hs_ad_sales_list.hs_ad_main_section";
	}
	
	@RequestMapping("admin_sales_datail/{orderlist_no}")
	public String adminSalesDetail(@PathVariable int orderlist_no, Model model) {
		
		SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO adminSeniorSalesDetail=
				adminSalesService.adminSeniorSalesDetail(orderlist_no);
		model.addAttribute("adminSeniorSalesDetail", adminSeniorSalesDetail);
		
		return"/TodayLesson_AdminPage/hs_ad_sales_detail.hs_ad_main_section";
	}
	
}
