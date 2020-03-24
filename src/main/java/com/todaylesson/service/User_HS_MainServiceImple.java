package com.todaylesson.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.DTO.ProductDTO;
import com.todaylesson.DTO.SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_Sales_CalculateDTO;
import com.todaylesson.Mapper.User_HS_MainMapper;

@Service(value="user_HS_MainService")
public class User_HS_MainServiceImple implements User_HS_MainService {

	@Resource(name="user_HS_MainMapper")
	private User_HS_MainMapper usermainMapper;

	@Override
	public List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_Sales_CalculateDTO> newLessonList() {
		// TODO Auto-generated method stub
		return usermainMapper.newLessonList();
	}

	@Override
	public List<ProductDTO> StoreNewProductList() {
		// TODO Auto-generated method stub
		return usermainMapper.StoreNewProductList();
	}
}
