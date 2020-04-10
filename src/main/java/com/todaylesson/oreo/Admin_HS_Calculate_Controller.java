package com.todaylesson.oreo;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.todaylesson.DTO.CalculateDTO;
import com.todaylesson.DTO.OrderListDTO;
import com.todaylesson.DTO.SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO;
import com.todaylesson.service.Admin_HS_Calculate_Service;

@Controller
@RequestMapping("/todaylessonadmin/")
public class Admin_HS_Calculate_Controller {

	@Resource(name="admin_HS_Calculate_Service")
	private Admin_HS_Calculate_Service adminCalculateService;
	
	@RequestMapping("/admin_calculate_list")
	public String adminCalculteList(Authentication authentication
                                  , HttpServletRequest request,HttpServletResponse response
			                      , Model model) {
		//시큐리티 멤버아이디
		UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
		String member_id = userDetails.getUsername();
		
		//정산신청 리스트 정산번호 / 정산상태 / 정산신청일 / 정산기간
		List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> cal_requestlist
				            =adminCalculateService.calculateRequsetList();
		model.addAttribute("cal_requestlist", cal_requestlist);
		
		//정산신청 리스트 결제건수
		/*List<Integer> cal_paycount=adminCalculateService.calPayCount();
		model.addAttribute("cal_paycount", cal_paycount);*/
				
		//정산신청 리스트 레스수익금액
		List<Integer> cal_lessonrevenuecost=adminCalculateService.calRevenueCost();
		model.addAttribute("cal_lessonrevenuecost", cal_lessonrevenuecost);

		//정산신청 리스트 포인트사용
		List<Integer> cal_usepointsum=adminCalculateService.calUsePointSum();
		model.addAttribute("cal_usepointsum", cal_usepointsum);
				
		//정산신청 정산수수료 세금계산서 부가세
		List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> cal_CommSurtax
						    =adminCalculateService.cal_CommSurtax();
		model.addAttribute("cal_CommSurtax", cal_CommSurtax);

		//시니어 지급계좌 및 신청정보
		List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> cal_SeniorInfo
	    =adminCalculateService.cal_SeniorInfo();
		model.addAttribute("cal_SeniorInfo", cal_SeniorInfo);
		return "/TodayLesson_AdminPage/hs_ad_calculate_list.hs_ad_main_section";
	}
	
	@RequestMapping("/admin_calculate_give")
	public String admin_Calculate_Give(OrderListDTO dto
			                         , Authentication authentication
                                     , HttpServletRequest request,HttpServletResponse response
                                     , Model model) {
		
		int admin_Calculate_Give=adminCalculateService.admin_Calculate_Give(dto);
		model.addAttribute("admin_Calculate_Give", admin_Calculate_Give);
				
		return"/TodayLesson_AdminPage/hs_ad_calculte_give.hs_ad_main_section";
	}
	
	
	@RequestMapping("admin_calculte_datail")
	public String adminCalculteDetail(Authentication authentication
                                     , HttpServletRequest request,HttpServletResponse response
                                     , Model model) {
		
		/*SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO calculte_datail
		              =adminCalculateService.calculte_datail();*/
				
		return"/TodayLesson_AdminPage/hs_ad_calculte_detail.hs_ad_main_section";
	}
}
