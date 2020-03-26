package com.todaylesson.oreo;


import java.security.Principal;
import java.util.List;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.security.core.context.SecurityContextHolder;

import org.springframework.security.core.userdetails.UserDetails;

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
								,Model model) throws Exception
	{

		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails=(UserDetails)principal;
		String member_id=userDetails.getUsername();
		System.out.println("id:"+member_id);
		model.addAttribute("member_id",member_id);
		

	
		
		int totalCount= service.totalCount(member_id,start_date, end_date);
		int pageSize=5;
		int blockSize=5;
		
		PageMaker page=new PageMaker(currPage,totalCount,pageSize,blockSize);
		
		List<SQLjoin_OrderList_Order_detail_MemberDTO> list=service.orderlist(member_id,start_date,end_date
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
	
	@RequestMapping("/todaylessonmypage/myorderlist_orderinfo/{orderlist_no}")
	public String orderinfo(@PathVariable int orderlist_no
			,Model model)
	{
		SQLjoin_OrderList_Order_detail_MemberDTO dto=service.orderinfo(orderlist_no);
		List<SQLjoin_OrderList_Order_detail_MemberDTO> list=service.orderinfo_detail(orderlist_no);
		
		model.addAttribute("dto",dto);
	model.addAttribute("list",list);
		
		return "/TodayLesson_UserPage/yi_us_orderlist_detail";
	}
	
	@RequestMapping("/todaylessonmypage/user_myorderlist_cancel/{orderlist_no}")
	public String myorderlist_cancel(@PathVariable int orderlist_no,Model model)
	{
		int result=service.order_cancel(orderlist_no);
		model.addAttribute("result",result);
		return"/TodayLesson_UserPage/yi_us_orderlist_cancel";
	}
	
}