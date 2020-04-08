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
	
	//매출현황전체리스트
	@Override
	public List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> 
	       salesList(String member_id, String sales_search_startdate, String sales_search_enddate, String search, String searchtxt) {  //String start_date, String end_date, 
		// TODO Auto-generated method stub
		HashMap<String, Object> hm=new HashMap<String, Object>();
		
		hm.put("member_id", member_id);
		hm.put("sales_search_startdate", sales_search_startdate);
		hm.put("sales_search_enddate", sales_search_enddate);
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		
		return salescalculateMapper.SalesList(hm);
	}
	       
	//정산신청 리스트 정산번호 / 정산상태 / 정산신청일 / 정산기간 / 정산계좌
	@Override
	public List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> calculateRequsetList(String member_id) {
		// TODO Auto-generated method stub
		return salescalculateMapper.cal_RequestList(member_id);
	}

	//정산신청 리스트 결제건수
	@Override
	public List<Integer> calPayCount(String member_id) {
		// TODO Auto-generated method stub
		return salescalculateMapper.calPayCount(member_id);
	}

	//정산신청 리스트 레스수익금액
	@Override
	public List<Integer> calRevenueCost(String member_id) {
		// TODO Auto-generated method stub
		return salescalculateMapper.calRevenueCost(member_id);
	}

	//정산신청 리스트 포인트사용
	@Override
	public List<Integer> calUsePointSum(String member_id) {
		// TODO Auto-generated method stub
		return salescalculateMapper.calUsePointSum(member_id);
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
