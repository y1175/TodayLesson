package com.todaylesson.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.DTO.PopUpDTO;
import com.todaylesson.Mapper.Admin_YI_Popup_Mapper;

@Service(value="admin_YI_Popup_Service")
public class Admin_YI_Popup_ServiceImple implements Admin_YI_Popup_Service{

	@Resource(name="admin_YI_Popup_Mapper")
	private Admin_YI_Popup_Mapper mapper;

	@Override
	public PopUpDTO popupinfo(int i) {
		// TODO Auto-generated method stub
		return mapper.popup_info(i);
	}

	@Override
	public int popup_submit(PopUpDTO dto) {
		// TODO Auto-generated method stub
		return mapper.popup_submit(dto);
	}

	@Override
	public int popup_reset(int popup_no) {
		// TODO Auto-generated method stub
		return mapper.popup_reset(popup_no);
	}
	
}
