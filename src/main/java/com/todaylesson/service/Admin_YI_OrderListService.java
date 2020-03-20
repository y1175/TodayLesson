package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.SQLjoin_OrderList_Order_detail_MemberDTO;

public interface Admin_YI_OrderListService {

	int totalCount(int orderlist_category, int orderlist_search);

	List<SQLjoin_OrderList_Order_detail_MemberDTO> orderlist(int orderlist_orderstatus, int orderlist_category, int orderlist_search,
			String start_date, String end_date, int startRow, int endRow);

	int order_modify(int orderlist_no, int order_status);

}
