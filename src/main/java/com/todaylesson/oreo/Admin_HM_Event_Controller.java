package com.todaylesson.oreo;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.todaylesson.DTO.EventDTO;
import com.todaylesson.service.Admin_HM_EventService;
import com.todaylesson.upload.UploadFileUtils;

@Controller
@RequestMapping("/todaylessonadmin/")
public class Admin_HM_Event_Controller {

	
	@Resource(name="admin_hm_eventservice")
	private Admin_HM_EventService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping("/hm_ad_event_manage")
	private String eventmanagelist()
	{
		
		return "TodayLesson_AdminPage/hm_ad_event_manage.hs_ad_main_section";
	}
	
	
	@RequestMapping("/hm_ad_event_insert")          
	private String eventinsert()
	{
		
		return "TodayLesson_AdminPage/hm_ad_event_insert.hs_ad_main_section";
	}
	
	@RequestMapping("/hm_ad_event_insertresult")
	public String insertresult(Model model, EventDTO dto, MultipartFile file) throws IOException, Exception {
		

		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) 
		{
		 fileName=UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

	/*	dto.setProduct_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);*/
		dto.setEvent_thumbnail(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
	/*	String img=dto.getProduct_img();*/
		String imgthumb=dto.getEvent_thumbnail();
		System.out.println("썸네일이미지경로: "+imgthumb);
/*		int cost=dto.getProduct_cost()*(100-dto.getProduct_sale())/100;
		dto.setProduct_after_cost(cost);*/
		int result = service.eventinsert(dto);
		model.addAttribute("result", result);
		
		return "TodayLesson_AdminPage/hm_ad_event_insertresult";
		
	}
	
	
	
}
