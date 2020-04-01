package com.todaylesson.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.DTO.BannerDTO;
import com.todaylesson.Mapper.Admin_HS_Banner_Mapper;

@Service(value="admin_HS_Banner_Service")
public class Admin_HS_Banner_ServiceImple implements Admin_HS_Banner_Service {

	@Resource(name="admin_HS_Banner_Mapper")
	private Admin_HS_Banner_Mapper adminBannerMapper;

	@Override
	public int bannerTotalCount(String search, String searchtxt) {
		// TODO Auto-generated method stub
		return adminBannerMapper.bannerTotalCount();
	}

	@Override
	public List<BannerDTO> adminBannerList(String search, String searchtxt, int startRow, int endRow) {
		// TODO Auto-generated method stub
		HashMap<String, Object>hm = new HashMap<String,Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("startrow", startRow);
		hm.put("endrow", endRow);
		
		return adminBannerMapper.adminBannerList(hm);
	}

	@Override
	public int bannerRegistrationResult(BannerDTO dto) {
		// TODO Auto-generated method stub
		return adminBannerMapper.bannerRegistration(dto);
	}
}
