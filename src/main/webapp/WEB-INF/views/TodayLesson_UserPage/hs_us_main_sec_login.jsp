<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- KAKAO LOGIN JS --> 
   <script type="text/javascript" src="${pageContext.request.contextPath}resources/JS/hs_us_main_sec_login.js?ver=1"></script>
   <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
   <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
   <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<!-- KAKAO LOGIN JS --> 

<!-- NAVER LOGIN JS --> 
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- NAVER LOGIN JS --> 

<!-- Google -->

<!-- Google -->

<!-- FaceBook LOGIN JS -->
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v6.0&appId=2903951876333746&autoLogAppEvents=1"></script>
<!-- FaceBook LOGIN JS -->

</head>
<body>
  <div style="width: 50%; margin: auto; text-align: center;" id="todaaylesson">
      <form method="post" action="/todaylesson">
         <div class="hs_us_mainheader_loginmodalform_div">
            <b>오늘의 레슨에 오신것을 환영합니다!</b>
            <br>
            <span>오늘의 레슨은 서로간의 재능을 연결해 모두의 경쟁력을 높이는 플랫폼 서비스입니다.</span>           
            <div>
               <%-- 
               <span><c:out value="${error}"/></span>
               <span><c:out value="${logout}"/></span> 
               --%>
               <label>ID</label>
               <input type='text' name='username' placeholder="아이디 입력하시오" required="required">
               <br>
               <label>PW</label>
               <input type='password' name='password' placeholder="비밀번호를 입력하시오" required="required">
               <br>
               <label>
               <input type='checkbox' name='remember-me'> Remember me
               </label>
               <br>
               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
               <input type="submit" value="로그인">
               <br>    
            </div>
          </div>
      </form>   
      <!-- 로그인 line  -->
      <div class="">
         <div>
            <!-- 카카오 -->
            <a href="${kakaologin_URL}"id="kakao-login-btn"></a> 
            <!-- 카카오 -->
            <!-- 네이버-->
            <!-- 네이버 로그인 화면으로 이동 시키는 URL -->
            <!-- 네이버 로그인 화면에서 ID, PW를 올바르게 입력하면 callback 메소드 실행 요청 -->
            <a href="${naverlogin_URL}">
               <img width="222" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
            </a>
            <!-- 네이버-->
            <!-- 구글 -->
            <a href="${google_url}">
               <img alt="구글" src="${pageContext.request.contextPath}resources/IMG/btn_google_signin_light_normal_web.png">
            </a> 
            <!-- 구글 -->
            <!-- 페이스북 -->
            <a href="" id="fb-root">
               <span class="fb-login-button" data-width="222" data-size="large" data-button-type="login_with" 
                                             data-layout="default" data-auto-logout-link="false" data-use-continue-as="false">
               </span>
            </a>
            <!-- 페이스북 -->  
         </div>
         <div class="hs_us_mainheader_findidpw">
            <a href="">아이디찾기</a><span>|</span><a href="">비밀번호찾기</a>
         </div>
           
         <div class="hs_us_mainheader_join">
            <span>
               <span>아직도 오늘의 레슨 회원이 아니신가요?</span><a href="">회원가입</a>
            </span> 
         </div>
      </div>
        
   </div>

</body>
</html>