package com.todaylesson.oreo;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.todaylesson.DTO.PopUpDTO;
import com.todaylesson.service.Admin_YI_Popup_Service;
import com.todaylesson.upload.UploadFileUtils;

@Controller
@RequestMapping("/todaylessonadmin")
public class Admin_YI_Popup_Controller {

 @Resource(name="admin_YI_Popup_Service")
 private Admin_YI_Popup_Service service;
	
 	@RequestMapping("/popup_admin")
 	public String popup_main(Model model)
 	{
 		PopUpDTO dto1=service.popupinfo(1);
 		PopUpDTO dto2=service.popupinfo(2);
 		PopUpDTO dto3=service.popupinfo(3);
 		
 		if(dto1.getPopup_title().equals(""))
 		{
 			dto1.setPopup_title("������ �Է��ϼ���");
 		}
 		if(dto2.getPopup_title().equals(""))
 		{
 			dto2.setPopup_title("������ �Է��ϼ���");
 		}
 		if(dto3.getPopup_title().equals(""))
 		{
 			dto3.setPopup_title("������ �Է��ϼ���");
 		}
 		
 		if(dto1.getPopup_url().equals(""))
 		{
 			dto1.setPopup_url("������ �Է��ϼ���");
 		}
 		if(dto2.getPopup_url().equals(""))
 		{
 			dto2.setPopup_url("������ �Է��ϼ���");
 		}
 		if(dto3.getPopup_url().equals(""))
 		{
 			dto3.setPopup_url("������ �Է��ϼ���");
 		}
 		
 		
 		
 		
 		model.addAttribute("dto1",dto1);
 		model.addAttribute("dto3",dto2);
 		model.addAttribute("dto2",dto3);
 		
 		
 		return "/TodayLesson_AdminPage/yi_ad_popup_main";
 	}
 	
 	@RequestMapping("/popup_adminresult/{popup_no}")
 	public String popup_adminresult(@PathVariable int popup_no
 			,@RequestParam String popup_title
 			,@RequestParam String popup_url
 			,@RequestParam int popup_use
 			,MultipartFile file,HttpServletRequest request
 			,Model model) throws IOException, Exception
 	{
 		PopUpDTO dto=new PopUpDTO();
 		dto.setPopup_no(popup_no);
 		dto.setPopup_title(popup_title);
 		dto.setPopup_url(popup_url);
 		dto.setPopup_use(popup_use);
 		
 		String uploadPath=request.getSession().getServletContext().getRealPath("/"); 
		System.out.println("uploadPath:"+uploadPath);
		String imgUploadPath = uploadPath + File.separator+ "resources"+ File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null)   
		{
		 fileName=UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		dto.setPopup_filepath(File.separator+ "resources"+File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
	      String imgthumb=dto.getPopup_filepath();
	      System.out.println("������̹������: "+imgthumb);
 		
 		
 		
 		int result=service.popup_submit(dto);
 		model.addAttribute("result",result);
 		return "/TodayLesson_AdminPage/yi_ad_popup_adminresult";
 	}
 
}