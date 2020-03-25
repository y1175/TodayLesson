package com.todaylesson.oreo;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.SeniorDTO;
import com.todaylesson.service.JY_SN_LessonService;
import com.todaylesson.upload.UploadFileUtils;


@Controller
/*@RequestMapping("/todaylessonsenior/")*/
public class JY_SN_Lesson_Controller {

	
	@Resource(name="lessonservice")
	private JY_SN_LessonService lesson_service;
	
	   

	@RequestMapping("/lesson_list/{member_id}")
	public String list(Model model,@PathVariable String member_id){
		int senior_no = lesson_service.select_senior_no(member_id);
		SeniorDTO dto = lesson_service.select_senior_info(senior_no);
		
		if (dto.getSenior_nick() == null) {
			
			return "TodayLesson_SeniorPage/jy_sn_senior_info_null";

		} else {
		
		List<LessonDTO> list = lesson_service.list(senior_no);
		model.addAttribute("list",list);
	
		return "TodayLesson_SeniorPage/jy_sn_lesson_list.sn_main_section";
		}
	}
	
	
	
	@RequestMapping("/lesson_write/{member_id}")
	public String write(@PathVariable String member_id,Model model) {
		int senior_no = lesson_service.select_senior_no(member_id);
		List<LessonDTO> list = lesson_service.reject_lesson_list(senior_no);
		
		if (list.size() > 5) {
			return "TodayLesson_SeniorPage/jy_sn_you_cant_write_lesson";
		} else {
			model.addAttribute("senior_no",senior_no);
			return "TodayLesson_SeniorPage/jy_sn_lesson_write.sn_main_section";
		}
	}
	
	@RequestMapping("/jusoPopup")
	public String jusoPopup() {
		return "TodayLesson_SeniorPage/jy_sn_jusoPopup";
	}	
	

	
	@RequestMapping("multiple_time_lesson_date")
	public String multiple_lesson() {
		return "TodayLesson_SeniorPage/jy_sn_multiple_lesson";
	}	
	

	
	
	@RequestMapping("/insert_result")
	public String insertresult(LessonDTO dto, Model model,MultipartFile file, HttpServletRequest request) throws Exception {
		
		if (dto.getLesson_type() != 3) {
			String[] l_date = request.getParameterValues("lesson_date");
			String[] l_time = request.getParameterValues("lesson_time");

			StringBuilder l_d_t = new StringBuilder();
			
			for (int i = 0; i < l_time.length; i++) {		
				if (i == l_time.length - 1) {
					l_d_t.append(" "+l_date[i] + " " + l_time[i]);
				} else if (i == 0){
					l_d_t.append(l_date[i] + " " + l_time[i]+ ", ");
				} else {
					l_d_t.append(" " + l_date[i] + " " + l_time[i]+ ",");
				}
			}
			dto.setLesson_date_time(l_d_t.toString());
			System.out.println(dto.getLesson_date_time());
		}
	
		
		//String lessondatetime = Arrays.toString(l_date_time);
		
		//String date_time = lessondatetime.replace("[", "");
		//String lesson_date_time = date_time.replace("]", "");
		
		
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
		dto.setLesson_thumb(File.separator+ "resources"+File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		String imgthumb = dto.getLesson_thumb();
		//System.out.println("이미지경로: "+img);
		System.out.println("썸네일이미지경로: "+imgthumb);
		
		

		int result =lesson_service.insert_Lesson(dto);
		model.addAttribute("result",result);
		
		System.out.println(dto.toString());
					
		return "TodayLesson_SeniorPage/jy_sn_insert_result";
		
	}
	
	@RequestMapping("/my_lesson_detail/{lesson_no}")
	public String lesson_detail(@PathVariable int lesson_no, Model model) {
		LessonDTO dto = lesson_service.detail_lesson(lesson_no);
		model.addAttribute("dto",dto);
		return "TodayLesson_SeniorPage/jy_sn_lesson_detail.sn_main_section";
	}
	
	@RequestMapping("/lesson_update/{lesson_no}")
	public String lesson_update(@PathVariable int lesson_no, Model model) {
		LessonDTO dto = lesson_service.detail_lesson(lesson_no);
		if (dto.getLesson_result() != 0) {
			return "TodayLesson_SeniorPage/jy_sn_lesson_can_not_update";
		} else {
			model.addAttribute("dto",dto);
			return "TodayLesson_SeniorPage/jy_sn_lesson_update.sn_main_section";
		} 
	}
	
	@RequestMapping("/lesson_delete/{lesson_no}")
	public String lesson_delete(@PathVariable int lesson_no, Model model) {
		LessonDTO dto = lesson_service.detail_lesson(lesson_no);
		if (dto.getLesson_result() != 0) {
			return "TodayLesson_SeniorPage/jy_sn_lesson_can_not_delete";
		} else {
			int result = lesson_service.delete_lesson(lesson_no);
			model.addAttribute("result",result);
			return "TodayLesson_SeniorPage/jy_sn_delete_result";
		} 
	}
	
	
	
	@RequestMapping("/lesson_update_result")
	public String lesson_update_result (LessonDTO dto, Model model,MultipartFile file,HttpServletRequest request) throws IOException, Exception {
		
		
		if (dto.getLesson_type() != 3) {
			String[] l_date = request.getParameterValues("lesson_date");
			String[] l_time = request.getParameterValues("lesson_time");

			StringBuilder l_d_t = new StringBuilder();
			
			for (int i = 0; i < l_time.length; i++) {		
				if (i == l_time.length - 1) {
					l_d_t.append(" "+l_date[i] + " " + l_time[i]);
				} else if (i == 0){
					l_d_t.append(l_date[i] + " " + l_time[i]+ ", ");
				} else {
					l_d_t.append(" " + l_date[i] + " " + l_time[i]+ ",");
				}
			}
			dto.setLesson_date_time(l_d_t.toString());
			System.out.println(dto.getLesson_date_time());
		}
		
		

		String uploadPath=request.getSession().getServletContext().getRealPath("/"); 
		System.out.println("uploadPath:"+uploadPath);
		String imgUploadPath = uploadPath + File.separator+ "resources"+ File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "")  {
		 fileName=UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		 dto.setLesson_thumb(File.separator+ "resources"+File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		 String imgthumb = dto.getLesson_thumb();
		 int result = lesson_service.update_lesson(dto);
		 model.addAttribute("result",result);
		
		return "TodayLesson_SeniorPage/jy_sn_update_result";
		
		} else {
			 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
			 System.out.println("썸네일 경로가 안들어와야 정상"+fileName);
			 int result = lesson_service.update_lesson(dto);
			 model.addAttribute("result",result);
				return "TodayLesson_SeniorPage/jy_sn_update_result";

		}
	
	}
}
