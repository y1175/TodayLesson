package com.todaylesson.oreo;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.service.Admin_HS_Administrator_Service;

@Controller
@RequestMapping("/todaylessonadmin/")
public class Admin_HS_Administrator_Controller {
	
	@Resource(name="admin_HS_Administrator_Service")
	private Admin_HS_Administrator_Service administratorService;
	
	@RequestMapping("/admin_administrator")
	public String administratorDetail(Model model) {
		MemberDTO dto=administratorService.administratorDetail();
		
		model.addAttribute("dto", dto);
		
		return "TodayLesson_AdminPage/hs_ad_administrator.hs_ad_main_section";
	}
	
}
