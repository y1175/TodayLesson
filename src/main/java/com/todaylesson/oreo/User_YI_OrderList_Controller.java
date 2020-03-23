package com.todaylesson.oreo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		int totalCount= service.totalCount(start_date, end_date);
		int pageSize=15;
		int blockSize=5;
		
		PageMaker page=new PageMaker(currPage,totalCount,pageSize,blockSize);
		
		List<SQLjoin_OrderList_Order_detail_MemberDTO> list=service.orderlist(start_date,end_date
				,page.getStartRow()
				,page.getEndRow());
		System.out.println("list:"+list.get(0).getOrderlist_no());
		model.addAttribute("list",list);
		model.addAttribute("page",page);
		model.addAttribute("start_date",start_date);
		model.addAttribute("end_date",end_date);

/*		List<SQLjoin_OrderList_Order_detail_MemberDTO> detailList= new ArrayList<SQLjoin_OrderList_Order_detail_MemberDTO>();
		for(int i=0; i<list.size();i++)
		{
			SQLjoin_OrderList_Order_detail_MemberDTO dto=service.orderdetail(list.get(i).getOrderlist_no());
			detailList.add(dto);
		}
		
		model.addAttribute("detailList",detailList);*/
		
		return "/TodayLesson_UserPage/yi_us_orderlist";
	}
	
	@ResponseBody
	@RequestMapping("/todaylessonmypage/myorderlist_detail/")
	public List<SQLjoin_OrderList_Order_detail_MemberDTO> orderdetail()
	{
		List<SQLjoin_OrderList_Order_detail_MemberDTO> detailList=service.orderdetail();
		System.out.println("length:"+detailList.size());
		return detailList;
	}
	
}
