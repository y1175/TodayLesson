package com.todaylesson.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.Mapper.User_YI_OrderList_Mapper;

@Service(value="user_YI_OrderList_Service")
public class User_YI_OrderList_ServiceImple implements User_YI_OrderList_Service{


	@Resource(name="user_YI_OrderList_Mapper")
	private User_YI_OrderList_Mapper mapper;
}
