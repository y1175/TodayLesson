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

	public BannerDTO adminBannerDatail(int banner_no);

	public int bannerModify(BannerDTO dto);

	public int bannerModifyNOBanner(BannerDTO dto);
	
	public int bannerDelete(int banner_no);

}
