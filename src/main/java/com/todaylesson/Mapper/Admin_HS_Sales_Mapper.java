package com.todaylesson.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO;

@Mapper
public interface Admin_HS_Sales_Mapper {

	List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> adminSeniorSalesList(
			HashMap<String, Object> hm);

}
