package com.todaylesson.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.DTO.OrderListDTO;
import com.todaylesson.DTO.SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO;
import com.todaylesson.Mapper.Admin_HS_Calculate_Mapper;
import com.todaylesson.DTO.CalculateDTO;;

@Service(value="admin_HS_Calculate_Service")
public class Admin_HS_Calculate_ServiceImple implements Admin_HS_Calculate_Service {

	@Resource(name="admin_HS_Calculate_Mapper")
	private Admin_HS_Calculate_Mapper adminCalculateMapper;

	//정산신청 리스트 정산번호 / 정산상태 / 정산신청일 / 정산기간
	@Override
	public List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> calculateRequsetList() {
		// TODO Auto-generated method stub
		return adminCalculateMapper.calculateRequsetList();
	}
	//정산신청 리스트 레스수익금액
	@Override
	public List<Integer> calRevenueCost() {
		// TODO Auto-generated method stub
		return adminCalculateMapper.calRevenueCost();
	}
	
	//정산신청 리스트 포인트사용
	@Override
	public List<Integer> calUsePointSum() {
		// TODO Auto-generated method stub
		return adminCalculateMapper.calUsePointSum();
	}

	//정산신청 정산수수료 세금계산서 부가세
	@Override
	public List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> cal_CommSurtax() {
		// TODO Auto-generated method stub
		return adminCalculateMapper.cal_CommSurtax();
	}
	
	//시니어 지급계좌 및 신청정보
	@Override
	public List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> cal_SeniorInfo() {
		// TODO Auto-generated method stub
		return adminCalculateMapper.cal_SeniorInfo();
	}
	@Override
	public int admin_Calculate_Give(OrderListDTO dto) {
		// TODO Auto-generated method stub
		return adminCalculateMapper.admin_Calculate_Give(dto);
	}
}
