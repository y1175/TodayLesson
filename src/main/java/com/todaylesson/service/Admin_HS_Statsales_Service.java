package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.OrderListDTO;

public interface Admin_HS_Statsales_Service {

	//매출통계(일별, 주별, 월별, 년별)
	public List<OrderListDTO> StatSalesAllChart(String ymd, String start_date, String end_date);

	//AmChart
	public List<OrderListDTO> chartOutput();

	//매출목록
	//public List<OrderListDTO> StatSalesList(String ymd, String start_date, String end_date);

}
