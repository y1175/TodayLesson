package com.todaylesson.oreo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.social.google.connect.GoogleOAuth2Template;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.todaylesson.DTO.BannerDTO;
import com.todaylesson.DTO.CartDTO;
import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.DTO.Member_AuthDTO;
import com.todaylesson.DTO.MyLikeDTO;
import com.todaylesson.DTO.OrderListDTO;
import com.todaylesson.DTO.PopUpDTO;
import com.todaylesson.DTO.ProductDTO;
import com.todaylesson.DTO.SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO;
import com.todaylesson.DTO.SeniorDTO;
import com.todaylesson.service.Hm_Us_MailSendService;
import com.todaylesson.service.LoginService;
import com.todaylesson.service.Senior_HS_MainService;
import com.todaylesson.service.Admin_HS_MainService;
import com.todaylesson.service.Admin_YI_Popup_Service;
import com.todaylesson.service.EJ_All_Product_Service;
import com.todaylesson.service.EJ_US_NaverLoginBOService;
import com.todaylesson.service.TodaylessonService;
import com.todaylesson.service.User_HS_KakaoLoginService;
import com.todaylesson.service.User_HS_MainService;
import com.todaylesson.service.User_HS_MyPageService;
import com.todaylesson.service.YI_Google_AuthInfo;


//MainPage(User, Senior, Admin, Login, Logout , Join, FindId, FindPw, popupOpen) -> 유저 홈에 있는것들
@Controller
public class TodayLessonController {
   
	/* NaverLogin */
    private EJ_US_NaverLoginBOService naverLoginBO;
    private String apiResult = null;
    /* NaverLogin */
    
    /* googleLogin */
    @Inject
    private YI_Google_AuthInfo authInfo;
    
    @Autowired
    private GoogleOAuth2Template googleOAuth2Template;
    
    @Autowired
    private OAuth2Parameters googleOAuth2Parameters;
    /* googleLogin */
    
    /* kakaoLogin */
    @Resource(name="kakaologinservice")
    private User_HS_KakaoLoginService hs_kakaologinservice;
    /* kakaoLogin */
    
    /* security */
    @Resource(name="todaylessonService")
    private TodaylessonService todaylessonService;
    /* security */
    
    /* User_Main */
    @Resource(name="user_HS_MainService")
    private User_HS_MainService userMainService;
    /* User_Main */

    /* User_MyPage */
    @Resource(name="user_HS_MyPageService")
    private User_HS_MyPageService userMyPageService;
    /* User_MyPage */
    
    /* Senior_MyPage */
    @Resource(name="senior_HS_MainService")
    private Senior_HS_MainService seniorMainService;
    /* Senior_MyPage */
    
    /* Admin_Main */
    @Resource(name="admin_HS_MainService")
    private Admin_HS_MainService adminMainService;
    /* Admin_Main */
    
    /* 아이디찾기 */
    @Resource(name="loginService")
    private LoginService loginService;
    /* 아이디찾기 */
    
    /* 비밀번호찾기 */
    @Autowired
    private Hm_Us_MailSendService mailSender;
    /* 비밀번호찾기 */
    
    /* 스토어 좋아요, 장바구니 */
    @Resource(name="us_store_service")
    private EJ_All_Product_Service userStoreService;
    /* 스토어 좋아요, 장바구니 */
    
    /*팝업*/ 
    @Resource(name="admin_YI_Popup_Service")
    private Admin_YI_Popup_Service popupService;
    /*팝업*/
    
