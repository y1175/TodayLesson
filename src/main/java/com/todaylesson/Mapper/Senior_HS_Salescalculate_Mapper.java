package com.todaylesson.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_Sales_CalculateDTO;

@Mapper
public interface Senior_HS_Salescalculate_Mapper {
	//매출현황전체리스트
	public List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_Sales_CalculateDTO> SalesList(HashMap<String, Object> hm);

	//정산신청 리스트 정산번호 / 정산상태 / 정산신청일 / 정산기간 / 정산계좌
	public List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_Sales_CalculateDTO> cal_RequestList(int senior_no);

	//정산신청 리스트 결제건수
	public List<Integer> calPayCount(int senior_no);

	//정산신청 리스트 레스수익금액
	public List<Integer> calRevenueCost(int senior_no);

	//정산신청 리스트 포인트사용
	public List<Integer> calUsePointSum(int senior_no);

	//정산신청 리스트 레스취소금액
	//public List<Integer> calCancelCost(int senior_no);

	//정산신청 리스트 포인트취소
	//public List<Integer> calCancelPointSum(int senior_no);

}
