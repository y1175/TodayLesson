package com.todaylesson.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.Mapper.Admin_HS_MainMapper;

@Service(value="admin_HS_MainService")
public class Admin_HS_MainServiceImple implements Admin_HS_MainService {

	@Resource(name="admin_HS_MainMapper")
	private Admin_HS_MainMapper adminmainMapper;

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
	public int lessonLanguageCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.lessonLanguageCount();
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
	public int productLanguageCount() {
		// TODO Auto-generated method stub
		return adminmainMapper.productLanguageCount();
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
	
}
