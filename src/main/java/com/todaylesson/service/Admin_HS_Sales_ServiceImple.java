package com.todaylesson.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.Mapper.Admin_HS_Sales_Mapper;

@Service(value="admin_HS_Sales_Service")
public class Admin_HS_Sales_ServiceImple implements Admin_HS_Sales_Service {
	
	@Resource(name="admin_HS_Sales_Mapper")
	private Admin_HS_Sales_Mapper adminSalesMapper;
}

