package com.todaylesson.Mapper;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.DTO.SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO;

@Mapper
public interface User_HS_MyPageMapper {

	public MemberDTO myPageMyLevel_MyPoint(String member_id);

	public SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO myPageAttendLseeon(String member_id);

}
