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
@RequestMapping("/todaylesson/")
public class EJ_User_Store_Controller {

	
	@Resource(name="us_store_service")
	private EJ_All_Product_Service service;
	
	
	
	//스토어 메인
	@RequestMapping("/ej_store_main/{product_category}")
	public String slist(@PathVariable("product_category") int product_category
			,@RequestParam(required=false, defaultValue="recent") String order
			,Model model) {
		System.out.println("product_category"+product_category);
		
		if(product_category==0)
		{
			List<ProductDTO> list = service.selectAll(order);
			model.addAttribute("list",list);
		
		}
		else {
				List<ProductDTO> list = service.selectcategory(product_category);
				model.addAttribute("list",list);
		}
		
	
		return "TodayLesson_UserPage/ej_store_main.us_main_section";
	}
	
	
	//상품 디테일
	@RequestMapping("/ej_store_detail/{product_no}")
	public String sdetail(@PathVariable("product_no") int product_no
			,@RequestParam(required=false, defaultValue="recent") String order
			, Model model) {
		
		List<ProductDTO> list = service.selectAll(order);
		model.addAttribute("list",list);
		
		List<PdReviewDTO> reply = service.replyList(product_no);
		 System.out.println("reply object:"+reply);
		 model.addAttribute("reply",reply);
			ProductDTO dto = service.select(product_no);
			model.addAttribute("dto",dto);
			
		
	
		return "TodayLesson_UserPage/ej_store_detail.us_main_section";
	}
	
	
	
	
	
	// 상품 리뷰(댓글) 작성 registReply
	@ResponseBody
	@RequestMapping(value = "/ej_store_detail/registReply", method = RequestMethod.POST)
	public void registReply (/*PdReviewDTO reply*/
			@RequestParam String member_id,
			@RequestParam String pdreview_title ,
			@RequestParam String pdreview_content ,
			@RequestParam int product_no,
			HttpSession session) throws Exception {
	
	 
		PdReviewDTO pdreviewdto=new PdReviewDTO();
		pdreviewdto.setMember_id(member_id);
		pdreviewdto.setProduct_no(product_no);
		pdreviewdto.setPdreview_title(pdreview_title);
		pdreviewdto.setPdreview_content(pdreview_content);
		
		int result=service.registReply(pdreviewdto);
	 System.out.println("registReply Controller");

}
	
	
	
	
	
	//좋아요
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
		service.updateproductlike(product_no);
		
		if (product_in_mylike.isEmpty()) {
			service.insertmylike(likedto);
			result="success"; 
		} else {
			result="false";
		}
		return result;
		
	}
	//장바구니
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
	
	//디테일에서 개수 지정가능한 장바구니
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
	
	//주문양식
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
	

	//주문양식에서 포인트 적용
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
	
	
	//주문완료
	@RequestMapping("/orderlistdetail")
	public String orderlistdetail(OrderDetailDTO oddto, OrderListDTO oldto
			,@RequestParam(value="orderlist_cost", required=false) int orderlist_cost
			,@RequestParam(value="product_no", required=false) int product_no
			,@RequestParam(value="order_count") int order_count
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
	
	//Product테이블에 stock update  ..pdcount받아와야함
	ProductDTO productdto=new ProductDTO();
	System.out.println("pdcount"+order_count);
	int oldstock=service.selectstock(product_no);
	int newstock=oldstock-order_count;
	System.out.println("newstock"+newstock);
	productdto.setProduct_no(product_no);
	productdto.setProduct_stock(newstock);

	service.updatestock(productdto);
	
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
		int orderlist_no=Integer.parseInt(orderId);
		
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
	
	
		
	
	}
	
