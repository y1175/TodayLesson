package com.todaylesson.oreo;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
import com.todaylesson.DTO.CartDTO;
import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.DTO.MyLikeDTO;
import com.todaylesson.DTO.PdReviewDTO;
import com.todaylesson.DTO.OptionsDTO;
import com.todaylesson.DTO.OrderDetailDTO;
import com.todaylesson.DTO.OrderListDTO;
import com.todaylesson.DTO.ProductDTO;


@Controller
public class EJ_ProductController {

	
	@Resource(name="service")
	private EJ_All_Product_Service service;
	//
	/*@Resource(name="uploadPath")
	private String uploadPath;*/
	
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
	public String insertresult(Model model, ProductDTO dto, MultipartFile file,  HttpServletRequest request) throws IOException, Exception {
		
/*
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
		dto.setProduct_thumb(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);*/
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

		dto.setProduct_img(File.separator+ "resources"+File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		dto.setProduct_thumb(File.separator+ "resources"+File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		String img=dto.getProduct_img();
		String imgthumb=dto.getProduct_thumb();
		System.out.println("이미지경로: "+img);
		System.out.println("썸네일이미지경로: "+imgthumb);
		int cost=dto.getProduct_cost()*(100-dto.getProduct_sale())/100;
		dto.setProduct_after_cost(cost);
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
	
	@RequestMapping("/ad_add_pdOption/{product_no}")
	public String addoption(@PathVariable("product_no") int product_no, Model model) {
		
		ProductDTO dto = service.select(product_no);
		List<OptionsDTO> optionlist = service.optionList(product_no);
		
		 model.addAttribute("optionlist",optionlist);
		
		model.addAttribute("dto",dto);
		
		return "TodayLesson_AdminPage/ej_ad_pdOption";
	}
	
	@RequestMapping("/ej_ad_pdOption_insertresult")
	public String addoptionresult(Model model, OptionsDTO odto) throws IOException, Exception {
		

		/*int cost=dto.getProduct_cost()*(100-dto.getProduct_sale())/100;
		dto.setProduct_after_cost(cost);
		int result = service.insertBoard(dto);
		model.addAttribute("result", result);
		
		return "TodayLesson_AdminPage/ej_ad_product_insertresult";*/
		int result=service.insertOption(odto);
		model.addAttribute("result",result);
		
		return "TodayLesson_AdminPage/ej_ad_pdOption_insertresult";
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/ad_add_pdOption/insertOption_json", method = RequestMethod.POST)
	public void addoptionjson (/*PdReviewDTO reply*/
			@RequestParam int option_cost,
			@RequestParam String option_name ,
			@RequestParam int product_no,
			HttpSession session) throws Exception {
	
	 
		OptionsDTO odto=new OptionsDTO();
		
		odto.setOption_cost(option_cost);
		odto.setOption_name(option_name);
		odto.setProduct_no(product_no);
		
		int result=service.insertOption(odto);
	 System.out.println("addoption json  Controller");
/*	 reply.setMember_id(member.getMember_id());
	 
	 service.registReply(reply)*/;
	
}
	@RequestMapping("/ej_store_main")
	public String slist(Model model) {
		List<ProductDTO> list = service.selectAll();
		model.addAttribute("list",list);
		//.us_main_section
		return "ej_store_main.us_main_section";
	}
	
	
	@RequestMapping("/ej_store_detail/{product_no}")
	public String sdetail(@PathVariable("product_no") int product_no, Model model) {
		
	
		List<PdReviewDTO> reply = service.replyList(product_no);
		 System.out.println("reply object:"+reply);
		 model.addAttribute("reply",reply);
			ProductDTO dto = service.select(product_no);
			model.addAttribute("dto",dto);
			List<OptionsDTO> optionlist = service.optionList(product_no);
			
			 model.addAttribute("optionlist",optionlist);
			
		//.us_main_section
		return "ej_store_detail.us_main_section";
	}

	
	
	
	
	
	
	
	
	
	/*
	// 상품 소감(댓글) 목록 /view/replyList엿음..replyList        
	List<PdReviewDTO>
	@ResponseBody
	@RequestMapping(value = "/ej_store_detail/replyList", method = RequestMethod.GET)
	public  List<PdReviewDTO> getReplyList(@RequestParam("product_no") int product_no
			,@RequestParam("member_id") String member_id
			,@RequestParam("pdreview_content") String pdreview_content) throws Exception {
//원래는 RequestParam임 pathvariable로 해
	   

	 System.out.println("getReplyListController");
	 List<PdReviewDTO> reply = service.replyList(product_no);
	 System.out.println("reply object:"+reply);
	 System.out.println(product_no);
	 System.out.println(member_id);
	
	// System.out.println(pdreview_content);
		int i = 0;

		while ( i < reply.size()) {

			System.out.println("reply list:"+reply.get(2));

			i++;

		}




	 return reply;
		return 3;
		//여기서 리턴한게 replyList()함수에서 data로 받아지네
		
	} 
	*/
	
	// 상품 소감(댓글) 작성 registReply
	@ResponseBody
	@RequestMapping(value = "/ej_store_detail/registReply", method = RequestMethod.POST)
	public void registReply (/*PdReviewDTO reply*/
			@RequestParam String member_id,
			@RequestParam String pdreview_content ,
			@RequestParam int product_no,
			HttpSession session) throws Exception {
	
	 
	/* MemberDTO member = (MemberDTO)session.getAttribute("member");*/
		PdReviewDTO pdreviewdto=new PdReviewDTO();
		pdreviewdto.setMember_id(member_id);
		pdreviewdto.setProduct_no(product_no);
		pdreviewdto.setPdreview_content(pdreview_content);
		
		int result=service.registReply(pdreviewdto);
	 System.out.println("registReply Controller");
/*	 reply.setMember_id(member.getMember_id());
	 
	 service.registReply(reply)*/;
	
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/ej_us_orderform")
	public String orderform(@RequestParam("product_no") int product_no
			,@RequestParam("pdcount") int pdcount
			,@RequestParam("product_name") String product_name
			,@RequestParam("product_after_cost") int product_after_cost
			,@RequestParam("memberid") String member_id
			,Model model){
		System.out.println("주문페이지에서 상풍번호:"+product_no);
		System.out.println("주문페이지에서 수량:"+pdcount);
		model.addAttribute("product_no",product_no);
		model.addAttribute("product_name",product_name);
		model.addAttribute("product_after_cost",product_after_cost);
		model.addAttribute("pdcount",pdcount);
		model.addAttribute("member_id",member_id);
		MemberDTO mdto = service.selectm(member_id);
		model.addAttribute("mdto",mdto);
		
		ProductDTO dto = service.select(product_no);
		model.addAttribute("pdto",dto);
		int totalcost=pdcount*product_after_cost;
		model.addAttribute("totalcost", totalcost);
		return "TodayLesson_UserPage/ej_us_orderform.us_main_section";
	}
	
	/*@RequestMapping("/orderlistdetail")
	public String orderlistdetail(@RequestParam("product_no") int product_no
			,@RequestParam("memberid") String memberid
			,@RequestParam("orderlist_receiver") String orderlist_receiver
			,@RequestParam("orderlist_phone") String orderlist_phone
			,@RequestParam("pdcount") int pdcount
			,@RequestParam("totalcost") int totalcost
			,@RequestParam("orderlist_addr") String orderlist_addr)
	{
		OrderDetailDTO oddto=service.insertorderdetail;
		oddto.set
		OrderlistDTO oldto=service.insertorderlist;
		
		return "TodayLesson_UserPage/ej_us_orderlistdetail.us_main_section";
	}*/
	@RequestMapping("/orderlistdetail")
	public String orderlistdetail(OrderDetailDTO oddto, OrderListDTO oldto, Model model)
	{
		//여기서 주문번호 생성해서 넘겨주기

		 Calendar cal = Calendar.getInstance();
		 int year1 = cal.get(Calendar.YEAR);
		 String year2=Integer.toString(year1);
		 String year=year2.substring(2, 4);
		 
		 System.out.println("두자릿수년도:"+year);
		 String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		 System.out.println();
		 System.out.println(ym);
		 String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		 String subNum = "";
		 
		 for(int i = 1; i <= 4; i ++) {
		  subNum += (int)(Math.random() * 10);
		 }
		 
		 String orderId =ymd+subNum;
		 System.out.println("오더아이디:"+orderId);
		 System.out.println("데이터타입확인:"+orderId instanceof String);
		int orderlist_no=Integer.parseInt(orderId);
			System.out.println("orderlist_NO:"+orderlist_no);
		oldto.setOrderlist_no(orderlist_no); 
		
		service.insertorderlist(oldto);
		//service.insertorderdetail(oddto);
		//model.addAttribute("oddto",oddto);
		model.addAttribute("oldto",oldto);
		//List<OrderDetailDTO> list=service.selectordetail;
		return "TodayLesson_UserPage/ej_us_orderlistdetail.us_main_section";
	}
	@ResponseBody
	@RequestMapping("/likejson")
	public void likemain(@RequestParam(value="product_no") int product_no
			,@RequestParam(value="member_id") String member_id)
	{
		System.out.println("productno:"+product_no+member_id);
		MyLikeDTO likedto=new MyLikeDTO();
		likedto.setMember_id(member_id);
		likedto.setProduct_no(product_no);
		service.insertmylike(likedto);
		System.out.println("like임");
		
	}
	@ResponseBody
	@RequestMapping("/cartjson")
	public void cartmain(@RequestParam(value="product_no") int product_no
			,@RequestParam(value="member_id") String member_id)
	{
		System.out.println("productno:"+product_no+member_id);
		CartDTO cartdto=new CartDTO();
		cartdto.setMember_id(member_id);
		cartdto.setProduct_no(product_no);
		cartdto.setCart_amount(1);
		service.insertcart(cartdto);
		System.out.println("cart임");
		
	}
	}
	
