package com.todaylesson.oreo;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.service.Hm_Us_MymanageService;

@Controller
public class User_HM_Mymanage_Controller {

	//암호화
	@Resource(name="passwordEncoder")
	private BCryptPasswordEncoder encoder;
	
	
	//내 정보관리
	@RequestMapping("/hm_us_mymanage")
	public String hm_us_mymanage1()
	{
		
		return "hm_us_mymanage";
	}
	
	//서비스
	@Resource(name="hm_us_mymanage")
	private Hm_Us_MymanageService hm_mymanageservice;


	@RequestMapping("/hm_us_mymanage2")
	public String currentUserName(@RequestParam("member_id") String member_id
			,@RequestParam("member_pwd") String member_pwd
			,Model model)
	{
		

	    String encoded_pwd=encoder.encode(member_pwd);
	    boolean result=encoder.matches(member_pwd , encoded_pwd);
	    
		
		System.out.println(member_pwd);
		System.out.println(result);
		
		if(result==true)
		{
			MemberDTO dto = hm_mymanageservice.MyInfolist(member_id);
			model.addAttribute("dto",dto);
			return "hm_us_mymanageupdate";
		}
		else {
			
			return "hm_us_mymanage";
		}
	}
	

	//내정보 수정
	@RequestMapping("/hm_us_mymanageupdate")
	public String hmusmymanageupdate(@RequestParam("member_id") String member_id
									,@RequestParam("member_pwd") String member_pwd
									,@RequestParam("member_name") String member_name
									,@RequestParam("member_birth") String member_birth
									,@RequestParam("member_email") String member_email
									,@RequestParam("member_phone") String member_phone
									,@RequestParam("member_zipcode") int member_zipcode
									,@RequestParam("addrselect") int addrselect
									,@RequestParam("roadaddr") String roadaddr
									,@RequestParam("jibunaddr") String jibunaddr
									,@RequestParam("detailaddr") String detailaddr
									,@RequestParam("member_nick") String member_nick
									,MemberDTO dto, Model model)
	{
		
		member_pwd=encoder.encode(member_pwd);
		dto.setMember_id(member_id);
		dto.setMember_pwd(member_pwd);
		dto.setMember_name(member_name);
		dto.setMember_birth(member_birth);
		dto.setMember_email(member_email);
		dto.setMember_phone(member_phone);
		dto.setMember_zipcode(member_zipcode);
		dto.setMember_nick(member_nick);
		
		String fulladdr= "";	
		if(addrselect==0)
		{fulladdr=roadaddr;}
		else
		{fulladdr=jibunaddr;}
		
		dto.setMember_addr(fulladdr+" "+detailaddr);
		
		int result = hm_mymanageservice.MyInfoupdate(dto);
		model.addAttribute("result",result);

		return "hm_us_mymanageupdateresult";
	}
	
}
