package com.todaylesson.oreo;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.todaylesson.DTO.PageMaker;
import com.todaylesson.DTO.SQLjoin_OrderList_Order_detail_MemberDTO;
import com.todaylesson.service.User_YI_OrderList_Service;

@Controller
public class User_YI_OrderList_Controller {

	@Resource(name="user_YI_OrderList_Service")
	private User_YI_OrderList_Service service;
	
	@RequestMapping("/todaylessonmypage/user_myorderlist")
	public String user_orderlist(@RequestParam(required=false, defaultValue="") String start_date
								,@RequestParam(required=false, defaultValue="") String end_date
								,@RequestParam(required=false, defaultValue="1") int currPage
								,Model model)
	{
		/*int totalCount= service.totalCount(start_date, end_date);
		int pageSize=15;
		int blockSize=5;
		
		PageMaker page=new PageMaker(currPage,totalCount,pageSize,blockSize);
		
		List<SQLjoin_OrderList_Order_detail_MemberDTO> list=service.orderlist(start_date,end_date);
		model.addAttribute("list",list);*/
		
		
		
		return "/TodayLesson_UserPage/yi_us_orderlist";
	}
}