    @RequestMapping("/todaylessonadmin")
    public String admin(@RequestParam(required=false,defaultValue="date") String ymd,
    		            Authentication authentication,
                        Model model, HttpSession session) {
        //시큐리티 멤버아이디
        UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
        String member_id = userDetails.getUsername(); 
    	
        //관리자 닉네임받기
    	String adminMemberNick=adminMainService.adminMemberNick(member_id);
    	session.setAttribute("adminMemberNick", adminMemberNick);
    	
    	//일일가입자수 집계
    	int memberJoinCount=adminMainService.memberJoinCount();
    	model.addAttribute("memberJoinCount", memberJoinCount);
    	
    	//일일 시니어전환자 집계
    	int seniorChangeCount=adminMainService.seniorChangeCount();
    	model.addAttribute("seniorChangeCount", seniorChangeCount);
    	
    	//일일게시글수 집계
    	int freeboardWriteCount=adminMainService.freeboardWriteCount();
    	model.addAttribute("freeboardWriteCount", freeboardWriteCount);
    	
    	//일일 판매금액 집계
    	int orderlistCostSum=adminMainService.orderlistCostSum();
    	model.addAttribute("orderlistCostSum", orderlistCostSum);
    	
    	//스토어현황
    	  //등록된상품
    	  int registrationProductCount=adminMainService.registrationProductCount();
    	  model.addAttribute("registrationProductCount", registrationProductCount);
    	  //판매가능상품
    	  int possibilityProductCount=adminMainService.possibilityProductCount();
    	  model.addAttribute("possibilityProductCount", possibilityProductCount);
    	  //품절상품
    	  int soldOutProductCount=adminMainService.soldOutProductCount();
    	  model.addAttribute("soldOutProductCount", soldOutProductCount);
    	  
    	//레슨현황
    	  //등록된 레슨 
    	  int registrationLessonCount=adminMainService.registrationLessonCount();
    	  model.addAttribute("registrationLessonCount", registrationLessonCount);
    	  //오픈레슨
    	  int openLessonCount=adminMainService.openLessonCount();
    	  model.addAttribute("openLessonCount", openLessonCount);
    	  //마감레슨
    	  int closeLessonCount=adminMainService.closeLessonCount();
    	  model.addAttribute("closeLessonCount", closeLessonCount);
    	  //품절레슨
    	  int soldOutLessonCount=adminMainService.soldOutLessonCount();
    	  model.addAttribute("soldOutLessonCount", soldOutLessonCount);
    	  
    	//주문현황
    	  //주문완료
    	  int orderCompleteCount=adminMainService.orderCompleteCount();
    	  model.addAttribute("orderCompleteCount", orderCompleteCount);
    	  //배송중
    	  int orderDuringShippingCount=adminMainService.orderDuringShippingCount();
    	  model.addAttribute("orderDuringShippingCount", orderDuringShippingCount);
    	  //배송완료
    	  int orderShippingCompleteCount=adminMainService.orderShippingCompleteCount();
    	  model.addAttribute("orderShippingCompleteCount", orderShippingCompleteCount);
    	  //주문취소
    	  int orderCancelCount=adminMainService.orderCancelCount();
    	  model.addAttribute("orderCancelCount", orderCancelCount);
    	  
    	//결제현황
    	  //결제완료
    	  int paymentCompleteCount=adminMainService.paymentCompleteCount();
    	  model.addAttribute("paymentCompleteCount", paymentCompleteCount);
    	  //환불진행
    	  int refundAcceptCount=adminMainService.refundAcceptCount();
    	  model.addAttribute("refundAcceptCount", refundAcceptCount);
    	  //환불완료
    	  int refundCompleteCount=adminMainService.refundCompleteCount();
    	  model.addAttribute("refundCompleteCount", refundCompleteCount);
    	  
    	//레슨접수현황
    	  //레슨신규접수  
    	  int newLessonAcceptCount=adminMainService.newLessonAcceptCount();
    	  model.addAttribute("newLessonAcceptCount", newLessonAcceptCount);
    	  //레슨심사중
    	  int newLessonEvaluationCount=adminMainService.newLessonEvaluationCount();
    	  model.addAttribute("newLessonEvaluationCount", newLessonEvaluationCount);
    	  //레슨수락
    	  int newLessonAcceptanceCount=adminMainService.newLessonAcceptanceCount();
    	  model.addAttribute("newLessonAcceptanceCount", newLessonAcceptanceCount);
    	  //레슨거절
    	  int newLessonRefuseCount=adminMainService.newLessonRefuseCount();
    	  model.addAttribute("newLessonRefuseCount", newLessonRefuseCount);
    	  
    	//시니어정산현황
    	  //정산대기
    	  int seniorCalculateWaitCount=adminMainService.seniorCalculateWaitCount();
    	  model.addAttribute("seniorCalculateWaitCount", seniorCalculateWaitCount);
    	  //정산가능
    	  int seniorCalculatePossibleCount=adminMainService.seniorCalculatePossibleCount();
    	  model.addAttribute("seniorCalculatePossibleCount", seniorCalculatePossibleCount);    	
    	  //정산완료
    	  int seniorCalculateCompleteCount=adminMainService.seniorCalculateCompleteCount();
    	  model.addAttribute("seniorCalculateCompleteCount", seniorCalculateCompleteCount);
    	  
    	//1:1문의현황
    	  //레슨문의
    	  int questionLessonCount=adminMainService.questionLessonCount();
    	  model.addAttribute("questionLessonCount", questionLessonCount);
    	  //시니어문의
    	  int questionSeniorCount=adminMainService.questionSeniorCount();
    	  model.addAttribute("questionSeniorCount", questionSeniorCount);
    	  //스토어문의
    	  int questionStoreCount=adminMainService.questionStoreCount();
    	  model.addAttribute("questionStoreCount", questionStoreCount);
    	  //주문문의
    	  int questionOrderCount=adminMainService.questionOrderCount();
    	  model.addAttribute("questionOrderCount", questionOrderCount);
    	  //기타문의
    	  int questionOtherCount=adminMainService.questionOtherCount();
    	  model.addAttribute("questionOtherCount", questionOtherCount);
    	  //답변대기
    	  int questionAnswerWaitCount=adminMainService.questionAnswerWaitCount();
    	  model.addAttribute("questionAnswerWaitCount", questionAnswerWaitCount);
    	  //답변완료
    	  int questionAnswerCompleteCount=adminMainService.questionAnswerCompleteCount();
    	  model.addAttribute("questionAnswerCompleteCount", questionAnswerCompleteCount);
    	  
    	//레슨카테고리
    	int lessonITCount=adminMainService.lessonITCount();
    	int lessonCookCount=adminMainService.lessonCookCount();
    	int lessonHandmadeCount=adminMainService.lessonHandmadeCount();
    	int lessonSportCount=adminMainService.lessonSportCount();
    	int lessonEducationCount=adminMainService.lessonEducationCount();
    	int lessonOtherCount=adminMainService.lessonOtherCount();
    	
    	model.addAttribute("lessonITCount", lessonITCount);
    	model.addAttribute("lessonCookCount", lessonCookCount);
    	model.addAttribute("lessonHandmadeCount", lessonHandmadeCount);
    	model.addAttribute("lessonSportCount", lessonSportCount);
    	model.addAttribute("lessonEducationCount", lessonEducationCount);
    	model.addAttribute("lessonOtherCount", lessonOtherCount);
    	
    	//상품카테고리
    	int productITCount=adminMainService.productITCount();
    	int productCookCount=adminMainService.productCookCount();
    	int productHandmadeCount=adminMainService.productHandmadeCount();
    	int productSportCount=adminMainService.productSportCount();
    	int productEducationCount=adminMainService.productEducationCount();
    	int productOtherCount=adminMainService.productOtherCount();
    	
    	model.addAttribute("productITCount", productITCount);
    	model.addAttribute("productCookCount", productCookCount);
    	model.addAttribute("productHandmadeCount", productHandmadeCount);
    	model.addAttribute("productSportCount", productSportCount);
    	model.addAttribute("productEducationCount", productEducationCount);
    	model.addAttribute("productOtherCount", productOtherCount);
    	
    	//연령대별 회원현황
    	int memberAge10Sum=adminMainService.memberAge10Sum();
    	int memberAge20Sum=adminMainService.memberAge20Sum();
    	int memberAge30Sum=adminMainService.memberAge30Sum();
    	int memberAge40Sum=adminMainService.memberAge40Sum();
    	int memberAge50Sum=adminMainService.memberAge50Sum();
    	int memberAge60Sum=adminMainService.memberAge60Sum();
    	int memberAge70PlusSum=adminMainService.memberAge70PlusSum();
    	
    	model.addAttribute("memberAge10Sum", memberAge10Sum);
    	model.addAttribute("memberAge20Sum", memberAge20Sum);
    	model.addAttribute("memberAge30Sum", memberAge30Sum);
    	model.addAttribute("memberAge40Sum", memberAge40Sum);
    	model.addAttribute("memberAge50Sum", memberAge50Sum);
    	model.addAttribute("memberAge60Sum", memberAge60Sum);
    	model.addAttribute("memberAge70PlusSum", memberAge70PlusSum);
    	
    	//매출통계(일별, 주별, 월별, 년별)
    	List<OrderListDTO> adMainStatSalesAllChart=adminMainService.adMainStatSalesAllChart(ymd);
    	model.addAttribute("adMainStatSalesAllChart", adMainStatSalesAllChart);
    	
    	return "hs_ad_main";
    }
    
