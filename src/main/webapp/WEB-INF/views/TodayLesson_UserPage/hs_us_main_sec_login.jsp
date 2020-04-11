<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- KAKAO LOGIN JS --> 
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/JS/hs_us_main_sec_login.js?ver=1"></script>
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
<!-- <script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v6.0&appId=2903951876333746&autoLogAppEvents=1"></script> -->
<!-- FaceBook LOGIN JS -->

<!-- login style -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hs_us_main_sec_login.css?ver=2">
<!-- login style -->


</head>
<body>
   <div class="row" style="margin-top: 60px; color: rgb(53, 54, 58);">
      <div style="width: 35%; margin: auto; text-align: center;" id="todaaylesson">
         <h3 class="hs_us_logintitle">로그인</h3>
		    <div class="col-xs-12 col-sm-6">	
			   <form method="post" action="${pageContext.request.contextPath}/todaylesson">
			      <div class="input-group" style="margin-bottom: 10px; height: 48px;">
				     <span class="input-group-addon"><i class="fa fa-user" style="width: 2em;"></i></span>
					 <input type="text" class="form-control" name='username' placeholder="아이디" required="required" style="height: 48px;">
				  </div>
				  <div class="input-group" style="height: 48px;">
					 <span class="input-group-addon"><i class="fa fa-lock" style="width: 2em;"></i></span>
					 <input  type="password" class="form-control" name='password' placeholder="비밀번호" required="required" style="height: 48px;">
				  </div>
				  <div class="col-xs-12 col-sm-12" style="text-align: left; margin-left: 7px;">
				      <label class="checkbox">
					     <input type="checkbox" value="remember-me">Remember Me
				      </label>
			      </div>
			      <div class="col-xs-12 col-sm-12">
                     <span class="hs_login_error">${error}</span>
                  </div>
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  <input type="submit" class="hs_us_loginBtn" value="로그인">
			   </form>
			</div>
         <div class="col-xs-12 col-sm-1" style="width : 10px; height: 200px; margin-left:10px; border-left: 1px solid rgba(53, 54, 58, 0.3); padding: 0px;"></div>
            <!-- 로그인 line  -->
            <div class="col-xs-12 col-sm-5">
               <div>
               <!-- 카카오 -->
               <a href="${kakaologin_URL}"id="kakao-login-btn"></a> 
               <!-- 카카오 -->
               <!-- 네이버-->
               <!-- 네이버 로그인 화면으로 이동 시키는 URL -->
               <!-- 네이버 로그인 화면에서 ID, PW를 올바르게 입력하면 callback 메소드 실행 요청 -->
               <a href="${naverlogin_URL}" id="naver-login-btn">
                  <img width="222" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"  style="margin-top: 10px; margin-bottom: 10px;"/>
               </a>
               <!-- 네이버-->
               <!-- 구글 -->
               <form method="post" action="${pageContext.request.contextPath}/todaylesson">
                  <input type="hidden" name="username" value="${googleId }">
                  <input type="hidden" name="password" value="${googlePwd }">
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                     <c:if test="${googleId==null }">
                        <a href="${google_url}">
                           <img alt="구글" src="${pageContext.request.contextPath}/resources/IMG/btn_google_signin_light_normal_web.png" style="width: 222px; margin-top: 10px;">
                        </a> 
                     </c:if>
                     <c:if test="${googleId!=null }">
 				        <input type="image" name="submit" class="google-submit-btn"  style="width: 222px; margin-top: 10px;" src="${pageContext.request.contextPath}/resources/IMG/btn_google_signin_light_normal_web.png">                     
                     </c:if>
               </form>
               <!-- 구글 -->
            </div>
         </div>
         <div class="col-xs-12 col-sm-12">
            <div class="hs_us_mainheader_findidpw">
               <a href="${pageContext.request.contextPath}/findId">아이디찾기 </a><span>|</span><a href="${pageContext.request.contextPath}/findPw"> 비밀번호찾기</a>
            </div>
            <div class="hs_us_mainheader_join">
               <span>
                  <span>아직도 오늘의 레슨 회원이 아니신가요?</span><a href="${pageContext.request.contextPath}/todaylesson/join"> 회원가입</a>
               </span> 
            </div>
         </div>
        
      </div>
   </div>
  
</body>
</html>