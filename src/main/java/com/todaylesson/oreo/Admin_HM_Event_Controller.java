package com.todaylesson.oreo;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.todaylesson.DTO.EventDTO;
import com.todaylesson.DTO.PageMaker;
import com.todaylesson.service.Admin_HM_EventService;
import com.todaylesson.upload.UploadFileUtils;

@Controller
@RequestMapping("/todaylessonadmin/")
public class Admin_HM_Event_Controller {

	
	@Resource(name="admin_hm_eventservice")
	private Admin_HM_EventService service;
	
	@RequestMapping("/hm_ad_event_manage")   
	private String eventmanagelist(
			@RequestParam(required=false, defaultValue="") String search
			,@RequestParam(required=false, defaultValue="") String searchtxt
			,@RequestParam(required=false, defaultValue="1") int currPage
			,Model model)
	{
		
		int totalCount= service.totalCount(search, searchtxt);
		int pageSize=15;
		int blockSize=5;
		

		PageMaker page = new PageMaker(currPage, totalCount, pageSize, blockSize);
		
		
		
		List<EventDTO> list = service.eventlist(search,searchtxt,page.getStartRow()
				,page.getEndRow());
		model.addAttribute("list",list);
		model.addAttribute("page",page);
		model.addAttribute("search",search);
		model.addAttribute("searchtxt",searchtxt);
		
		return "TodayLesson_AdminPage/hm_ad_event_manage.hs_ad_main_section";
	}
	
	
	@RequestMapping("/hm_ad_event_insert")          
	private String eventinsert()
	{
		
		return "TodayLesson_AdminPage/hm_ad_event_insert.hs_ad_main_section";
	}
	

		
		
	@RequestMapping("/hm_ad_event_insertresult")
	   public String insertresult(Model model, EventDTO dto, MultipartFile file,HttpServletRequest request) throws IOException, Exception {
	      

		String uploadPath=request.getSession().getServletContext().getRealPath("/"); 
		//system.out.println("uploadPath:"+uploadPath);
		String imgUploadPath = uploadPath + File.separator+ "resources"+ File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null)   
		{
		 fileName=UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		dto.setEvent_thumbnail(File.separator+ "resources"+File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
	      String imgthumb=dto.getEvent_thumbnail();
	      //system.out.println("썸네일이미지경로: "+imgthumb);
	      int result = service.eventinsert(dto);
	      model.addAttribute("result", result);
	      
	      return "TodayLesson_AdminPage/hm_ad_event_insertresult";
	      
	   }

	@RequestMapping("/hm_ad_event_detail/{no}")
	public String eventdetail(@PathVariable int no, Model model) {
		
		int event_no = no;
		EventDTO dto = service.eventdetail(event_no);
		model.addAttribute("dto",dto);
		return "TodayLesson_AdminPage/hm_ad_event_detail.hs_ad_main_section";
	}
	
	@RequestMapping("/hm_ad_event_update/{no}")
	public String eventupdate(@PathVariable int no,Model model)
	{
		int event_no = no;
		EventDTO dto = service.eventdetail(event_no);
		model.addAttribute("dto",dto);
		return "TodayLesson_AdminPage/hm_ad_event_update.hs_ad_main_section";
		
	}
	
	@RequestMapping("/hm_ad_event_modify")
	public String eventmodify(Model model, EventDTO dto, MultipartFile file,HttpServletRequest request) throws IOException, Exception {
		

		String uploadPath=request.getSession().getServletContext().getRealPath("/"); 
		//system.out.println("uploadPath:"+uploadPath);
		String imgUploadPath = uploadPath + File.separator+ "resources"+ File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "")   
		{
		 fileName=UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		 dto.setEvent_thumbnail(File.separator+ "resources"+File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
	      String imgthumb=dto.getEvent_thumbnail();
	      int result = service.eventupdate(dto);
	      model.addAttribute("result", result);
	      return "TodayLesson_AdminPage/hm_ad_event_updateresult";	      
	      
		 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		 //system.out.println("썸네일 경로가 안들어와야 정상"+fileName);
		 int result = service.eventupdatenothumbnail(dto);
		  model.addAttribute("result", result);
		  return "TodayLesson_AdminPage/hm_ad_event_updateresult";	      
	      
		}
	}
	
	
	
	
	
	@RequestMapping("/hm_ad_event_delete/{no}")
	public String eventdelete(@PathVariable int no, Model model) {
		
		int event_no = no;
		int result = service.delete(event_no);
		model.addAttribute("result",result);
		
		return "TodayLesson_AdminPage/hm_ad_event_deleteresult";
	}
	
}
