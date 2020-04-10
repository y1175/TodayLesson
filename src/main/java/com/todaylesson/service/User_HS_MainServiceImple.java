package com.todaylesson.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.DTO.BannerDTO;
import com.todaylesson.DTO.ProductDTO;
import com.todaylesson.DTO.SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO;
import com.todaylesson.Mapper.User_HS_MainMapper;

@Service(value="user_HS_MainService")
public class User_HS_MainServiceImple implements User_HS_MainService {

	@Resource(name="user_HS_MainMapper")
	private User_HS_MainMapper usermainMapper;

	//신규레슨목록
	@Override
	public List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> newLessonList() {
		// TODO Auto-generated method stub
		return usermainMapper.newLessonList();
	}

	//신규스토어목록
	@Override
	public List<ProductDTO> StoreNewProductList() {
		// TODO Auto-generated method stub
		return usermainMapper.StoreNewProductList();
	}
	
	//이벤트슬라이더(BannerSlider)
	@Override
	public List<BannerDTO> mainEventBannerSlider() {
		// TODO Auto-generated method stub
		return usermainMapper.mainEventBannerSlider();
	}

	@Override
	public List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> BestLessonList() {
		// TODO Auto-generated method stub
		return usermainMapper.BestLessonList();
	}

	@Override
	public List<ProductDTO> StoreBestProductList() {
		// TODO Auto-generated method stub
		return usermainMapper.StoreBestProductList();
	}

	@Override
	public List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> referenceLessonList() {
		// TODO Auto-generated method stub
		return usermainMapper.referenceLessonList();
	}

	@Override
	public BannerDTO mainIMGBannerSlider() {
		// TODO Auto-generated method stub
		return usermainMapper.mainIMGBannerSlider();
	}

	@Override
	public List<BannerDTO> mainBannerSlider() {
		// TODO Auto-generated method stub
		return usermainMapper.mainBannerSlider();
	}

	
}
