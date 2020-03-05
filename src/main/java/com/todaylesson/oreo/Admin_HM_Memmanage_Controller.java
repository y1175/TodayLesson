package com.todaylesson.oreo;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		return "/TodayLesson_AdminPage/hm_ad_user_memmanage";
		
	}
	
	/*@RequestMapping("/member_levelupdate")
	public void member_levelupdate(
			@RequestParam("member_id") String member_id
			,@RequestParam("member_level") int member_level)
	{
		
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("member_id", member_id);
		map.put("member_level", member_level);
		
	
		
	}*/
	
}
