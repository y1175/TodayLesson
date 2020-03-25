package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_Sales_CalculateDTO;
import com.todaylesson.DTO.SeniorDTO;

public interface Senior_HS_Salescalculate_Service {
	
	//매출현황전체리스트
	public List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_Sales_CalculateDTO> 
	       salesList(String member_id, String sales_search_startdate, String sales_search_enddate, String search, String searchtxt);

	//정산신청 리스트 정산번호 / 정산상태 / 정산신청일 / 정산기간 / 정산계좌
	public List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_Sales_CalculateDTO> calculateRequsetList(String member_id);

	//정산신청 리스트 결제건수
	public List<Integer> calPayCount(String member_id);

	//정산신청 리스트 레스수익금액
	public List<Integer> calRevenueCost(String member_id);

	//정산신청 리스트 포인트사용
	public List<Integer> calUsePointSum(String member_id);

	//정산신청 시니어디테일
	public SeniorDTO accountDetailDTO(String member_id);
	
	//정산신청 시니어계좌정보수정
	public int accountUpdateDTO(SeniorDTO dto);

	//정산신청가능금액
	//public int calculate_PossibilityCost(String member_id);

	//정산대기금액
	//public int calculate_WaitingCost(String member_id);

	
	//정산신청 리스트 레스취소금액
	//public List<Integer> calCancelCost(int senior_no);

	//정산신청 리스트 포인트취소
	//public List<Integer> calCancelPointSum(int senior_no);
}
