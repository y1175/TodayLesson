package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.BannerDTO;
import com.todaylesson.DTO.LessonDTO;

public interface User_HM_Bird_Service {

	public List<LessonDTO> bestlesson();

	public List<LessonDTO> newbirdlesson();

	public List<LessonDTO> endbirdlesson();

	public BannerDTO mainbanner();

	public BannerDTO minibanner();

	

}
