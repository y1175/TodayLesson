package com.todaylesson.service;

import com.todaylesson.DTO.PopUpDTO;

public interface Admin_YI_Popup_Service {

	public PopUpDTO popupinfo(int i);

	public int popup_submit(PopUpDTO dto);

	public int popup_reset(int popup_no);

}
