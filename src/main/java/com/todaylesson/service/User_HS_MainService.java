package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.ProductDTO;
import com.todaylesson.DTO.SQLjoin_Member_Senior_Lesson_OrderList_Sales_CalculateDTO;

public interface User_HS_MainService {
	
	//신규레슨목록
	public List<SQLjoin_Member_Senior_Lesson_OrderList_Sales_CalculateDTO> newLessonList();

	public List<ProductDTO> StoreNewProductList();

}
