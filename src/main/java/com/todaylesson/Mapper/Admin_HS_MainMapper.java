package com.todaylesson.Mapper;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface Admin_HS_MainMapper {

	//레슨카테고리
	public int lessonITCount();

	public int lessonCookCount();

	public int lessonHandmadeCount();

	public int lessonLanguageCount();

	public int lessonEducationCount();

	public int lessonOtherCount();

	//상품카테고리
	public int productITCount();

	public int productCookCount();

	public int productHandmadeCount();

	public int productLanguageCount();

	public int productEducationCount();

	public int productOtherCount();

}
