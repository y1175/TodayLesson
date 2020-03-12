package com.todaylesson.oreo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.DTO.Member_AuthDTO;
import com.todaylesson.service.Hm_Us_MailSendService;
import com.todaylesson.service.LoginService;
import com.todaylesson.service.EJ_US_NaverLoginBOService;
import com.todaylesson.service.TodaylessonService;
import com.todaylesson.service.User_HS_KakaoLoginService;



//MainPage(User, Senior, Admin, Login, Logout , Join, FindId, FindPw) -> 유저 홈에 있는것들
@Controller
public class TodayLessonController {
   
	 /* NaverLoginBO */
    private EJ_US_NaverLoginBOService naverLoginBO;
    private String apiResult = null;
    
   @Resource(name="todaylessonService")
   private TodaylessonService todaylessonService;
   
   @Resource(name="kakaologinservice")
   private User_HS_KakaoLoginService hs_kakaologinservice;
   
   @Resource(name="loginService")
   private LoginService loginService;
   
   @Autowired
   private Hm_Us_MailSendService mailSender;
   
   @RequestMapping("/todaylessonadmin")
   public String admin() { 
	   return "hs_ad_main";
   }
    
   @RequestMapping("/todaylessonsenior")
   public String senior() {
       return "hs_sn_main"; 
   }
       
   @RequestMapping("/todaylessonmember")
   public String member(){
      return "hs_us_mypage";
   } 
    
   @RequestMapping("/todaylessonmypage")
   public String usermypage() {
	   return "hs_us_mypage";
   }
   
   @RequestMapping("/todaylesson")
   public String all(){
      return "hs_us_main";
   }
          
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
    	   
    	   System.out.println("Kakao_Code = " +code);
    	   System.out.println("Kakao_AccessToken = " + accessToken);
    	   
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
 	          
 	          System.out.println("kakao_name = "+kakao_name);

 	       session.setAttribute("kakao_email", kakao_email);
 	       session.setAttribute("kakao_name", kakao_name);
 	       session.setAttribute("kakao_gender", kakao_gender);
 	       session.setAttribute("kakao_birthday", kakao_birthday);   
 	       session.setAttribute("kakao_age", kakao_age);
    	   
 	       //생성한 로그인정보를 View(hs_us_main_sec_login.jsp)로 전달
 	       mv.setViewName("hs_us_main_sec_login");
 	       
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
           System.out.println("네이버:" + naverAuthUrl);
           
           //네이버 
           model.addAttribute("naverlogin_URL", naverAuthUrl);

           /* 생성한 인증 URL을 View로 전달 */
           return "/TodayLesson_UserPage/hs_us_main_sec_login.us_main_section";
       }

       //네이버 로그인 성공시 callback호출 메소드
       @RequestMapping(value = "navercallback", method = { RequestMethod.GET, RequestMethod.POST })
       public String naverlogincallback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
               throws IOException {
           System.out.println("여기는 callback");
           OAuth2AccessToken oauthToken;
           oauthToken = naverLoginBO.getAccessToken(session, code, state);
           //로그인 사용자 정보를 읽어온다.
           apiResult = naverLoginBO.getUserProfile(oauthToken);
           System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
           model.addAttribute("result", apiResult);
           System.out.println("result"+apiResult);
           /* 네이버 로그인 성공 페이지 View 호출 */
//         JSONObject jsonobj = jsonparse.stringToJson(apiResult, "response");
//         String snsId = jsonparse.JsonToString(jsonobj, "id");
//         String name = jsonparse.JsonToString(jsonobj, "name");
   //
//         UserVO vo = new UserVO();
//         vo.setUser_snsId(snsId);
//         vo.setUser_name(name);
   //
//         System.out.println(name);
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
       //
       
       @RequestMapping("/logout")
       public String logout() {
    	   return "redirect:/todaylessonlogin";
       }	   
    		   
    		   
       @RequestMapping("/join")
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
             
              System.out.println(set);

              JSONObject result = coolsms.send(set); // 보내기&전송결과받기

              if ((boolean)result.get("status") == true) {

                // 메시지 보내기 성공 및 전송결과 출력
                System.out.println("성공");
                System.out.println(result.get("group_id")); // 그룹아이디
                System.out.println(result.get("result_code")); // 결과코드
                System.out.println(result.get("result_message")); // 결과 메시지
                System.out.println(result.get("success_count")); // 메시지아이디
                System.out.println(result.get("에러메세지수: error_count")); // 여러개 보낼시 오류난 메시지 수
              } else {

                // 메시지 보내기 실패
                System.out.println("실패");
                System.out.println(result.get("code")); // REST API 에러코드
                System.out.println(result.get("message")); // 에러메시지
              }
           return "TodayLesson_UserPage/todaylesson_joinform";
       }
       
       @RequestMapping("/joinresult")
		 public String joinresult(@RequestParam("id") String member_id
				 				, @RequestParam("pwd") String member_pwd
				 				, @RequestParam("name") String member_name
				 				, @RequestParam("birth") String member_birth
				 				, @RequestParam("email") String member_email
				 				, @RequestParam("phone") String member_phone
				 				, @RequestParam("zipcode") int member_zipcode
				 				, @RequestParam("nick") String member_nick
				
	 				, @RequestParam("addrselect") int addrselect
	 				,@RequestParam("roadaddr") String roadaddr
	 				,@RequestParam("jibunaddr") String jibunaddr
	 				, @RequestParam("detailaddr") String detailaddr
				 				,  MemberDTO dto,Model model)
		 {

			 
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
			 if(addrselect==0)
					{fulladdr=roadaddr;}
					else
					{fulladdr=jibunaddr;}
			 
			 
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
          return "TodayLesson_UserPage/yi_find_id";
       }
       
       /*id중복 체크*/
         @ResponseBody 
          @RequestMapping(value="/idCheck", method= RequestMethod.POST)
          public int idCheck(@RequestParam("id") String member_id,Model model)
          {
              System.out.println(member_id);
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
            System.out.println(member_name);
            System.out.println(member_phone);
            map.put("member_name", member_name);
            map.put("member_phone", member_phone);
            String result = loginService.get_searchId(map);
            
            System.out.println(result);

            return result;
         }
  
         //pwd 찾기
         @RequestMapping("/findPw")
     	public String findPw()
     	{
     		
     		return "/TodayLesson_UserPage/hm_find_pwd";
     	}

     	
     	@RequestMapping(value="/findPassword",method=RequestMethod.POST)
     	@ResponseBody
     	public String findPassword(@RequestParam("inputId_2")String member_id,
                 @RequestParam("inputEmail_2") String member_email
                 ,HttpServletRequest request
                 ,Model model){
     		
     		int result = mailSender.mailSendWithPassword(member_id, member_email, request);
     		System.out.println(member_email);
     		model.addAttribute("result",result);
     		
     		return "/TodayLesson_UserPage/hm_us_search_pwd";
     	}
/*         pwd 찾기
         @RequestMapping(value="/searchPassword",method=RequestMethod.POST)
         @ResponseBody
         public String passwordSearch(@RequestParam("inputId_2")String member_id,
               @RequestParam("inputEmail_2") String member_email
               ,HttpServletRequest request) {
            mailSender.mailSendWithPassword(member_id,member_email,request);
            System.out.println(member_email);
            return "/userSearchPassword";
  
         }
         */

}
