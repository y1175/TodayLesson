package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_Sales_CalculateDTO;

public interface Admin_HS_Sales_Service {

	List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_Sales_CalculateDTO> adminSeniorSalesList(String search,
			String searchtxt, String start_date, String end_date);

}
