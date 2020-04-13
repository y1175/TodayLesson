package com.todaylesson.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import com.todaylesson.DTO.SQLjoin_OrderList_Order_detail_MemberDTO;
import com.todaylesson.Mapper.User_YI_OrderList_Mapper;

@Service(value="user_YI_OrderList_Service")
public class User_YI_OrderList_ServiceImple implements User_YI_OrderList_Service{


	@Resource(name="user_YI_OrderList_Mapper")
	private User_YI_OrderList_Mapper mapper;

	@Override
	public int totalCount(String member_id,String start_date, String end_date) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm=new HashMap<String, Object>();
		hm.put("start_date", start_date);
		hm.put("end_date", end_date);
		hm.put("member_id",member_id);
		return mapper.getCount(hm);
	}

	@Override
	public List<SQLjoin_OrderList_Order_detail_MemberDTO> orderlist(String member_id,String start_date, String end_date, int startRow,
			int endRow) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm=new HashMap<String, Object>();
		hm.put("member_id", member_id);
		hm.put("start_date", start_date);
		hm.put("end_date", end_date);
		hm.put("startrow", startRow);
		hm.put("endrow", endRow);
		return mapper.list(hm);
	}

	@Override
	public List<SQLjoin_OrderList_Order_detail_MemberDTO> orderdetail() {
		// TODO Auto-generated method stub
		return mapper.detailList();
	}

	@Override
	public SQLjoin_OrderList_Order_detail_MemberDTO orderinfo(int orderlist_no) {
		// TODO Auto-generated method stub
		return mapper.orderinfo(orderlist_no);
	}

	@Override
	public List<SQLjoin_OrderList_Order_detail_MemberDTO> orderinfo_detail(
			int orderlist_no) {
		// TODO Auto-generated method stub
		return mapper.orderinfo_detail(orderlist_no);
	}

	@Override
	public int order_cancel(int orderlist_no) {
		// TODO Auto-generated method stub
		return mapper.orderlist_cancel(orderlist_no);
	}

	@Override
	public int my_member_point(int orderlist_no) {
		// TODO Auto-generated method stub
		return mapper.my_member_point(orderlist_no);
	}

	@Override
	public void cancelPoint(int my_member_point,String member_id) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm=new HashMap<>();
		hm.put("my_member_point",my_member_point);
		hm.put("member_id",member_id);
		
		mapper.cancelPoint(hm);
	}
}
