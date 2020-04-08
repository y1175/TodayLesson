package com.todaylesson.oreo;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.todaylesson.DTO.PdReviewDTO;
import com.todaylesson.service.EJ_All_Product_Service;

@Controller
@RequestMapping("/todaylessonadmin/")
public class EJ_Admin_Review_Controller {
	@Resource(name="us_store_service")
	private EJ_All_Product_Service service;
	

	//후기리스트
	@RequestMapping("/ad_product_reviewlist")
	public String reviewlist(Model model) {
		List<PdReviewDTO> list = service.selectAllReview();
		model.addAttribute("list",list);
		//
		return "TodayLesson_AdminPage/ej_ad_pdreviewlist.hs_ad_main_section";
	}
	//후기디테일
	@RequestMapping("/ad_product_reviewdetail/{pdreview_no}")
	public String pdreviewdetail(@PathVariable("pdreview_no") int pdreview_no, Model model) {
		
		PdReviewDTO dto = service.selectpdreview(pdreview_no);
		model.addAttribute("dto",dto);
		
		return "TodayLesson_AdminPage/ej_ad_pdreviewdetail.hs_ad_main_section";
	}
	
	//후기 삭제
		@RequestMapping("/ad_product_reviewdelete/{pdreview_no}")
		public String proreviewdelete(@PathVariable int pdreview_no, Model model) {
			
			int result = service.deletepdreview(pdreview_no);//삭제 쿼리만들기
			model.addAttribute("result",result);
			
			return "TodayLesson_AdminPage/ej_ad_pdreview_delete_result";
		}
	
}
