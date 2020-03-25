package com.todaylesson.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.SQLjoin_OrderList_Order_detail_MemberDTO;

@Mapper
public interface User_YI_OrderList_Mapper {

	public int getCount(HashMap<String, Object> hm);

	public List<SQLjoin_OrderList_Order_detail_MemberDTO> list(HashMap<String, Object> hm);

	public List<SQLjoin_OrderList_Order_detail_MemberDTO> detailList();

	public SQLjoin_OrderList_Order_detail_MemberDTO orderinfo(int orderlist_no);

	public List<SQLjoin_OrderList_Order_detail_MemberDTO> orderinfo_detail(
			int orderlist_no);

	public int orderlist_cancel(int orderlist_no);

}
