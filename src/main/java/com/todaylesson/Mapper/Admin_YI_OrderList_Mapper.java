package com.todaylesson.Mapper;

import java.util.HashMap;
import java.util.List;

import com.todaylesson.DTO.SQLjoin_OrderList_Order_detail_MemberDTO;

public interface Admin_YI_OrderList_Mapper {

public int getCount(HashMap<String, Object> hm);

public List<SQLjoin_OrderList_Order_detail_MemberDTO> orderlist(HashMap<String, Object> hm);

}
