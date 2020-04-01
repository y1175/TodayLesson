package com.todaylesson.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.SQLjoin_OrderList_Order_detail_MemberDTO;

@Mapper
public interface Admin_YI_OrderList_Mapper {

public int getCount(HashMap<String, Object> hm);

public List<SQLjoin_OrderList_Order_detail_MemberDTO> orderlist(HashMap<String, Object> hm);

public int order_modify(HashMap<String,Object> hm);

public List<SQLjoin_OrderList_Order_detail_MemberDTO> refundlist(HashMap<String, Object> hm);

public int order_refund_modify(HashMap<String, Object> hm);

}
