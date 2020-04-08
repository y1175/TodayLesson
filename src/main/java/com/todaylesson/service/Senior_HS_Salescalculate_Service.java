package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO;
import com.todaylesson.DTO.SeniorDTO;

public interface Senior_HS_Salescalculate_Service {

	//시니어 멤버아이디로 시니어번호 받아오기
	//public int get_Seniorno(String member_id);
	
	//매출현황 토탈카운트
	public int seniorSales_TotalCount(int senior_no, String search, String searchtxt);
	
	//매출현황전체리스트
	public List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> 
	       salesList(int senior_no, String start_date, String end_date, String search, String searchtxt, int startRow, int endRow);
	       
	//정산신청 리스트 정산번호 / 정산상태 / 정산신청일 / 정산기간 / 정산계좌
	public List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> calculateRequsetList(int senior_no);

	//정산신청 리스트 결제건수
	public List<Integer> calPayCount(int senior_no);

	//정산신청 리스트 레스수익금액
	public List<Integer> calRevenueCost(int senior_no);

	//정산신청 리스트 포인트사용
	public List<Integer> calUsePointSum(int senior_no);

	//정산신청 시니어디테일
	public SeniorDTO accountDetailDTO(String member_id);
	
	//정산신청 시니어계좌정보수정
	public int accountUpdateDTO(SeniorDTO dto);

	//정산신청가능금액
	//public int calculate_PossibilityCost(String member_id);

	//정산대기금액
	//public int calculate_WaitingCost(String member_id);

	//정산내역 목록 리스트
	public List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> calStatementList(String member_id);

	//정산내역 리스트 결제건수
	public List<Integer> calStatementPayCount(String member_id);

	//정산내역 리스트 레스수익금액
	public List<Integer> calStatementRevenueCost(String member_id);

	//정산내역 리스트 포인트사용
	public List<Integer> calStatementUsePointSum(String member_id);


}
