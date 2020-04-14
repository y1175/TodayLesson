package com.todaylesson.oreo;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
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
@RequestMapping("/todaylessonadmin/")
public class Admin_HM_Memmanage_Controller {

	@Resource(name="admin_hm_memmanage")
	private Admin_HM_MemmanageService service;
	
	@RequestMapping("/admin_hm_memmanage")
	public String memberlist(
			@RequestParam(required=false, defaultValue="") String search
			,@RequestParam(required=false, defaultValue="") String searchtxt
			,@RequestParam(required=false, defaultValue="1") int currPage
			,Model model ) 
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
		
		//(search);
		//(searchtxt);
		//(totalCount);
		
		return "/TodayLesson_AdminPage/hm_ad_user_memmanage.hs_ad_main_section";
		
	}
	
	
	
	@RequestMapping("/adminmember_levelupdate")
	public String member_levelupdate(@RequestParam("member_id") String member_id
									,@RequestParam("member_level") int member_level
									,Model model) {
		
		

		HashMap<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("member_level", member_level);
		int succes = 1;
		int error = 0;
		int cancel = -1;
		
		if(member_level==1) {
			//멤버 레벨을 주니어(1)로 바꿀 때
			
			MemberDTO dto = service.oldlevel(member_id);
			int oldlevel = dto.getMember_level();
				//기존의 레벨을 받아온다
				
				if(oldlevel ==2) {
					//기존에 시니어(2)였다면
					int result = service.adminlevelupdate(map);
					//member레벨 업데이트도 시켜주고 enabled 설정해준다
					int result2 = service.adminlevelup(map);
					//기존에 있던 시니어 테이블도 삭제해준다
					int authresult = service.adminmemberauthupdate(map);
					//update로 member_auth를 'ROLE_USER'(주니어 권한을추가해준다)
					int authdelresult = service.adminmemberauthdelete(map);
					// delete로 기존에 member_id와 member_auth가 'ROLE_SENIOR'인 권한을 삭제해준다

					if(result>0 && result2>0 && authresult>0 && authdelresult>0) {
						
						model.addAttribute("result",succes);
						return "TodayLesson_AdminPage/hm_ad_levelupdateresult.hs_ad_main_section";
					}else {
						
						model.addAttribute("result",error);
						return "TodayLesson_AdminPage/hm_ad_levelupdateresult.hs_ad_main_section";
					}
			
				}else if(oldlevel ==3) {
					//기존에 블락(3)이었다면(->시니어 였다면 시니어로 주니어 였다면 주니어로 따로 레벨 등업해줄것)
					int blockresult = service.adminlevelupdate(map);
					//member레벨 업데이트도 시켜주고 enabled 설정해준다
					int blockresult2 = service.delblockauth(map);
					//기존 ROLE_ERROR권한 삭제해줌
					int authresult = service.adminmemberauthupdate(map);
					//update로 member_auth를 'ROLE_USER'(주니어 권한을추가해준다)
					if(blockresult>0 && blockresult2>0&&authresult>0) {
						//기존에 권한이 있는상태로 블락이 되었기때문에 레벨만 업데이트 시켜준다
						
						
						model.addAttribute("result",succes);//1
						return "TodayLesson_AdminPage/hm_ad_levelupdateresult.hs_ad_main_section";
					}else {
						model.addAttribute("result",error);//0
						return "TodayLesson_AdminPage/hm_ad_levelupdateresult.hs_ad_main_section";
	
					}
				}else{
					//기존에 주니어(1)였던 사람이 다시 주니어가 되고 싶어질 일은 없음 
					//관리자아이디는 주니어가 될 수 없음(원칙상)
					
					model.addAttribute("result",cancel);
					return "TodayLesson_AdminPage/hm_ad_levelupdateresult.hs_ad_main_section";

				}

		}else if(member_level ==2) {
			//멤버 레벨을 시니어로 바꿀 때 
			MemberDTO dto = service.oldlevel(member_id);
			int oldlevel = dto.getMember_level();
			//기존의 레벨을 받아온다
				if(oldlevel==1) {
					//주니어가 시니어가 되고 싶어 할 때
					int result = service.adminlevelupdate(map);
					//member레벨 업데이트도 시켜주고 enabled 설정해준다
					int result2 = service.leveluptojr(map);
					//ROLE_SENIOR권한을 추가 시켜준다
					int result3 = service.deljrauth(map);
					//기존에 있던 ROLE_JINOR권한을 삭제시켜준다
					int result4 = service.insertsenior(member_id);
					if(result>0 && result2>0 && result3>0 && result4>0) {
						model.addAttribute("result",succes);
						return "TodayLesson_AdminPage/hm_ad_levelupdateresult.hs_ad_main_section";
					}else {
						
						model.addAttribute("result",error);
						return "TodayLesson_AdminPage/hm_ad_levelupdateresult.hs_ad_main_section";
					}
					
				}if(oldlevel==3) {
					//블락됐다가 다시 시니어로 바꿔줌
					int blockresult = service.adminlevelupdate(map);
					//member레벨 업데이트도 시켜주고 enabled 설정해준다
					int blockresult2 = service.delblockauth(map);
					//기존 ROLE_ERROR권한 삭제해줌
					int result2 = service.leveluptojr(map);
					//ROLE_SENIOR권한을 추가 시켜준다
					
					if(blockresult>0 && blockresult2>0&&result2>0) {
						
						model.addAttribute("result",succes);
						return "TodayLesson_AdminPage/hm_ad_levelupdateresult.hs_ad_main_section";
						
					}else {
						model.addAttribute("result",error);
						return "TodayLesson_AdminPage/hm_ad_levelupdateresult.hs_ad_main_section";
						
					}

				}else {
					//기존에 시니어(2)였던 사람이 다시 시니어가 될리 없음 
					//관리자아이디는 시니어가 될 수 없음(원칙상)
					
					model.addAttribute("result",cancel);
					return "TodayLesson_AdminPage/hm_ad_levelupdateresult.hs_ad_main_section";
					
				}
			

		}else if(member_level==3) {
			//블락먹일 때
			
			int result = service.adminlevelupdate(map);
			//member레벨 업데이트도 시켜주고 enabled 설정해준다
			int result2 =service.insertblock(map);
			//ROLE_ERROR를 준다
			int result3 =service.delnotblock(map);
			//기존 권한을 삭제한다
			if(result > 0 && result2>0 && result3>0) {
				model.addAttribute("result",succes);
				return "TodayLesson_AdminPage/hm_ad_levelupdateresult.hs_ad_main_section";
				
			}else {
				model.addAttribute("result",error);
				return "TodayLesson_AdminPage/hm_ad_levelupdateresult.hs_ad_main_section";
			}
			
		}else {
			//관리자 레벨로 변경할 때
			MemberDTO dto = service.oldlevel(member_id);
			int oldlevel = dto.getMember_level();
			
			if(oldlevel != 3) {
				//그전레벨이 블락이 아닐 떄= 주니어이거나 시니어일 때

				int result = service.adminlevelupdate(map);
				//member레벨 업데이트도 시켜주고 enabled 설정해준다
				int result2 = service.plusadmin(map);
				//ROLE_ADMIN을 추가해준다
				int result3 = service.delauth(map);
				//그전의 ROLE을 삭제해준다(주니어건 시니어건)
				if(result>0 && result2>0 && result3>0) {
					model.addAttribute("result",succes);
					return "TodayLesson_AdminPage/hm_ad_levelupdateresult.hs_ad_main_section";
					
				}else {
					model.addAttribute("result",error);
					return "TodayLesson_AdminPage/hm_ad_levelupdateresult.hs_ad_main_section";
				}
			}else {
				//그전 레벨이 블락일 떄 관리자가 되는것은 말이 안됨 우선 주니어나 시니어로 블락을 풀고 바꿀 것
				model.addAttribute("result",cancel);
				return "TodayLesson_AdminPage/hm_ad_levelupdateresult.hs_ad_main_section";
				
			}

		}

	}

	}
	
	
	
	
	
	

	

