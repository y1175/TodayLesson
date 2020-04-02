package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.BannerDTO;
import com.todaylesson.DTO.ProductDTO;
import com.todaylesson.DTO.SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_Sales_CalculateDTO;

public interface User_HS_MainService {
	
	//신규레슨목록
	public List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_Sales_CalculateDTO> newLessonList();

	//신규스토어목록
	public List<ProductDTO> StoreNewProductList();
	
	//이벤트슬라이더(BannerSlider)
	public List<BannerDTO> mainEventBannerSlider();

	

}
