package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.SQLjoin_OrderList_Order_detail_MemberDTO;

public interface User_YI_OrderList_Service {

	public int totalCount(String member_id,String start_date, String end_date);

	public List<SQLjoin_OrderList_Order_detail_MemberDTO> orderlist(String member_id,String start_date, String end_date,  int startRow,
			int endRow);

	public List<SQLjoin_OrderList_Order_detail_MemberDTO> orderdetail();

}