    //AmChart
  	@RequestMapping(value = "/todaylessonadmin", method = RequestMethod.POST)
  	@ResponseBody
  	public List chartOutput()throws Exception {
  		
  		List<OrderListDTO> chartOutput = adminMainService.chartOutput();
  		ArrayList response = new ArrayList();
  		  for(int i =0; i < chartOutput.size(); i ++) {
  		    HashMap<String , Object> map = new HashMap<String, Object>();
  		    map.put("date", chartOutput.get(i).getRegYear()+"-"+chartOutput.get(i).getRegMonth()+"-"+chartOutput.get(i).getRegDay());
  		    map.put("output", chartOutput.get(i).getCostTotal());
  		    response.add(map);
  		    //(map);
  		    //(response);
  		  }
  		  //(response);
  		  return response;

  		}
    
    @RequestMapping("/todaylessonsenior")
    public String senior(Authentication authentication
                        ,Model model, HttpSession session) {
    	
    	//시큐리티 멤버아이디
    	UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
    	String member_id = userDetails.getUsername();
    	
    	SeniorDTO seniorPageInfo=seniorMainService.seniorPageInfo(member_id);
    	session.setAttribute("seniorPageInfo", seniorPageInfo);
    	
    	return "hs_sn_main"; 
    }
       

    @RequestMapping("/todaylessonmypage")
    public String usermypage(Authentication authentication
    		                ,Model model, HttpSession session) {
    	//시큐리티 멤버아이디
    	UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
    	String member_id = userDetails.getUsername();

    	//마이페이지 본인레벨 및 포인트 나타내기
    	MemberDTO myPageMyLevel_MyPoint=userMyPageService.myPageMyLevel_MyPoint(member_id);
    	session.setAttribute("myPageMyLevel_MyPoint", myPageMyLevel_MyPoint); //세션으로 처리하기..
    	
    	//마이페이지 수강중인 레슨
    	SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO myPageAttendLseeon=userMyPageService.myPageAttendLseeon(member_id);
    	session.setAttribute("myPageAttendLseeon", myPageAttendLseeon);
    	//마이페이지 프로필변경
    	
    	return "hs_us_mypage";
    }
    
