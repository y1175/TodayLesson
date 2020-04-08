package com.todaylesson.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.DTO.SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO;
import com.todaylesson.Mapper.Admin_HS_Sales_Mapper;

@Service(value="admin_HS_Sales_Service")
public class Admin_HS_Sales_ServiceImple implements Admin_HS_Sales_Service {
	
	@Resource(name="admin_HS_Sales_Mapper")
	private Admin_HS_Sales_Mapper adminSalesMapper;

	@Override
	public List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> adminSeniorSalesList(
			String search, String searchtxt, String start_date, String end_date) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm=new HashMap<String, Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("start_date", start_date);
		hm.put("end_date", end_date);
		
		return adminSalesMapper.adminSeniorSalesList(hm);
	}

	@Override
	public SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO adminSeniorSalesDetail(int orderlist_no) {
		// TODO Auto-generated method stub
		return adminSalesMapper.adminSeniorSalesDetail(orderlist_no);
	}


}

