package com.todaylesson.csrf;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.web.util.matcher.RequestMatcher;

import com.todaylesson.DTO.MemberDTO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

//새로추가한거
import java.util.regex.Pattern;
import org.springframework.stereotype.Component;
import org.springframework.security.web.util.matcher.RegexRequestMatcher;
/**

 * IfpCsrfRequestMatcher.java

 * - 요청에 대해 스프링 시큐리티에서 CSRF를 적용할건지 아닐건지 판단

 * 

 * ################ Spring Security CSRF Protection 설정 ##################

 * [CsrfTokenAdder.java, 서블릿필터] ###"응답에 태그 삽입"###

 * - Spring Security4 이상은 CSRF Enabled가 기본설정

 * - HttpServletRequest(일반  JSP요청), XMLHttpRequest(AJAX) 요청이든 응답에 Csrf 히든테그 삽입

 * - CSRF Protection을 위한 Text/Html 응답에 히든태그 Xsrf Token 삽입

 * - AJAX JSON응답(콤보 채우기등)은 히든태그 Csrf Token 삽입할 필요없다.

 * 

 * [security-config.xaml]

 * - 애당초 Spring Security 적용이 필요없는 부분에 대한 정의(/resources, /images 등)

 * - RequestMatcher에 대한 정의(스프링 시큐리티에서 요청에 대해 CSRF를 적용할건지 아닐건지 판단)

 * - AccessDeniedHandler에 대한 정의(403 에러발생시 대응)

 * 

 * [IfpCsrfRequestMatcher.java] ###"요청에 따라 CSRF 적용여부 결정"###

 * - 스프링 시큐리티에서 CSRF를 적용할건지 아닐건지 판단

 * - AJAX CALL, 첫화면, 최측메뉴로딩, 팝업로등 요청은 CSRF 적용하지 않음

 * - (TEXT/HTML을 응답으로 보낸는 부분은 CsrfTokenAdder 필터에서 Csrf 히든태그 삽입함)

 * - 403 Forbidden 에러가 발생하는 부분이 있다면 이곳에서 추가할 것

 * 

 * [IfpAccessDeniedHandler.java]

 * - 403 Forbidden 에러 발생하는 경우 처리하는 핸들러

 * ######################################################################


 */

@Component  //새로 추가한거
public class IfpCsrfRequestMatcher implements RequestMatcher {
   

  final Log logger = LogFactory.getLog( IfpAccessDeniedHandler.class );
  
      private Pattern allowedMethods = Pattern.compile("^(GET|HEAD|TRACE|OPTIONS)$"); //새로 추가한거

      private RegexRequestMatcher unprotectedMatcher = new RegexRequestMatcher("/unprotected", null); //새로 추가한거
      
     
   

    @Override

