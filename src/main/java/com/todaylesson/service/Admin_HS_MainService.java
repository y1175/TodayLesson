package com.todaylesson.service;

public interface Admin_HS_MainService {

	//일일게시글수 집계
	public int freeboardWriteCount();

	//일일 판매금액 집계
	public int orderlistCostSum();

	//일일가입자수 집계
	public int memberJoinCount();
	
	//레슨카테고리
	public int lessonITCount();

	public int lessonCookCount();

	public int lessonHandmadeCount();

	public int lessonSportCount();

	public int lessonEducationCount();

	public int lessonOtherCount();

	//상품카테고리
	public int productITCount();

	public int productCookCount();

	public int productHandmadeCount();

	public int productSportCount();

	public int productEducationCount();

	public int productOtherCount();

	//연령대별 회원현황
	public int memberAge10Sum();

	public int memberAge20Sum();

	public int memberAge30Sum();

	public int memberAge40Sum();

	public int memberAge50Sum();

	public int memberAge60Sum();

	public int memberAge70PlusSum();

}
