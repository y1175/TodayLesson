package com.todaylesson.oreo;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.todaylesson.DTO.SQLjoin_Member_Senior_Lesson_OrderList_Sales_CalculateDTO;
import com.todaylesson.service.Senior_HS_Salescalculate_Service;

@Controller
public class Senior_HS_Salescalculate_Controller {
	
	@Resource(name="senior_HS_Salescalculate_Service")
	private Senior_HS_Salescalculate_Service salescalculateService;
	
	@RequestMapping("/senior_sales_list/{senior_no}")
	public String salesList(@PathVariable int senior_no 
	            		   //,@RequestParam(required=false, defaultValue="") String start_date
			               //,@RequestParam(required=false, defaultValue="") String end_date
			               ,@RequestParam(required=false, defaultValue="") String search
			               ,@RequestParam(required=false, defaultValue="") String searchtxt
			               , Model model) {
		//매출현황전체리스트
		List<SQLjoin_Member_Senior_Lesson_OrderList_Sales_CalculateDTO> salesList=
	         salescalculateService.salesList(senior_no, search, searchtxt); //start_date, end_date,
		
		model.addAttribute("salesList", salesList);
		//model.addAttribute("start_date",start_date);
		//model.addAttribute("end_date",end_date);
		model.addAttribute("search",search);
		model.addAttribute("searchtxt",searchtxt);
		
		return "/TodayLesson_SeniorPage/hs_sn_sales_list.sn_main_section";
	}
	
	@RequestMapping("/senior_calculate_requestlist/{senior_no}")
	public String calculateRequestList( @PathVariable int senior_no, Model model) {
		//정산신청 리스트 정산번호 / 정산상태 / 정산신청일
		List<SQLjoin_Member_Senior_Lesson_OrderList_Sales_CalculateDTO> cal_requestlist=salescalculateService.calculateRequsetList(senior_no);
		
		model.addAttribute("cal_requestlist", cal_requestlist);
		
		return "/TodayLesson_SeniorPage/hs_sn_calculate_requestlist.sn_main_section";
	}

}
