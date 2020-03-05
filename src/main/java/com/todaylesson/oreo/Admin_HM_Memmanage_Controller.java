package com.todaylesson.oreo;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.service.Admin_HM_MemmanageService;

@Controller
public class Admin_HM_Memmanage_Controller {

	@Resource(name="admin_hm_memmanage")
	private Admin_HM_MemmanageService service;
	
	@RequestMapping("/admin_hm_memmanage")
	public String memberlist(Model model)
	{
		
		List<MemberDTO> list =service.adminmemberlist();
		model.addAttribute("list",list);
		return "hm_ad_user_memmanage";
		
	}
	
}
