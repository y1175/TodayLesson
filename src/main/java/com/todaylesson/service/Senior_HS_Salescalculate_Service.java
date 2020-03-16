package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.SQLjoin_Member_Senior_Lesson_OrderList_Sales_CalculateDTO;

public interface Senior_HS_Salescalculate_Service {
	
	//매출현황전체리스트
	public List<SQLjoin_Member_Senior_Lesson_OrderList_Sales_CalculateDTO> 
	       salesList(int senior_no, String start_date, String end_date, String search, String searchtxt);

	//정산신청 리스트 정산번호 / 정산상태 / 정산신청일
	public List<SQLjoin_Member_Senior_Lesson_OrderList_Sales_CalculateDTO> calculateRequsetList(int senior_no);

}