    public boolean matches(HttpServletRequest request) {

       

       String strUrl = request.getRequestURL().toString();

       String strUri = request.getRequestURI();

       String queryString = request.getQueryString() == null ? "" : request.getQueryString();

       String contentType = request.getContentType() == null ? "" : request.getContentType();
       
 

       //---------------------------------------------------------

       // CSRF 필터링, 필요시 추가 하세요. 여기에 추가안하시면 403 오류 발생!

       //---------------------------------------------------------

       // AJAX CALL

        if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With")))                                                      

                                                      return false;
  //화수
     // 첫화면
        else if ("/".equals(strUri))                   return false;        
     // 첫화면
        else if ("/todaylesson".equals(strUri))                   return false;
     //관리자화면
        else if ("/todaylessonadmin".equals(strUri))                   return false;  
     //시니어화면
        else if ("/todaylessonsenior".equals(strUri))                   return false;   
     //마이페이지
        else if ("/todaylessonmypage".equals(strUri))                   return false; 
     //로그인
        else if ("/todaylessonlogin".equals(strUri))                   return false;
     //카카오로그인
        else if ("/kakaologinurl".equals(strUri))                   return false;
        else if ("/todaylessonkakaologin".equals(strUri))                   return false;
     //로그아웃
        else if ("/logout".equals(strUri))                   return false;
        
      
 
        
        
  //용인
      //TodayLessonController
      //회원가입
        else if ("/join".equals(strUri))                   return false;
      //아이디찾기
        else if ("/findId".equals(strUri))                   return false;
      //회원가입결과
        /*else if ("/joinresult".equals(strUri))                   return false;*/
      //id찾기
        else if ("/userSearch".equals(strUri))                   return false;
      //User_YI_FreeBoard_Controller
      //자유게시판
        else if ("/todaylesson/freeboard".equals(strUri))                   return false;
      //게시글상세보기
        else if ("/todaylesson/freeboard_detail/{freeboard_no}".equals(strUri))                   return false;   
      //리플달기 json
        else if ("/todaylesson/freeboard_detailjson/{freeboard_no}".equals(strUri))    return false;
       //리플달기 
        else if ("/todaylesson/insert_boardreply/".equals(strUri))    return false;
        //자유게시판 글쓰기
        else if ("/todaylesson/freboard_insert/".equals(strUri))    return false;
        //자유게시판 글 수정하기
        else if ("/todaylesson/freeboard_modify/{freeboard_no}".equals(strUri))   return false;
        
   //혜미
      //혜미비번찾기 
        else if ("/findPw".equals(strUri))                   
            return false; 
      //혜미 이메일 & 아이디 값 받아서 임시 비밀번호 전송
        else if("/findPassword".equals(strUri))
             return false;
     //혜미 내 정보관리 페이지로 가기-필요없
        else if("/todaylessonmypage/hm_us_mymanage".equals(strUri))
             return false;
     //혜미 내 정보 관리 1차 비밀번호 인증받기
        else if("/todaylessonmypage/hm_us_mymanage2".equals(strUri))
             return false; 
     //혜미 내 정보 수정 완료 될 시 가는 페이지
        else if("/todaylessonmypage/hm_us_mymanageupdate".equals(strUri))
           return false;
        //혜미 관리자 회원관리 페이지
        else if("/todaylessonadmin/admin_hm_memmanage".equals(strUri))
           return false;
        //혜미 관리자 레벨 수정 페이지
        else if("/todaylessonadmin/adminmember_levelupdate".equals(strUri))
           return false;
        //혜미 관리자 회원 디테일
        else if("/todaylessonadmin/hm_memmanagedetail".equals(strUri))
           return false;
        //혜미 사용자 1:1문의 페이지로 이동-필요없
        else if("/todaylessonmypage/hm_us_question".equals(strUri))
           return false;
        //혜미 사용자 1:1문의 등록 페이지로 이동-필요없
        else if("/todaylessonmypage/hm_question_insert".equals(strUri))
           return false;
        //혜미 1:1문의 등록
        else if("/todaylessonmypage/hm_question_create".equals(strUri))
         return false;
        //혜미 관리자 1:1문의 관리페이지 이동 -필요없
        else if("/todaylessonmyadmin/todaylessonadmin/hm_ad_question".equals(strUri))
           return false;
        //혜미 회원정보수정 updatesms
        else if("/todaylessonmypage/hm_us_mymanageupdatesms".equals(strUri))
           return false;
        //혜미 이벤트 페이지로 이동-필요없
        else if("/todaylessonadmin/hm_ad_event_manage".equals(strUri))
           return false;
        //혜미 이벤트 insert
        else if("/todaylessonadmin/hm_ad_event_insert".equals(strUri))
           return false;
        //혜미 이벤트 insertresult이동 - 이거 필요없는데... 나중에 다 삭제함
        else if("/todaylessonadmin/hm_ad_event_insertresult".equals(strUri))
        	return false;
        //혜미 이벤트 수정폼
        else if("/todaylessonadmin/hm_ad_event_modify".equals(strUri))
        	return false;
        //혜미 사용자 이벤트
        else if("/todaylesson/hm_us_event".equals(strUri))
        	return false;
        //혜미 사용자 1:1문의 디테일 페이지 이동
      /*  else if("/todaylessonadmin/hm_us_question_detail/{no}".equals(strUri))
           return false;*/
        //혜미 관리자 1:1문의 디테일 페이지 이동
        /*else if("/todaylessonadmin/hm_ad_question_detail".equals(strUri))
           return false;*/

        //혜미 관리자 1:1문의  관리자 답변달기
       /* else if("/todaylessonadmin/hm_ad_question_update".equals(strUri))
           return false;*/

   //은지
        //은지 관리자 상품조회
        else if ("/todaylessonadmin/ej_ad_product_productlist".equals(strUri))                   
           return false; 
        //은지 관리자 상품디테일
        else if ("/todaylessonadmin/ej_ad_product_productdetail".equals(strUri))                   
              return false; 
        //은지 관리자 상품등록
        else if ("/todaylessonadmin/ej_ad_product_productregister".equals(strUri))                   
           return false; 
        //은지 관리자 상품등록시 나오는 창(추가성공/실패)
        else if ("/todaylessonadmin/ej_ad_product_insertresult".equals(strUri))                   
            return false; 
        //은지 관리자 상품 수정
        else if("/todaylessonadmin/ad_product_update".equals(strUri))
            return false;
      //은지 관리자 상품 수정결과
        else if("/todaylessonadmin/ad_product_update_result".equals(strUri))
            return false;
        //은지 관리자 상품 삭제
        else if("/todaylessonadmin/ad_product_delete".equals(strUri))
            return false;
       //후기리스트 
        else if("/todaylessonadmin/ad_product_reviewlist".equals(strUri))
            return false;
        //후기디테일
        else if("/todaylessonadmin/ad_product_reviewdetail".equals(strUri))
            return false;
        //후기 삭제
        else if("/todaylessonadmin/ad_product_reviewdelete".equals(strUri))
            return false;
        
        
        //사용자 페이지들
        //은지 스토어 디테일
        else if ("/todaylesson/ej_store_detail".equals(strUri))                   
            return false; 
        //은지스토어 메인
        else if ("/todaylesson/ej_store_main".equals(strUri))                   
            return false; 
        //은지 주문폼
        else if ("/todaylesson/ej_us_orderform".equals(strUri))                   
           return false; 
      //은지 주문내역상세
        else if ("/todaylesson/orderlistdetail".equals(strUri))                   
           return false; 
        
        //마이페이지 
      //은지 좋아요
        else if ("/todaylessonmypage/mylike".equals(strUri))                   
           return false; 
      //은지 장바구니
        else if ("/todaylessonmypage/mycart".equals(strUri))                   
           return false; 
        
      //은지 장바구니에서 주문할때
        else if ("/todaylessonmypage/order_cart".equals(strUri))                   
           return false; 
      
        
        
    

   //진영
     
        //진영주소팝업
        else if ("/jusoPopup".equals(strUri))    
            return false;   
     
        //진영 레슨 리스트 
        /*else if (strUri.equals("/lesson_list/{member_id}"))    
             return false; */
        
        //레슨 작성
        /*else if (strUri.equals("/lesson_write/{member_id}"))    
              return false;*/
        
        //레슨 insert결과
        else if ("/todaylessonsenior/insert_result".equals(strUri))    
              return false;  
        
        //레슨 디테일
        /*else if (strUri.equals("/lesson_detail/{member_id}"))    
              return false;*/
        
      //레슨일 여러개 선택
        else if ("/multiple_time_lesson_date".equals(strUri))    
              return false; 
        
        //시니어 지원 버튼
        else if ("/senior_request".equals(strUri))    
              return false;
        
        //시니어 지원 팝업
        /*else if (strUri.equals("senior_request_form/{member_id}"))    
              return false; */
        
        //시니어 지원 폼(시니어 닉, 이런거 쓰는곳)
        /* else if ("/senior_switch/{member_id}".equals(strUri))    
              return false;*/
        
        // 이미 시니어일 때
        else if ("/todaylessonsenior/you_are_senior".equals(strUri))    
              return false;
        
        // 시니어 지원폼 쓴 다음 넘어가는 곳
        else if ("/todaylessonsenior/plus_senior".equals(strUri))    
              return false;
        
        // 레슨 작성 완료
        else if ("/todaylessonsenior/insert_result".equals(strUri))    
              return false;
       
        // 전체 레슨 조회
        else if ("/todaylessonadmin/alllesson".equals(strUri))    
              return false; 
        
        // 신청 완료에서 심사중으로 넘기는 페이지
        else if ("/todaylessonadmin/apply_lesson".equals(strUri))    
              return false; 
        
        // 레슨을 심사중으로 넘기기
        else if ("/todaylessonadmin/admin_apply_exam".equals(strUri))    
              return false;
        
        // 심사 필요한 레슨 조회
        else if ("/todaylessonadmin/wait_lesson".equals(strUri))    
              return false; 
        
        // 승인해줘야하는 레슨 디테일
        /* else if ("/admin_wait_lesson_detail/{lesson_no}".equals(strUri))    
          return false;*/
        
        // 레슨 디테일
        /* else if ("/admin_lesson_detail/{lesson_no}".equals(strUri))    
          return false;*/
        
        // 레슨 심사 팝업
        /* else if ("/lesson_result_update/{lesson_no}".equals(strUri))    
          return false;*/
        
        // 레슨 수락
        /* else if ("/lesson_approve/{lesson_no}".equals(strUri))    
          return false;*/
        
        // 레슨 거절
        /* else if ("/lesson_reject/{lesson_no}".equals(strUri))    
          return false;*/
        
        // 관리자 시니어 관리
        else if ("/todaylessonadmin/all_senior".equals(strUri))    
              return false; 
       
        //레슨 수정
        /* else if ("/lesson_update/{lesson_no}".equals(strUri))    
          return false;*/
          
        //레슨 업데이트 결과
        else if ("/todaylessonsenior/lesson_update_result".equals(strUri))    
              return false; 
        
        //레슨 삭제
        /* else if ("/lesson_delete/{lesson_no}".equals(strUri))    
          return false;*/
        
        //레슨 삭제 결과
        else if ("/todaylessonsenior/lesson_delete_result".equals(strUri))    
              return false; 
        
        //레슨 디테일 추가 결과
        else if ("/todaylessonsenior/mal_lesson_upload_result".equals(strUri))    
              return false; 
        
        //레슨 디테일 수정 결과
        else if ("/todaylessonsenior/mal_lesson_update_result".equals(strUri))    
       	 	return false; 

        else if ("/todaylessonsenior/update_senior_result".equals(strUri))    
       	 	return false; 
        
        //결제 완료
        else if("/orderlist_detail".equals(strUri))
        	return false;
        
        else if("/update_lesson_comp".equals(strUri))
        	return false;
        
        
       else if(allowedMethods.matcher(request.getMethod()).matches()){  //새로 추가한거

            return false;   //새로 추가한거

        }
        
        
        

        else {

           logger.info("###################################### request.getRequestURL() :: " + strUrl);

           logger.info("###################################### request.getRequestURI() :: " + strUri);

           logger.info("###################################### request.getQueryString() :: " + queryString);

           logger.info("###################################### request.getContentType() :: " + contentType);           

        }

       // return true;
        
        //시큐리티 권한 해제에 대한 권한을 준거임(에이작까지 처리되는지는 아직 확인 못함.. 두개 합친거라서 따로따로 분리해서 확인필요함)
        return !unprotectedMatcher.matches(request);   //새로 추가한거
      
    }
}