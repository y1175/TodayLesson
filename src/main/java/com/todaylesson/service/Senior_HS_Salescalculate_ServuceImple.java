package com.todaylesson.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO;
import com.todaylesson.DTO.SeniorDTO;
import com.todaylesson.Mapper.Senior_HS_Salescalculate_Mapper;

@Service(value="senior_HS_Salescalculate_Service")
public class Senior_HS_Salescalculate_ServuceImple implements Senior_HS_Salescalculate_Service {
	
	@Resource(name="senior_HS_Salescalculate_Mapper")
	private Senior_HS_Salescalculate_Mapper salescalculateMapper;

	//시니어 멤버아이디로 시니어번호 받아오기
	/*@Override
	public int get_Seniorno(String member_id) {
		// TODO Auto-generated method stub
		return salescalculateMapper.get_Seniorno(member_id);
	}*/
	
	//매출현황 토탈카운트
	@Override
	public int seniorSales_TotalCount(int senior_no, String search, String searchtxt) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm=new HashMap<String, Object>();
		hm.put("senior_no", senior_no);
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		return salescalculateMapper.seniorSales_TotalCount(hm);
	}
	
	//매출현황전체리스트
	@Override
	public List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> 
	       salesList(int senior_no, String start_date, String end_date, String search, String searchtxt, int startRow, int endRow) {  
		// TODO Auto-generated method stub
		HashMap<String, Object> hm=new HashMap<String, Object>();
		
		hm.put("senior_no", senior_no);
		hm.put("start_date", start_date);
		hm.put("end_date", end_date);
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		
		return salescalculateMapper.SalesList(hm);
	}
	       
	//정산신청 리스트 정산번호 / 정산상태 / 정산신청일 / 정산기간 / 정산계좌
	@Override
	public List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> calculateRequsetList(int senior_no) {
		// TODO Auto-generated method stub
		return salescalculateMapper.cal_RequestList(senior_no);
	}

	//정산신청 리스트 결제건수
	@Override
	public List<Integer> calPayCount(int senior_no) {
		// TODO Auto-generated method stub
		return salescalculateMapper.calPayCount(senior_no);
	}

	//정산신청 리스트 레스수익금액
	@Override
	public List<Integer> calRevenueCost(int senior_no) {
		// TODO Auto-generated method stub
		return salescalculateMapper.calRevenueCost(senior_no);
	}

	//정산신청 리스트 포인트사용
	@Override
	public List<Integer> calUsePointSum(int senior_no) {
		// TODO Auto-generated method stub
		return salescalculateMapper.calUsePointSum(senior_no);
	}

	//정산신청 시니어디테일
	@Override
	public SeniorDTO accountDetailDTO(String member_id) {
		// TODO Auto-generated method stub
		return salescalculateMapper.accountDetailDTO(member_id);
	}
	
	//정산신청 시니어계좌정보수정
	@Override
	public int accountUpdateDTO(SeniorDTO dto) {
		// TODO Auto-generated method stub
		return salescalculateMapper.accountUpdateDTO(dto);
	}

	//정산신청가능금액
	/*@Override
	public int calculate_PossibilityCost(String member_id) {
		// TODO Auto-generated method stub
		return salescalculateMapper.calculate_PossibilityCost(member_id);
	}*/

	//정산대기금액
	/*@Override
	public int calculate_WaitingCost(String member_id) {
		// TODO Auto-generated method stub
		return salescalculateMapper.calculate_WaitingCost(member_id);
	}*/
	
	//정산내역 목록 리스트
	@Override
	public List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> calStatementList(String member_id) {
		// TODO Auto-generated method stub
		return salescalculateMapper.calStatementList(member_id);
	}

	//정산내역 리스트 결제건수
	@Override
	public List<Integer> calStatementPayCount(String member_id) {
		// TODO Auto-generated method stub
		return salescalculateMapper.calStatementPayCount(member_id);
	}

	//정산내역 리스트 레스수익금액
	@Override
	public List<Integer> calStatementRevenueCost(String member_id) {
		// TODO Auto-generated method stub
		return salescalculateMapper.calStatementRevenueCost(member_id);
	}

	//정산내역 리스트 포인트사용
	@Override
	public List<Integer> calStatementUsePointSum(String member_id) {
		// TODO Auto-generated method stub
		return salescalculateMapper.calStatementUsePointSum(member_id);
	}



}
