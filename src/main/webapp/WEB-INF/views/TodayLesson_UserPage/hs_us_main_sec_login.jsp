<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   --%>   
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- KAKAO LOGIN JS --> 
   <script type="text/javascript" src="resources/JS/hs_us_main_sec_login.js"></script>
   <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
   <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
   <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<!-- KAKAO LOGIN JS --> 

<!-- NAVER LOGIN JS --> 

<!-- NAVER LOGIN JS --> 

<!--  -->

<!--  -->

<!-- FaceBook LOGIN JS -->
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v6.0&appId=2903951876333746&autoLogAppEvents=1"></script>
<!-- FaceBook LOGIN JS -->

</head>
<body>

 <%--  <h1>Custom Login Page</h1>
  <h2><c:out value="${error}"/></h2>
  <h2><c:out value="${logout}"/></h2>

  <form method='post' action="/todaylesson">

  <div>
    <input type='text' name='username' placeholder="아이디 입력하시오">
  </div>
  <div>
    <input type='password' name='password' placeholder="비밀번호를 입력하시오">
  </div>

  <div>
    <input type='checkbox' name='remember-me'> Remember Me
  </div>

  <div>
    <input type='submit'>
  </div>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

  </form> --%>


  <div style="width: 50%; margin: auto; text-align: center;">
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
            <!-- 로그인 line  -->
            <div class=""></div>
           
               <div>
                  <!-- 카카오 -->
<<<<<<< HEAD
                     <a href="https://kauth.kakao.com/oauth/authorize
                              ?client_id=250c99d78fb89584382252365272f520
                              &redirect_uri=http://localhost:9080/todaylesson
                              &response_type=code"
                        id="kakao-login-btn"> 
                        <!-- <img alt="" src="resources/IMG/kakao_account_login_btn_medium_narrow.png"> -->
                     </a> 
=======
                    <!--  <a href="https://kauth.kakao.com/oauth/authorize
                              ?client_id=250c99d78fb89584382252365272f520
                              &redirect_uri=http://localhost:9080/todaylesson
                              &response_type=code"
                        id="kakao-login-btn"
                        
                        href="javascript:loginWithKakao()"
                        >
                     </a>    -->
                     <a id="custom-login-btn" href="https://kauth.kakao.com/oauth/authorize
                              ?client_id=250c99d78fb89584382252365272f520
                              &redirect_uri=http://localhost:9080/todaylesson
                              &response_type=code">   
                        <img alt="" src="resources/IMG/kakao_account_login_btn_medium_narrow.png">
                     </a> 
                   <!--   <script type="text/javascript">
                   //<![CDATA[
                     // 사용할 앱의 JavaScript 키를 설정해 주세요.
                     Kakao.init('9f3f9d25f7971214c15ec68bb10baddc');
                     function loginWithKakao() {
                       // 로그인 창을 띄웁니다.
                       Kakao.Auth.login({
                         success: function(authObj) {
                           alert(JSON.stringify(authObj));
                         },
                         fail: function(err) {
                           alert(JSON.stringify(err));
                         }
                       });
                     };
                   //]]> -->
                     
                     </script>
                      -->
>>>>>>> branch 'master' of https://github.com/Hahwasoo/TodayLesson.git

                  <!-- 카카오 -->
                  <!-- 네이버-->
                  <a href="">
                     <img width="222" style="height: 49px;" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
                  </a> 
                  <!-- 네이버-->
                  <!-- 구글 -->
                  <a>구글</a> 
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
         
      </form>
   </div>

</body>
</html>