    @RequestMapping("/todaylesson")
    public String all(Model model){
	    //신규레슨목록
    	List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> newlessonlist 
    	    =userMainService.newLessonList();
    	model.addAttribute("newlessonlist", newlessonlist);
    	
    	//베스트레슨목록
    	List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> bestlessonlist 
    	    =userMainService.BestLessonList();
    	model.addAttribute("bestlessonlist", bestlessonlist);
    	
    	//추천레슨목록
    	List<SQLjoin_Member_Senior_Lesson_OrderList_OrderDetail_CalculateDTO> referencelessonlist 
    	    =userMainService.referenceLessonList();
    	model.addAttribute("referencelessonlist", referencelessonlist);
    	
    	//신규스토어목록
    	List<ProductDTO> storenewproductlist=userMainService.StoreNewProductList(); 
    	model.addAttribute("storenewproductlist", storenewproductlist);
    	
    	//베스트스토어목록
    	List<ProductDTO> storeBestproductlist=userMainService.StoreBestProductList(); 
    	model.addAttribute("storeBestproductlist", storeBestproductlist);
    	
    	//이벤트슬라이더(BannerSlider)
    	List<BannerDTO> mainEventBannerSlider=userMainService.mainEventBannerSlider();
    	model.addAttribute("mainEventBannerSlider", mainEventBannerSlider);
    	 
    	//이미지 배너
    	BannerDTO mainIMGBannerSlider=userMainService.mainIMGBannerSlider();
    	model.addAttribute("mainIMGBannerSlider", mainIMGBannerSlider);
    	
    	//메인슬라이더
    	List<BannerDTO> mainBannerSlider=userMainService.mainBannerSlider();
    	model.addAttribute("mainBannerSlider", mainBannerSlider);
    	
    	//팝업정보 가져오기
    	PopUpDTO popup_dto1=popupService.popupinfo(1);
		model.addAttribute("popup_dto1",popup_dto1);
    	
    	return "hs_us_main";
    }
       
