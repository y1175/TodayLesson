package com.todaylesson.oreo;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.DTO.PageMaker;
import com.todaylesson.service.Admin_HM_MemmanageService;

@Controller
public class Admin_HM_Memmanage_Controller {

	@Resource(name="admin_hm_memmanage")
	private Admin_HM_MemmanageService service;
	
	@RequestMapping("/admin_hm_memmanage")
	public String memberlist(
			@RequestParam(required=false, defaultValue="") String search
			,@RequestParam(required=false, defaultValue="") String searchtxt
			,@RequestParam(required=false, defaultValue="1") int currPage
			,Model model)
	{
		int totalCount= service.totalCount(search, searchtxt);
		int pageSize=15;
		int blockSize=5;
		
		
		PageMaker page = new PageMaker(currPage, totalCount, pageSize, blockSize);
		
		
		List<MemberDTO> list =service.adminmemberlist(search,searchtxt,page.getStartRow()
													,page.getEndRow());
		model.addAttribute("list",list);
		model.addAttribute("page",page);
		model.addAttribute("search",search);
		model.addAttribute("searchtxt",searchtxt);
		
		System.out.println(search);
		System.out.println(searchtxt);
		System.out.println(totalCount);
		
		return "/TodayLesson_AdminPage/hm_ad_user_memmanage.hs_ad_main_section";
		
	}
	
	@RequestMapping("/adminmember_levelupdate")
	public String member_levelupdate(@RequestParam("member_id") String member_id
									,@RequestParam("member_level") int member_level
									,Model model)
	{
		HashMap<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("member_level", member_level);
		int result = service.adminlevelupdate(map);
		model.addAttribute("result",result);
		if(result>0)
		{
			int authresult = service.adminmemberauthupdate(map);
			model.addAttribute("authresult",authresult);
			return "TodayLesson_AdminPage/hm_ad_levelupdateresult.hs_ad_main_section";
		}
		else{
			
			return "TodayLesson_AdminPage/hm_ad_levelupdateresult.hs_ad_main_section";	
		}
		
		
	}
	
	//디테일 정보
	@RequestMapping("/hm_memmanagedetail/{no}")
	public String detail(@PathVariable int no, Model model)
	{
		int member_no = no;
		System.out.println(member_no);
		MemberDTO dto = service.detail(member_no);
		model.addAttribute("dto",dto);
		
		return "TodayLesson_AdminPage/hm_ad_user_memmanagedetail.hs_ad_main_section";
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
