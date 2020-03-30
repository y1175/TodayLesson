package com.todaylesson.oreo;

import java.io.File;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.LessonDetailDTO;
import com.todaylesson.service.JY_SN_Approve_LessonService;
import com.todaylesson.upload.UploadFileUtils;

@Controller
//@RequestMapping("/todaylessonsenior/")
public class JY_SN_Approve_Lesson_Controller {

	@Autowired
	private JY_SN_Approve_LessonService approve_service;
	
	@RequestMapping("my_approve_lesson/{member_id}")
	public String approve_list(@PathVariable String member_id,Model model) {
		
		List<LessonDTO> list = approve_service.apl_list(member_id);
		
		model.addAttribute("list",list);
		
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
	
	
	
	@RequestMapping("facebook_login")
	public String facebook_login() {	
		
		return "facebook_login";
	}
	
	
	
	
}
