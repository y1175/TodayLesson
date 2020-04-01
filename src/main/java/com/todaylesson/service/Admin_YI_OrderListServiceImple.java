package com.todaylesson.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import com.todaylesson.DTO.SQLjoin_OrderList_Order_detail_MemberDTO;
import com.todaylesson.Mapper.Admin_YI_OrderList_Mapper;

@Service(value="admin_YI_OrderListService")
public class Admin_YI_OrderListServiceImple implements Admin_YI_OrderListService {

	@Resource(name="admin_YI_OrderList_Mapper")
	private Admin_YI_OrderList_Mapper mapper;

	@Override
	public int totalCount(int orderlist_category, int orderlist_search) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm=new HashMap<String, Object>();
		hm.put("category", orderlist_category);
		hm.put("search", orderlist_search);
		return mapper.getCount(hm);
	}

	@Override
	public List<SQLjoin_OrderList_Order_detail_MemberDTO> orderlist(int orderlist_orderstatus, int orderlist_category, int orderlist_search,
			String start_date, String end_date, int startRow, int endRow) {
		HashMap<String, Object> hm=new HashMap<String, Object>();
		
		hm.put("orderlist_orderstatus", orderlist_orderstatus);
		hm.put("category", orderlist_category);
		hm.put("search", orderlist_search);
		hm.put("start_date", start_date);
		hm.put("end_date", end_date);
		hm.put("startrow", startRow);
		hm.put("endrow", endRow);
		return mapper.orderlist(hm);
	}

	@Override
	public int order_modify(int orderlist_no, int order_status) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm=new HashMap<String, Object>();
		hm.put("orderlist_no", orderlist_no);
		hm.put("order_status",order_status);
		
		return mapper.order_modify(hm);
	}

	@Override
	public List<SQLjoin_OrderList_Order_detail_MemberDTO> refundlist(int orderlist_paystatus,
			int orderlist_category, int orderlist_search, String start_date, String end_date, int startRow,
			int endRow) {
		HashMap<String, Object> hm=new HashMap<String, Object>();
		hm.put("orderlist_orderstatus", orderlist_paystatus);
		hm.put("category", orderlist_category);
		hm.put("search", orderlist_search);
		hm.put("start_date", start_date);
		hm.put("end_date", end_date);
		hm.put("startrow", startRow);
		hm.put("endrow", endRow);
		return mapper.refundlist(hm);
	}

	@Override
	public int order_refund_modify(int orderlist_no, int pay_status) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm=new HashMap<String, Object>();
		hm.put("orderlist_no", orderlist_no);
		hm.put("pay_status",pay_status);
		
		return mapper.order_refund_modify(hm);
	}
	
}
