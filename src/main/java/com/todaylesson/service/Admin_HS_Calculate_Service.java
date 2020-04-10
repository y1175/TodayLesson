package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.OrderListDTO;
import com.todaylesson.DTO.SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO;
import com.todaylesson.DTO.CalculateDTO;

public interface Admin_HS_Calculate_Service {
	
	//정산신청 리스트 정산번호 / 정산상태 / 정산신청일 / 정산기간
	public List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> calculateRequsetList();
	
	//정산신청 리스트 레스수익금액
	public List<Integer> calRevenueCost();

	//정산신청 리스트 포인트사용
	public List<Integer> calUsePointSum();

	//정산신청 정산수수료 세금계산서 부가세
	public List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> cal_CommSurtax();

	//시니어 지급계좌 및 신청정보
	public List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> cal_SeniorInfo();

	public int admin_Calculate_Give(OrderListDTO dto);

	//SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO calculte_datail();

}