    //상품좋아요
  	@ResponseBody
  	@RequestMapping("/likejson")
  	public String likemain(@RequestParam(value="product_no") int product_no
  			,@RequestParam(value="member_id") String member_id)
  	{
  		//("productno:"+product_no+member_id);
  		MyLikeDTO likedto=new MyLikeDTO();
  		likedto.setMember_id(member_id);
  		likedto.setProduct_no(product_no);
  	
  		String result;
  		
  		List<MyLikeDTO> product_in_mylike = userStoreService.has_mylike_product(likedto);
  		userStoreService.updateproductlike(product_no);
  		
  		if (product_in_mylike.isEmpty()) {
  			userStoreService.insertmylike(likedto);
  			result="success"; 
  		} else {
  			result="false";
  		}
  		return result;
  		
  	}
  	//상품장바구니
  	@ResponseBody
  	@RequestMapping("/cartjson")
  	public String cartmain(@RequestParam(value="product_no") int product_no
  			,@RequestParam(value="member_id") String member_id)
  	{
  		//("cart임");
  		//("productno:"+product_no+member_id);
  		CartDTO cartdto=new CartDTO();
  		cartdto.setMember_id(member_id);
  		cartdto.setProduct_no(product_no);
  		
  		String result;
  		List<CartDTO> product_in_cart = userStoreService.has_cart_product(cartdto);
  		
  		if (product_in_cart.isEmpty()) {
  			cartdto.setCart_amount(1);
  			userStoreService.insertcart(cartdto);
  			result="success"; 
  		} else {
  			result="false";
  		}
  		return result;
  	}
  	
  	/* 권한없음 에러페이지 */   
  	@RequestMapping("/error")
       public String error()
       {
           return "/todaylesson_sec__error";
           }

       @RequestMapping("/todaylessonlogin")
       public String login( String error, String logout, Model model)
       {     
 	       //아이디비번 잘못입력시 에러.. 
    	  if (error !=null)
             model.addAttribute("error", "Please check your ID or Password");
             
          if(logout !=null)
             model.addAttribute("logout","logout");
          
          
          return "/TodayLesson_UserPage/hs_us_main_sec_login.us_main_section";
          //return "/TodayLesson_UserPage/hs_us_main_sec_login";
       }
      
       //kakao 로그인 창 url 정보넘기기
       @RequestMapping(value = "/kakaologinurl", method = RequestMethod.GET)
       public ModelAndView kakaoLoginURL(HttpSession session) {
    	   ModelAndView mv = new ModelAndView();
    	   
    	   //kakao login url 호출
    	   String kakaologin_URL = hs_kakaologinservice.getAuthorizationUrl(session);
    	   
    	   //생성한 인증 URL을 View(hs_us_main_sec_login.jsp)로 전달
    	   mv.setViewName("hs_us_main_sec_login");
    	   
    	   //카카오 로그인
    	   mv.addObject("kakaologin_URL", kakaologin_URL);
    	   
    	   return mv;
       }
       
