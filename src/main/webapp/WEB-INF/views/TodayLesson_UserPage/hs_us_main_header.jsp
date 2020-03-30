<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!--header style-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hs_us_main_header.css?ver=2">
<!--header style-->

<!-- header javascript 
<script type="text/javascript" src="resources/JS/hs_us_main_header.js"></script>
header javascript -->

 
 <!-- BOOTSTRAP DEPENDENCIES 
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-theme.min.css">
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
 BOOTSTRAP DEPENDENCIES END-->



</head>
<body>
   <div>
      <div class="hs_us_mainheader_topdiv">
         <div class="hs_us_mainheader_topdiv_width">
            <span>지금 당신의 취미를 찾아보세요</span>
            <span class="hs_us_mainheader_topdiv_cartloginsearchbox">
               <!-- 모든사람들이 다 -->
               <sec:authorize access="isAnonymous()">  
                  <a href=""><i class="fa fa-ushopping-cart"></i></a>
                  <a href="/todaylessonlogin" class="hs_us_mainheader_login">로그인 </a>
                  <span style="margin-left: 10px;">|</span><a href="">회원가입</a>
               </sec:authorize>
               <!-- 로그인한 사람들만  -->
               <sec:authorize access="hasAnyRole('ROLE_SENIOR','ROLE_USER')">
                  <form action="${pageContext.request.contextPath}/logout" method='post' id="logout-form">
                     <a href=""><i class="fa fa-shopping-cart"></i></a>
                     <input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>  <!-- 이걸  main 페이지에 넣어서 구분을   -->
                     <a href="/todaylessonmypage">마이페이지</a><span style="margin-left: 10px;">|</span><a href="#"onclick="document.getElementById('logout-form').submit();">로그아웃</a>    
                  </form>
               </sec:authorize>
               <sec:authorize access="hasRole('ROLE_ADMIN')">
                  <form action="${pageContext.request.contextPath}/logout" method='post' id="logout-form">
                     <a href=""><i class="fa fa-shopping-cart"></i></a>
                     <input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>  <!-- 이걸  main 페이지에 넣어서 구분을   -->
                     <a href="/todaylessonadmin">관리자페이지</a><span style="margin-left: 10px;">|</span><a href="#"onclick="document.getElementById('logout-form').submit();">로그아웃</a>
                  </form>   
               </sec:authorize>
               <a href=""><i class='fas fa-search'></i></a>
            </span>
         </div>
      </div>
      <!-- 로그인 modal   data-toggle="modal" data-target="#hs_LoginModal"  -->
     <!--  <div class="modal fade" id="hs_LoginModal" tabindex="-1" role="dialog" aria-labelledby="hs_senior_AccountModal_title" aria-hidden="true">
         <div class="modal-dialog" role="document">
            <div class="modal-content">
               <div class="modal-body" style="padding: 12px 16px 16px; color: rgb(53, 54, 58);">
                      
               </div>
            </div>
         </div>
      </div>   -->          
      <!-- 로그인 modal -->
       
       
                  
      <div class="hs_us_mainheader_center">
         <a href="/alluser">
            <img src="${pageContext.request.contextPath}/resources/IMG/User_Logo.png" alt="User_Logo" style="width: 12%;">
         </a>
         <span class="hs_us_mainheader_center_senior">
            <a href="">
               <button id="senior_request" 
                       onclick="window.open('${pageContext.request.contextPath}/senior_request_form/${pageContext.request.userPrincipal.name}','senior_form','width=570,height=420')" 
                       value="시니어 지원하기">
                             시니어지원 🌴
               </button>
            </a>
         </span>
      </div>
      <div class="hs_us_mainheader_line"></div>
      <div class="hs_us_mainheader_navbox">
         <nav>
            <a href="">얼리버드</a>
            <a href="">전체레슨</a>
            <a href="">자유게시판</a>
            <a href="">스토어</a>
            <a href="">이벤트</a>
         </nav>
      </div>
      <div class="hs_us_mainheader_line"></div>
   </div>
   
</body>
</html>