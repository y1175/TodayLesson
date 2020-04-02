package com.todaylesson.Mapper;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.PopUpDTO;

@Mapper
public interface Admin_YI_Popup_Mapper {

	public PopUpDTO popup_info(int i);

	public int popup_submit(PopUpDTO dto);

}