       @RequestMapping(value = "/todaylessonkakaologin", produces = "application/json" ,
	                   method = {RequestMethod.GET, RequestMethod.POST})
       public ModelAndView KakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
    		                          HttpServletResponse response, HttpSession session) throws IOException{
    	   ModelAndView mv = new ModelAndView();
    	   
    	   //결과값을 node에 담아줌
    	   JsonNode node = hs_kakaologinservice.getAccessToken(code);
    	   //accessToken에 사용자가 로그인한 모든 정보가 들어있음
    	   JsonNode accessToken = node.get("access_token");
    	   
    	   //("Kakao_Code = " +code);
    	   //("Kakao_AccessToken = " + accessToken);
    	   
    	   //사용자 정보
    	   JsonNode KakaoUserInfo=hs_kakaologinservice.getKakaoUserInfo(accessToken);
    	      String kakao_email = null;
    	      String kakao_name = null;
    	      String kakao_gender = null;
    	      String kakao_birthday = null;
    	      String kakao_age = null;
    	   //유저정보 카카오에서 가져오기 Get properties
    	   JsonNode properties = KakaoUserInfo.path("properties"); 
    	   JsonNode kakao_account = KakaoUserInfo.path("kakao_account");
    	      kakao_email = kakao_account.path("email").asText(); 
 	          kakao_name = kakao_account.path("name").asText();
 	          kakao_gender = kakao_account.path("gender").asText();
 	          kakao_birthday = kakao_account.path("birthday").asText();
 	          kakao_age = kakao_account.path("age").asText();
 	          
 	          //("kakao_name = "+kakao_name);

 	       session.setAttribute("kakao_email", kakao_email);
 	       session.setAttribute("kakao_name", kakao_name);
 	       session.setAttribute("kakao_gender", kakao_gender);
 	       session.setAttribute("kakao_birthday", kakao_birthday);   
 	       session.setAttribute("kakao_age", kakao_age);
    	   
 	       //생성한 로그인정보를 View(hs_us_main_sec_login.jsp)로 전달
 	       mv.setViewName("todaylessonmypage");
 	       
    	   return mv;
       }
 
       //네이버로그인 

       @Autowired
       private void setNaverLoginBO(EJ_US_NaverLoginBOService naverLoginBO) {
           this.naverLoginBO = naverLoginBO;
       }

       //로그인 첫 화면 요청 메소드
       @RequestMapping(value = "todaylessonlogin", method = { RequestMethod.GET, RequestMethod.POST })
       public String naverlogin(Model model, HttpSession session) {

    
           
           /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
           String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
           
           //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
           //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
           ////("네이버:" + naverAuthUrl);
           
           //네이버 
           model.addAttribute("naverlogin_URL", naverAuthUrl);
           
           //구글
         //URL을 생성한다.
           String url = googleOAuth2Template.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
           //("/googleLogin, url : " + url);
           model.addAttribute("google_url", url);
           
          
           
           /* 생성한 인증 URL을 View로 전달 */
           return "/TodayLesson_UserPage/hs_us_main_sec_login.us_main_section";
       }

       //네이버 로그인 성공시 callback호출 메소드
       @RequestMapping(value = "navercallback", method = { RequestMethod.GET, RequestMethod.POST })
       public String naverlogincallback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
               throws IOException {
           //("여기는 callback");
           OAuth2AccessToken oauthToken;
           oauthToken = naverLoginBO.getAccessToken(session, code, state);
           //로그인 사용자 정보를 읽어온다.
           apiResult = naverLoginBO.getUserProfile(oauthToken);
           //(naverLoginBO.getUserProfile(oauthToken).toString());
           model.addAttribute("result", apiResult);
           //("result"+apiResult);
           /* 네이버 로그인 성공 페이지 View 호출 */
//         JSONObject jsonobj = jsonparse.stringToJson(apiResult, "response");
//         String snsId = jsonparse.JsonToString(jsonobj, "id");
//         String name = jsonparse.JsonToString(jsonobj, "name");
   //
//         UserVO vo = new UserVO();
//         vo.setUser_snsId(snsId);
//         vo.setUser_name(name);
   //
//         //(name);
//         try {
//             vo = service.naverLogin(vo);
//         } catch (Exception e) {
//             // TODO Auto-generated catch block
//             e.printStackTrace();
//         }


//         session.setAttribute("login",vo);
//         return new ModelAndView("user/loginPost", "result", vo);
           
           return "naverlogin/naversuccess";
       }

     //google 로그인   
       @RequestMapping(value = "/googleSignInCallback")
       public ModelAndView doSessionAssignActionPage(HttpServletRequest request,Model model) throws Exception {
    	   ModelAndView view = new ModelAndView();
           String code = request.getParameter("code");
           //(code);
           
           //RestTemplate을 사용하여 Access Token 및 profile을 요청한다.
           RestTemplate restTemplate = new RestTemplate();
           MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
           parameters.add("code", code);
           parameters.add("client_id", authInfo.getClientId());
           parameters.add("client_secret", authInfo.getClientSecret());
           parameters.add("redirect_uri", googleOAuth2Parameters.getRedirectUri());
           parameters.add("grant_type", "authorization_code");
    
           HttpHeaders headers = new HttpHeaders();
           headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
           HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String, String>>(parameters, headers);
           ResponseEntity<Map> responseEntity = restTemplate.exchange("https://www.googleapis.com/oauth2/v4/token", HttpMethod.POST, requestEntity, Map.class);
           Map<String, Object> responseMap = responseEntity.getBody();
    
           // id_token 라는 키에 사용자가 정보가 존재한다.
           // 받아온 결과는 JWT (Json Web Token) 형식으로 받아온다. 콤마 단위로 끊어서 첫 번째는 현 토큰에 대한 메타 정보, 두 번째는 우리가 필요한 내용이 존재한다.
           // 세번째 부분에는 위변조를 방지하기 위한 특정 알고리즘으로 암호화되어 사이닝에 사용한다.
           //Base 64로 인코딩 되어 있으므로 디코딩한다.
    
           String[] tokens = ((String)responseMap.get("id_token")).split("\\.");
           Base64 base64 = new Base64(true);
           String body = new String(base64.decode(tokens[1]));
           
           //("정보1"+tokens.length);
           //("정보2"+new String(Base64.decodeBase64(tokens[0]), "utf-8"));
           //("정보3"+new String(Base64.decodeBase64(tokens[1]), "utf-8"));
    
           //Jackson을 사용한 JSON을 자바 Map 형식으로 변환
           ObjectMapper mapper = new ObjectMapper();
           Map<String, String> result = mapper.readValue(body, Map.class);
           //("구글 이메일 : "+result.get("email"));
           //("구글 sub : "+result.get("sub"));
           
           if(todaylessonService.oauth2idcheck(result.get("email"))==0)
           {
           List<Member_AuthDTO> list=new ArrayList<>();
			MemberDTO dto=new MemberDTO();
			dto.setMember_id(result.get("email"));
			dto.setMember_pwd(result.get("sub"));
			 //auth를 list에 넣어서 dto에 셋팅
			 list.add(new Member_AuthDTO("ROLE_USER",dto.getMember_id()));
			 dto.setAuthList(list);
			 
			 todaylessonService.googleinsert(dto);

           }
           view.addObject("googleId",result.get("email"));
           view.addObject("googlePwd",result.get("sub"));
           view.setViewName("/TodayLesson_UserPage/hs_us_main_sec_login.us_main_section");
           
           return view;
    
       }
       
       //회원가입
       @RequestMapping("/todaylesson/join")
       public String join(HttpServletRequest request, Model model) throws Exception {	   
    	   
    	   /*은지 sms인증*/
           String api_key = "NCSRC0XSPD85BDRL"; //위에서 받은 api key를 추가
           String api_secret = "2LVQYEMQFBIBEG8WVXKQOWQ6KPDDVJQ9";  //위에서 받은 api secret를 추가

           com.todaylesson.Sms.Coolsms coolsms = new com.todaylesson.Sms.Coolsms(api_key, api_secret);
           //이 부분은 홈페이지에서 받은 자바파일을 추가한다음 그 클래스를 import해야 쓸 수 있는 클래스이다.

           HashMap<String, String> set = new HashMap<String, String>();
              set.put("from", "01026063254"); // 수신번호
              set.put("to", (String)request.getParameter("to")); // 발신번호, jsp에서 전송한 발신번호를 받아 map에 저장한다.
              set.put("text", (String)request.getParameter("text")); // 문자내용, jsp에서 전송한 문자내용을 받아 map에 저장한다.
              set.put("type", "sms"); // 문자 타입
              
              String text=(String)request.getParameter("text");
              model.addAttribute("to",(String)request.getParameter("to"));
              model.addAttribute("auth_num",text);
             
              //(set);

              JSONObject result = coolsms.send(set); // 보내기&전송결과받기

              if ((boolean)result.get("status") == true) {
                // 메시지 보내기 성공 및 전송결과 출력
                //("성공");
                //(result.get("group_id")); // 그룹아이디
                //(result.get("result_code")); // 결과코드
                //(result.get("result_message")); // 결과 메시지
                //(result.get("success_count")); // 메시지아이디
                //(result.get("에러메세지수: error_count")); // 여러개 보낼시 오류난 메시지 수
              } else {
                // 메시지 보내기 실패
                //("실패");
                //(result.get("code")); // REST API 에러코드
                //(result.get("message")); // 에러메시지
              }
           return "TodayLesson_UserPage/todaylesson_joinform.us_main_section";
       }
       
       @RequestMapping("/joinresult")
		 public String joinresult(@RequestParam("id") String member_id, @RequestParam("pwd") String member_pwd
				 				, @RequestParam("name") String member_name, @RequestParam("birth") String member_birth
				 				, @RequestParam("email") String member_email, @RequestParam("phone") String member_phone
				 				, @RequestParam("zipcode") int member_zipcode, @RequestParam("nick") String member_nick
	 				            , @RequestParam("addrselect") int addrselect, @RequestParam("roadaddr") String roadaddr
	 				            , @RequestParam("jibunaddr") String jibunaddr, @RequestParam("detailaddr") String detailaddr
				 				, MemberDTO dto,Model model){

			 dto.setMember_id(member_id);
			 dto.setMember_pwd(member_pwd);
			 dto.setMember_name(member_name);
			 dto.setMember_birth(member_birth);
			 dto.setMember_email(member_email);
			 dto.setMember_phone(member_phone);
			 dto.setMember_zipcode(member_zipcode);
			 dto.setMember_nick(member_nick);
			 
			//전체주소(도로or지번주소 + 상세주소) addr에 셋팅
			 String fulladdr= "";	
			 if(addrselect==0){
				 fulladdr=roadaddr;
			 }else{
				 fulladdr=jibunaddr;
			 }
			 
			 dto.setMember_addr(fulladdr+" "+detailaddr);
			 
			 List<Member_AuthDTO> list=new ArrayList<>();
			
			 //auth를 list에 넣어서 dto에 셋팅
			 list.add(new Member_AuthDTO("ROLE_USER",dto.getMember_id()));
			 dto.setAuthList(list);
			 
			 int result=todaylessonService.insert(dto);
			 model.addAttribute("result",result);
			 
			 return "TodayLesson_UserPage/yi_joinresult";
		 } 
       
       
       @RequestMapping("/findId")
       public String findId()
       {
          return "TodayLesson_UserPage/yi_find_id.us_main_section";
       }
       
       /*id중복 체크*/
       @ResponseBody 
       @RequestMapping(value="/idCheck", method= RequestMethod.POST)
       public int idCheck(@RequestParam("id") String member_id,Model model)
       {
           //(member_id);
           int row = loginService.idCheck(member_id);
           model.addAttribute("data",row);
           return row;
       }
       
       /*id 찾기*/
       @ResponseBody
       @RequestMapping(value = "/userSearch", method = RequestMethod.POST)
       public String userIdSearch(@RequestParam("inputName_1") String member_name, 
                                  @RequestParam("inputPhone_1") String member_phone) {
            HashMap<String,Object> map=new HashMap<>();
            //(member_name);
            //(member_phone);
            map.put("member_name", member_name);
            map.put("member_phone", member_phone);
            String result = loginService.get_searchId(map);
            
            //(result);

            return result;
       }
        
       //pwd 찾기
       @RequestMapping("/findPw")
       public String findPw()
       {
     		return "/TodayLesson_UserPage/hm_find_pwd.us_main_section";
       }

       @RequestMapping(value="/findPassword",method=RequestMethod.POST)
       public String findPassword(@RequestParam("inputId_2")String member_id,
                                  @RequestParam("inputEmail_2") String member_email
                                  ,HttpServletRequest request, Model model){
     		int result = mailSender.mailSendWithPassword(member_id, member_email, request);
     		//(member_email);
     		model.addAttribute("result",result);
     		return "/TodayLesson_UserPage/hm_us_search_pwd";
       }
       
       //popup
       @RequestMapping("/popupOpen")
    	public String popuptest(Model model)
    	{
    		PopUpDTO dto1=popupService.popupinfo(1);
    		model.addAttribute("dto1",dto1);
    		
    		return "/TodayLesson_UserPage/yi_popup";
    	}

}
