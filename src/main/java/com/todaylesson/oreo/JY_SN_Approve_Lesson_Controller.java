package com.todaylesson.oreo;

import java.io.File;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.LessonDetailDTO;
import com.todaylesson.DTO.PageMaker;
import com.todaylesson.service.JY_SN_Approve_LessonService;
import com.todaylesson.upload.UploadFileUtils;

@Controller
@RequestMapping("/todaylessonsenior/")
public class JY_SN_Approve_Lesson_Controller {

	@Autowired
	private JY_SN_Approve_LessonService approve_service;
	
	@RequestMapping("my_approve_lesson")
	public String approve_list(Model model,  Authentication authentication
			,@RequestParam(required=false, defaultValue="") String search
			,@RequestParam(required=false, defaultValue="") String searchtxt
			,@RequestParam(required=false, defaultValue="1") int currPage
			,@RequestParam(required=false, defaultValue="lesson_no") String order) {
	
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String member_id = userDetails.getUsername();

		int totalCount= approve_service.totalCount(search, searchtxt, member_id);
		int pageSize=15;
		int blockSize=5;
		
		PageMaker page=new PageMaker(currPage,totalCount,pageSize,blockSize);

		
		List<LessonDTO> list = approve_service.apl_list(member_id,search, searchtxt,order
				,page.getStartRow()
				,page.getEndRow());
		
		
		model.addAttribute("list",list);
		model.addAttribute("page",page);
		model.addAttribute("search",search);
		model.addAttribute("searchtxt",searchtxt);
		model.addAttribute("order",order);
		
		return"TodayLesson_SeniorPage/jy_sn_approve_list.sn_main_section";
	}
	
	
	@RequestMapping("approve_lesson_detail/{lesson_no}")
	public String approve_lesson_detail(@PathVariable int lesson_no, Model model) {
		
		LessonDTO dto = approve_service.apl_detail(lesson_no);
		
		List<LessonDetailDTO> list = approve_service.apld_list(lesson_no);
		
		model.addAttribute("dto",dto);
		model.addAttribute("list",list);
		
		
		return "TodayLesson_SeniorPage/jy_sn_approve_detail.sn_main_section";
	}
	
	@RequestMapping("my_approve_lesson_upload/{lesson_no}")
	public String approve_lesson_upload(@PathVariable int lesson_no, Model model) {	

		LessonDTO dto = approve_service.apl_detail(lesson_no);
		
		model.addAttribute("dto",dto);

		return "TodayLesson_SeniorPage/jy_sn_approve_lesson_upload.sn_main_section";
	}
	
	@RequestMapping("mal_lesson_upload_result")
	public String approve_lesson_upload(LessonDetailDTO dto, Model model, MultipartFile file, HttpServletRequest request, @RequestParam String rt) throws Exception{	
		
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
		
		//dto.set(File.separator+ "resources"+File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		dto.setLessondetail_thumb(File.separator+ "resources"+File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		String imgthumb = dto.getLessondetail_thumb();
		//System.out.println("이미지경로: "+img);
		System.out.println("썸네일이미지경로: "+imgthumb);
		
		int running_time = approve_service.apl_rt(rt);

		dto.setLessondetail_running_time(running_time);
		
		int result =approve_service.apl_upload(dto);
		
		
		model.addAttribute("result",result);
		
		System.out.println(dto.toString());
					
		int lesson_no = dto.getLesson_no();
	
		model.addAttribute("result",result);
		model.addAttribute("lesson_no",lesson_no);
		
		return "TodayLesson_SeniorPage/jy_sn_mal_lesson_upload_result";
		
	}
	
	@RequestMapping("select_lessondetail_chapter/{lessondetail_no}")
	public String select_apld_chapter(@PathVariable int lessondetail_no, Model model) {
		
		LessonDetailDTO dto = approve_service.apld_select(lessondetail_no);
		model.addAttribute("dto",dto);
		
		return "TodayLesson_SeniorPage/jy_sn_apld_select.sn_main_section";
	}
	
	
	@RequestMapping("update_lessondetail_chapter/{lessondetail_no}")
	public String update_apld_chapter(@PathVariable int lessondetail_no, Model model) {
		
		LessonDetailDTO dto = approve_service.apld_select(lessondetail_no);
		model.addAttribute("dto",dto);
		
		return "TodayLesson_SeniorPage/jy_sn_apld_update.sn_main_section";
	}
	
	@RequestMapping("mal_lesson_update_result")
	public String update_apld_chapter_result(LessonDetailDTO dto, Model model) {
		
		int result = approve_service.apld_update(dto);
		model.addAttribute("result",result);
		
		return "TodayLesson_SeniorPage/jy_sn_mal_lesson_update_result";
	}
	
	
	

	
	
	
	
}
