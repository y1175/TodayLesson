package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.SQLjoin_OrderList_Order_detail_MemberDTO;

public interface Admin_YI_OrderListService {

	public int totalCount(int orderlist_orderstatus, int orderlist_category, String start_date, String end_date, int orderlist_search);

	public List<SQLjoin_OrderList_Order_detail_MemberDTO> orderlist(int orderlist_orderstatus, int orderlist_category, int orderlist_search,
			String start_date, String end_date, int startRow, int endRow);

	public int order_modify(int orderlist_no, int order_status);

	public List<SQLjoin_OrderList_Order_detail_MemberDTO> refundlist( int orderlist_category,
			int orderlist_search, String start_date, String end_date,int orderlist_paymentstatus, int startRow, int endRow);

	public int order_refund_modify(int orderlist_no, int payment_status);

	public int refundTotalCount(int orderlist_category, String start_date, String end_date, int orderlist_paystatus,
			int orderlist_search);

	public int order_calculate(int orderlist_no, int calculate_status);

}
