package com.todaylesson.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.BannerDTO;

@Mapper
public interface Admin_HS_Banner_Mapper {

	public int bannerTotalCount();

	public List<BannerDTO> adminBannerList(HashMap<String, Object> hm);

	public int bannerRegistration(BannerDTO dto);

}
