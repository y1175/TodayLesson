package com.todaylesson.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.SQLjoin_Member_Senior_Lesson_OrderList_Sales_CalculateDTO;

@Mapper
public interface Senior_HS_Salescalculate_Mapper {
	//매출현황전체리스트
	public List<SQLjoin_Member_Senior_Lesson_OrderList_Sales_CalculateDTO> SalesList(int senior_no, HashMap<String, Object> hm);

	//정산신청 리스트 정산번호 / 정산상태 / 정산신청일
	public List<SQLjoin_Member_Senior_Lesson_OrderList_Sales_CalculateDTO> cal_RequestList(int senior_no);

}
