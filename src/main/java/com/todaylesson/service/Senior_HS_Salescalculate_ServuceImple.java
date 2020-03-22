package com.todaylesson.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.DTO.SQLjoin_Member_Senior_Lesson_OrderList_Sales_CalculateDTO;
import com.todaylesson.Mapper.Senior_HS_Salescalculate_Mapper;

@Service(value="senior_HS_Salescalculate_Service")
public class Senior_HS_Salescalculate_ServuceImple implements Senior_HS_Salescalculate_Service {
	
	@Resource(name="senior_HS_Salescalculate_Mapper")
	private Senior_HS_Salescalculate_Mapper salescalculateMapper;

	//매출현황전체리스트
	@Override
	public List<SQLjoin_Member_Senior_Lesson_OrderList_Sales_CalculateDTO> 
	       salesList(int senior_no, String search, String searchtxt) {  //String start_date, String end_date, 
		// TODO Auto-generated method stub
		HashMap<String, Object> hm=new HashMap<String, Object>();
		/*hm.put("senior_no", senior_no);*/
		//hm.put("start_date", start_date);
		//hm.put("end_date", end_date);
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		return salescalculateMapper.SalesList(senior_no,hm);
	}

	//정산신청 리스트 정산번호 / 정산상태 / 정산신청일
	@Override
	public List<SQLjoin_Member_Senior_Lesson_OrderList_Sales_CalculateDTO> calculateRequsetList(int senior_no) {
		// TODO Auto-generated method stub
		return salescalculateMapper.cal_RequestList(senior_no);
	}

}
