package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.BannerDTO;

public interface Admin_HS_Banner_Service {

	public int bannerTotalCount(String search, String searchtxt);
	
	public List<BannerDTO> adminBannerList(String search, String searchtxt, int startRow, int endRow);

	public int bannerRegistrationResult(BannerDTO dto);

	

}
