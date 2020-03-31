package com.todaylesson.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.Mapper.Admin_HS_MainMapper;

@Service(value="admin_HS_MainService")
public class Admin_HS_MainServiceImple implements Admin_HS_MainService {

	@Resource(name="admin_HS_MainMapper")
	private Admin_HS_MainMapper adminmainMapper;
	
	//일일가입자수 집계
	@Override
	public int memberJoinCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.memberJoinCount();
	}
		
	//일일 시니어전환자 집계
	@Override
	public int seniorChangeCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.seniorChangeCount();
	}
	
	//일일게시글수 집계
	@Override
	public int freeboardWriteCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.freeboardWriteCount();
	}

	//일일 판매금액 집계
	@Override
	public int orderlistCostSum() {
		// TODO Auto-generated method stub
		return adminmainMapper.orderlistCostSum();
	}

	

	//레슨카테고리
	@Override
	public int lessonITCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.lessonITCount();
	}

	@Override
	public int lessonCookCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.lessonCookCount();
	}

	@Override
	public int lessonHandmadeCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.lessonHandmadeCount();
	}

	@Override
	public int lessonSportCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.lessonSportCount();
	}

	@Override
	public int lessonEducationCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.lessonEducationCount();
	}

	@Override
	public int lessonOtherCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.lessonOtherCount();
	}

	//상품카테고리
	@Override
	public int productITCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.productITCount();
	}

	@Override
	public int productCookCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.productCookCount();
	}

	@Override
	public int productHandmadeCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.productHandmadeCount();
	}

	@Override
	public int productSportCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.productSportCount();
	}

	@Override
	public int productEducationCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.productEducationCount();
	}

	@Override
	public int productOtherCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.productOtherCount();
	}

	//연령대별 회원현황
	@Override
	public int memberAge10Sum() {
		// TODO Auto-generated method stub
		return adminmainMapper.memberAge10Sum();
	}

	@Override
	public int memberAge20Sum() {
		// TODO Auto-generated method stub
		return adminmainMapper.memberAge20Sum();
	}

	@Override
	public int memberAge30Sum() {
		// TODO Auto-generated method stub
		return adminmainMapper.memberAge30Sum();
	}

	@Override
	public int memberAge40Sum() {
		// TODO Auto-generated method stub
		return adminmainMapper.memberAge40Sum();
	}

	@Override
	public int memberAge50Sum() {
		// TODO Auto-generated method stub
		return adminmainMapper.memberAge50Sum();
	}

	@Override
	public int memberAge60Sum() {
		// TODO Auto-generated method stub
		return adminmainMapper.memberAge60Sum();
	}

	@Override
	public int memberAge70PlusSum() {
		// TODO Auto-generated method stub
		return adminmainMapper.memberAge70PlusSum();
	}



	
}
