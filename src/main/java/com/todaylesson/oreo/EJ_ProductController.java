package com.todaylesson.oreo;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.todaylesson.service.EJ_All_Product_Service;
import com.todaylesson.upload.UploadFileUtils;
import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.DTO.PdReviewDTO;
import com.todaylesson.DTO.ProductDTO;


@Controller
public class EJ_ProductController {

	
	@Resource(name="service")
	private EJ_All_Product_Service service;
	//
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping("/ej_ad_productlist")
	public String list(Model model) {
		List<ProductDTO> list = service.selectAll();
		model.addAttribute("list",list);
		return "TodayLesson_AdminPage/ej_ad_productlist";
	}
	
	@RequestMapping("/ej_ad_productregister")
	public String insert(){
		
		return "TodayLesson_AdminPage/ej_ad_productregister";
	}
	
	@RequestMapping("/ej_ad_product_insertresult")
	public String insertresult(Model model, ProductDTO dto, MultipartFile file) throws IOException, Exception {
		

		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) 
		{
		 fileName=UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		dto.setProduct_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		dto.setProduct_thumb(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		String img=dto.getProduct_img();
		String imgthumb=dto.getProduct_thumb();
		System.out.println("이미지경로: "+img);
		System.out.println("썸네일이미지경로: "+imgthumb);
		int result = service.insertBoard(dto);
		model.addAttribute("result", result);
		
		return "TodayLesson_AdminPage/ej_ad_product_insertresult";
		
	}
	
	@RequestMapping("/ej_ad_productdetail/{product_no}")
	public String detail(@PathVariable("product_no") int product_no, Model model) {
		
		ProductDTO dto = service.select(product_no);
		model.addAttribute("dto",dto);
		
		return "TodayLesson_AdminPage/ej_ad_productdetail";
	}
	@RequestMapping("/ej_store_main")
	public String slist(Model model) {
		List<ProductDTO> list = service.selectAll();
		model.addAttribute("list",list);
		//.us_main_section
		return "ej_store_main";
	}
	
	
	@RequestMapping("/ej_store_detail/{product_no}")
	public String sdetail(@PathVariable("product_no") int product_no, Model model) {
		
		ProductDTO dto = service.select(product_no);
		model.addAttribute("dto",dto);
		//.us_main_section
		return "ej_store_detail";
	}
	// 상품 소감(댓글) 목록 /view/replyList엿음..replyList
	@ResponseBody
	@RequestMapping(value = "/ej_store_detail/replyList", method = RequestMethod.GET)
	public List<PdReviewDTO> getReplyList(@RequestParam("product_no") int product_no) throws Exception {
//원래는 RequestParam임 pathvariable로 해
	   
	 List<PdReviewDTO> reply = service.replyList(product_no);
	 
	 return reply;
	} 
	
	// 상품 소감(댓글) 작성 registReply
	@ResponseBody
	@RequestMapping(value = "/ej_store_detail/registReply", method = RequestMethod.POST)
	public void registReply (PdReviewDTO reply,  HttpSession session) throws Exception {
	
	 
	 MemberDTO member = (MemberDTO)session.getAttribute("member");
	 System.out.println(session.getAttribute("member"));
	 reply.setMember_id(member.getMember_id());
	 
	 service.registReply(reply);
	
}
	@RequestMapping("/ej_us_orderform")
	public String order(@RequestParam("product_no") int product_no
			,@RequestParam("pdcount") int pdcount
			,@RequestParam("product_name") String product_name
			,@RequestParam("product_cost") int product_cost
			,@RequestParam("memberid") String member_id
			,Model model){
		System.out.println("주문페이지에서 상풍번호:"+product_no);
		System.out.println("주문페이지에서 수량:"+pdcount);
		model.addAttribute("product_no",product_no);
		model.addAttribute("product_name",product_name);
		model.addAttribute("product_cost",product_cost);
		model.addAttribute("pdcount",pdcount);
		model.addAttribute("member_id",member_id);
		MemberDTO mdto = service.selectm(member_id);
		model.addAttribute("mdto",mdto);
		
		ProductDTO dto = service.select(product_no);
		model.addAttribute("pdto",dto);
		
		return "TodayLesson_UserPage/ej_us_orderform";
	}
	}
	
