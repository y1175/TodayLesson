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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.todaylesson.service.EJ_All_Product_Service;
import com.todaylesson.upload.UploadFileUtils;
import com.todaylesson.DTO.CartDTO;
import com.todaylesson.DTO.EventDTO;
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
	public String insertresult(Model model, ProductDTO dto, 
			MultipartFile file,  HttpServletRequest request) throws IOException, Exception {
		
		
	
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
		//file=null;
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "")   
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
	//상품 수정입력란 들어가기
	@RequestMapping("/ad_product_update/{product_no}")
	public String updatepro(@PathVariable("product_no") int product_no, Model model)
	{

		ProductDTO dto = service.select(product_no);
		model.addAttribute("dto",dto);
		
		return "TodayLesson_AdminPage/ej_ad_product_update";
	}

	
	//상품수정 결과
	@RequestMapping("/ad_product_update_result")
	public String proupdate_result(Model model, ProductDTO dto, MultipartFile file,HttpServletRequest request) throws IOException, Exception {
		

		String uploadPath=request.getSession().getServletContext().getRealPath("/"); 
		System.out.println("uploadPath:"+uploadPath);
		String imgUploadPath = uploadPath + File.separator+ "resources"+ File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		//가격에 할인율 적용
		int cost=dto.getProduct_cost()*(100-dto.getProduct_sale())/100;
		dto.setProduct_after_cost(cost);
		
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "")   
		{
		 fileName=UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		 dto.setProduct_thumb(File.separator+ "resources"+File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
	      String imgthumb=dto.getProduct_thumb();
	      int result = service.updatepro(dto);
	      model.addAttribute("result", result);
	      return "TodayLesson_AdminPage/ej_ad_product_updateresult";	      
	      
		 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		 System.out.println("썸네일 경로가 안들어와야 정상"+fileName);
		 int result = service.updatepro_nothumbnail(dto);
		  model.addAttribute("result", result);
		  return "TodayLesson_AdminPage/ej_ad_product_updateresult";	      
	      
		}
		
		
	}
	
	//상품 삭제
	@RequestMapping("/ad_product_delete/{product_no}")
	public String prodelete(@PathVariable int product_no, Model model) {
		
		int result = service.deletepro(product_no);//삭제 쿼리만들기
		model.addAttribute("result",result);
		
		return "TodayLesson_AdminPage/ej_ad_product_delete_result";
	}
	
	//후기리스트
	@RequestMapping("/ad_product_reviewlist")
	public String reviewlist(Model model) {
		List<PdReviewDTO> list = service.selectAllReview();
		model.addAttribute("list",list);
		return "TodayLesson_AdminPage/ej_ad_pdreviewlist";
	}
	//후기 삭제
	//스토어 메인
	
	@RequestMapping("/ej_store_main")
	public String slist(Model model) {
		List<ProductDTO> list = service.selectAll();
		model.addAttribute("list",list);
		//.us_main_section
		return "TodayLesson_UserPage/ej_store_main.us_main_section";
	}
	
	
	
	@RequestMapping("/ej_store_detail/{product_no}")
	public String sdetail(@PathVariable("product_no") int product_no, Model model) {
		
	
		List<PdReviewDTO> reply = service.replyList(product_no);
		 System.out.println("reply object:"+reply);
		 model.addAttribute("reply",reply);
			ProductDTO dto = service.select(product_no);
			model.addAttribute("dto",dto);
			
		
	
		return "TodayLesson_UserPage/ej_store_detail.us_main_section";
	}
	
	
	
	
	
	// 상품 소감(댓글) 작성 registReply
	@ResponseBody
	@RequestMapping(value = "/ej_store_detail/registReply", method = RequestMethod.POST)
	public void registReply (/*PdReviewDTO reply*/
			@RequestParam String member_id,
			@RequestParam String pdreview_content ,
			@RequestParam int product_no,
			HttpSession session) throws Exception {
	
	 
		PdReviewDTO pdreviewdto=new PdReviewDTO();
		pdreviewdto.setMember_id(member_id);
		pdreviewdto.setProduct_no(product_no);
		pdreviewdto.setPdreview_content(pdreview_content);
		
		int result=service.registReply(pdreviewdto);
	 System.out.println("registReply Controller");

}
	
	
	
	
	
	
	@ResponseBody
	@RequestMapping("/likejson")
	public String likemain(@RequestParam(value="product_no") int product_no
			,@RequestParam(value="member_id") String member_id)
	{
		System.out.println("productno:"+product_no+member_id);
		MyLikeDTO likedto=new MyLikeDTO();
		likedto.setMember_id(member_id);
		likedto.setProduct_no(product_no);
	
		String result;
		
		List<MyLikeDTO> product_in_mylike = service.has_mylike_product(likedto);
		
		if (product_in_mylike.isEmpty()) {
			service.insertmylike(likedto);
			result="success"; 
		} else {
			result="false";
		}
		return result;
		
	}
	@ResponseBody
	@RequestMapping("/cartjson")
	public String cartmain(@RequestParam(value="product_no") int product_no
			,@RequestParam(value="member_id") String member_id)
	{
		System.out.println("cart임");
		System.out.println("productno:"+product_no+member_id);
		CartDTO cartdto=new CartDTO();
		cartdto.setMember_id(member_id);
		cartdto.setProduct_no(product_no);
		
		String result;
		List<CartDTO> product_in_cart = service.has_cart_product(cartdto);
		
		if (product_in_cart.isEmpty()) {
			cartdto.setCart_amount(1);
			service.insertcart(cartdto);
			result="success"; 
		} else {
			result="false";
		}
		return result;
		
		
		
	}
	
	
	@RequestMapping("/mylike/{member_id}")
	public String mylike(@PathVariable(value="member_id") String member_id,Model model)
	{
		List<MyLikeDTO> likedto=service.selectMyLike(member_id);
		model.addAttribute("list",likedto);
		return "TodayLesson_UserPage/ej_us_mylike.us_main_section";
	}

	@RequestMapping("/ej_us_orderform")
	public String orderform(@RequestParam("product_no") int product_no
			,@RequestParam("pdcount") int pdcount
			,@RequestParam("product_name") String product_name
			,@RequestParam("product_after_cost") int product_after_cost
			,@RequestParam("member_id") String member_id
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
	
	@RequestMapping("/mycart/{member_id}")
	public String mycart(@PathVariable(value="member_id") String member_id,Model model)
	{
		List<CartDTO> cartdto=service.selectMyCart(member_id);
		model.addAttribute("list",cartdto);
		model.addAttribute("memberid",member_id);
		MemberDTO mdto = service.selectm(member_id);
		model.addAttribute("mdto",mdto);
		
		return "TodayLesson_UserPage/ej_us_mycart.us_main_section";
	}
	
	@ResponseBody
	@RequestMapping("/cartwith_amount_json")
	public String cartwith(@RequestParam(value="product_no") int product_no
			,@RequestParam(value="member_id") String member_id
			,@RequestParam(value="cart_amount") int cart_amount)
	{
		
		CartDTO cartdto=new CartDTO();
		cartdto.setMember_id(member_id);
		cartdto.setProduct_no(product_no);
	
	

		String result;
		List<CartDTO> product_in_cart = service.has_cart_product(cartdto);
		
		if (product_in_cart.isEmpty()) {
			cartdto.setCart_amount(cart_amount);
			service.insertcart(cartdto);
			result="success"; 
		} else {
			result="false";
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/ej_us_orderform/applypointjson")
	public void applypoint(@RequestParam(value="usepoint") int usepoint
			,@RequestParam(value="memberpoint") int member_point
			,@RequestParam(value="member_id") String member_id
			,@RequestParam(value="totalcost") int totalcost
			,@RequestParam(value="paymentcost") int paymentcost)
	{
		
		System.out.println("");
	}
	
	@ResponseBody
	@RequestMapping("/deletecart_json")
	public int  deletecart(@RequestParam(value="product_no")int product_no
			,@RequestParam(value="lesson_no")int lesson_no
			,@RequestParam(value="member_id")String member_id)
	{
		System.out.println("deletecart_prono:"+product_no);
		System.out.println("deletecart_lesson no:"+lesson_no);
		
		CartDTO cartdto=new CartDTO();
		cartdto.setMember_id(member_id);
		
		int result=0;
		
		if(lesson_no==0) {//상품삭제
			cartdto.setProduct_no(product_no);
		 result=service.deletecart(cartdto);
		 }
		else if(product_no==0) {//레슨삭제
			cartdto.setLesson_no(lesson_no);
			result=service.deletecart_lesson(cartdto);
		}
				return result;
	}
	
	@RequestMapping("/orderlistdetail")
	public String orderlistdetail(OrderDetailDTO oddto, OrderListDTO oldto
			,@RequestParam(value="orderlist_cost", required=false) int orderlist_cost
			, @RequestParam(value="addrselect",required=false) int addrselect
			,@RequestParam(value="roadaddr",required=false) String roadaddr
			,@RequestParam(value="jibunaddr",required=false) String jibunaddr
			, @RequestParam(value="detailaddr",required=false) String detailaddr
			,@RequestParam(value="orderlist_usepoint", required=false) int orderlist_usepoint
			,@RequestParam(value="remainpoint", required=false) int remainpoint
			,@RequestParam(value="member_id") String member_id
			, Model model)
	{
		
		
	if(addrselect>0)
		{
		 String fulladdr= "";	
		 if(addrselect==1) 
				{fulladdr=roadaddr;}
				else if(addrselect==2)
				{fulladdr=jibunaddr;}
		 oldto.setOrderlist_addr(fulladdr+" "+detailaddr);
		}//주소
	
	
	MemberDTO memberdto=new MemberDTO();
	int updatedpoint=(int) (remainpoint+(0.1*orderlist_cost));
	//remainpoint는 포인트 사용후 남은 금액
	//남은 금액에 결제금액의 10%를 적립해서 update해줌
	memberdto.setMember_id(member_id);
	memberdto.setMember_point(updatedpoint);
	service.updatepoint(memberdto);
	
	//주문번호 생성
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
		oddto.setOrderlist_no(orderlist_no);
		service.insertorderdetail(oddto);
		//포인트 차감
		

		OrderListDTO orderlistdto=service.selectorderlist(orderlist_no);//오더정보 받아오기
		List<OrderDetailDTO> list=service.selectorderdetail(orderlist_no);//오더 디테일 정보 받아오기
		model.addAttribute("list",list);
		model.addAttribute("orderlistdto",orderlistdto);
		return "TodayLesson_UserPage/ej_us_orderlistdetail.us_main_section";
	}
	
	
		/*
		List<CartDTO> cartdto=service.selectMyCart(member_id);
		//cart테이블에 잇는거 다 받아오기
		service.insertorder_cart(cartdto);
		//받아온 리스트를 order_detail테이블에 insert하기
*/		
		
	
	
	@RequestMapping("/order_cart")
	public String  order_cart(OrderListDTO oldto
			
			, @RequestParam(value="addrselect",required=false) int addrselect
			,@RequestParam(value="roadaddr",required=false) String roadaddr
			,@RequestParam(value="jibunaddr",required=false) String jibunaddr
			, @RequestParam(value="detailaddr",required=false) String detailaddr
			
			,@RequestParam(value="orderlist_cost", required=false) int orderlist_cost
			,@RequestParam(value="orderlist_usepoint", required=false) int orderlist_usepoint
			,@RequestParam(value="remainpoint", required=false) int remainpoint
			
			,@RequestParam(value="member_id") String member_id
			, Model model)
	{
		
		
		 
	if(addrselect>0)
		{
		 String fulladdr= "";	
		 if(addrselect==1) 
				{fulladdr=roadaddr;}
				else if(addrselect==2)
				{fulladdr=jibunaddr;}
		 oldto.setOrderlist_addr(fulladdr+" "+detailaddr);
		}//주소
	
	
	MemberDTO memberdto=new MemberDTO();
		int updatedpoint=(int) (remainpoint+(0.1*orderlist_cost));
		//remainpoint는 포인트 사용후 남은 금액
		//남은 금액에 결제금액의 10%를 적립해서 update해줌
		memberdto.setMember_id(member_id);
		memberdto.setMember_point(updatedpoint);
		service.updatepoint(memberdto);
	
	
	//주문번호 생성
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
		oldto.setOrderlist_no(orderlist_no); //주문번호지정
		service.insertorderlist(oldto);//주문정보 등록
		
		
		OrderDetailDTO oddto=new OrderDetailDTO();//주문디테일 객체 생성
		List<CartDTO> cartdto=service.selectMyCart(member_id);
		//cart테이블에 잇는거 다 받아오기
		
	
		for(CartDTO cart: cartdto)
		{
		service.insertorder_cart(cart, orderlist_no);
		//받아온 리스트를 order_detail테이블에 insert하기
		}
		
		
		service.delet_all_cart(member_id);//카트에 담겨 있는것 다 delete
	
		OrderListDTO orderlistdto=service.selectorderlist(orderlist_no);//오더정보 받아오기
		List<OrderDetailDTO> list=service.selectorderdetail(orderlist_no);//오더 디테일 정보 받아오기
		model.addAttribute("list",list);
		model.addAttribute("orderlistdto",orderlistdto);
		
		return "TodayLesson_UserPage/ej_us_ordercart.us_main_section";
	}
	
	
	}
	
