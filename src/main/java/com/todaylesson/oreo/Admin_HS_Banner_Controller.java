package com.todaylesson.oreo;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.todaylesson.DTO.BannerDTO;
import com.todaylesson.DTO.EventDTO;
import com.todaylesson.DTO.PageMaker;
import com.todaylesson.service.Admin_HS_Banner_Service;
import com.todaylesson.upload.UploadFileUtils;

@Controller
@RequestMapping("/todaylessonadmin/")
public class Admin_HS_Banner_Controller {

	@Resource(name="admin_HS_Banner_Service")
	private Admin_HS_Banner_Service adminBannerService;
	
	@RequestMapping("/admin_banner_list")
	public String bannerList(@RequestParam(required=false, defaultValue="") String search
			                ,@RequestParam(required=false, defaultValue="") String searchtxt
			                ,@RequestParam(required=false, defaultValue="1") int currPage
			                ,Model model) {
		
		int totalCount= adminBannerService.bannerTotalCount(search, searchtxt);
		int pageSize=5;
		int blockSize=5;
		
		PageMaker page = new PageMaker(currPage, totalCount, pageSize, blockSize);
		
		List<BannerDTO> adminBannerList=adminBannerService.adminBannerList(search, searchtxt, page.getStartRow(), page.getEndRow());
		
		model.addAttribute("adminBannerList", adminBannerList);
		model.addAttribute("page",page);
		model.addAttribute("search",search);
		model.addAttribute("searchtxt",searchtxt);
		
		return "TodayLesson_AdminPage/hs_ad_bannerlist.hs_ad_main_section";
	}
	
	@RequestMapping("/admin_banner_registration")
	public String bannerRegistration() {
		return "TodayLesson_AdminPage/hs_ad_banner_registration.hs_ad_main_section";
	}
	
	@RequestMapping("/admin_banner_registrationresult")
	public String bannerRegistrationResule(Model model, BannerDTO dto 
			                             , MultipartFile file,HttpServletRequest request) throws IOException, Exception {

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
		
		dto.setBanner_filepath(File.separator+ "resources"+File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		String imgthumb=dto.getBanner_filepath();
		 System.out.println("썸네일이미지경로: "+imgthumb);
	     int bannerRegistrationResult = adminBannerService.bannerRegistrationResult(dto);
	     model.addAttribute("bannerRegistrationResult", bannerRegistrationResult);
		
		
		return "TodayLesson_AdminPage/hs_ad_banner_registrationresult.hs_ad_main_section";
	}


}
