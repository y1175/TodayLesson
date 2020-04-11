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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hs_us_main_header.css?ver=1">
<!--header style-->

</head>
<body>
   <div class="hs_us_main_header">
      <div class="hs_us_mainheader_topdiv">
         <div class="hs_us_mainheader_topdiv_width">
            <span>지금 당신의 취미를 찾아보세요</span>
            <span class="hs_us_mainheader_topdiv_cartloginsearchbox">
               <!-- 모든사람들이 다 -->
               <sec:authorize access="isAnonymous()">  
                  <a href="${pageContext.request.contextPath}/todaylessonlogin" class="hs_us_mainheader_login">로그인 </a>
                  <span style="margin-left: 10px;">|</span><a href="${pageContext.request.contextPath}/todaylesson/join">회원가입</a>
                  <a href=""><i class='fas fa-search'></i></a>
               </sec:authorize>
               <!-- 로그인한 사람들만  -->
               <sec:authorize access="hasAnyRole('ROLE_SENIOR','ROLE_USER')">
                  <form action="${pageContext.request.contextPath}/logout" method='post' id="logout-form">
                     <input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>  <!-- 이걸  main 페이지에 넣어서 구분을   -->
                     <a href="${pageContext.request.contextPath}/todaylessonmypage">마이페이지</a><span style="margin-left: 10px;">|</span><a href="#"onclick="document.getElementById('logout-form').submit();">로그아웃</a>    
                     <a href=""><i class='fas fa-search'></i></a>
                  </form>
               </sec:authorize>
               <sec:authorize access="hasRole('ROLE_ADMIN')">
                  <form action="${pageContext.request.contextPath}/logout" method='post' id="logout-form">
                     <input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>  <!-- 이걸  main 페이지에 넣어서 구분을   -->
                     <a href="${pageContext.request.contextPath}/todaylessonadmin">관리자페이지</a><span style="margin-left: 10px;">|</span><a href="#"onclick="document.getElementById('logout-form').submit();">로그아웃</a>
                     <a href=""><i class='fas fa-search'></i></a>
                  </form>   
               </sec:authorize>
            </span>
         </div>
      </div>
      <div class="row" style="width: 80%; margin: auto;">
         <div class="col-md-3" style="text-align: left;">
            <a href="">
               <!-- <button class="btn draw-border">시니어지원</button>   -->
            </a>
         </div>
         <div class="col-md-6" style="text-align: center;">
            <a href="${pageContext.request.contextPath}/todaylesson" class="hs_us_mainheader_centerLogo">
               <img src="${pageContext.request.contextPath}/resources/IMG/TodayLessonMainLogo2.png" alt="User_Logo3" style="width: 40%;">
            </a>
         </div>
         <div class="col-md-3" style="text-align: right;">
            <sec:authorize access="isAnonymous()">
               <button class="btn draw-border" onclick="window.open('${pageContext.request.contextPath}/todaylesson/senior_request_form','senior_form','width=570,height=253')" value="시니어 지원하기">시니어지원</button>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_USER')">
               <button class="btn draw-border" onclick="window.open('${pageContext.request.contextPath}/todaylesson/senior_request_form','senior_form','width=570,height=253')" value="시니어 지원하기">시니어지원</button>
            </sec:authorize> 
            <sec:authorize access="hasAnyRole('ROLE_SENIOR','ROLE_ADMIN')">
               <a href="${pageContext.request.contextPath}/todaylessonsenior" style="text-decoration:none;">
                  <button class="btn draw-border" value="시니어페이지">시니어페이지</button>
               </a>
            </sec:authorize> 
            <a href="${pageContext.request.contextPath}/todaylessonmypage/mycart/${pageContext.request.userPrincipal.name}" id="mycart">
               <button class="btn draw-border"><i class="fa fa-shopping-cart" style="margin-right: 5px;"></i>장바구니</button>
            </a>
         </div>
      </div>
      <div class="hs_us_mainheader_line"></div>
      <div class="hs_us_mainheader_navbox">
         <nav>
            <a href="${pageContext.request.contextPath}/todaylesson/hm_us_bird">얼리버드</a>
            <a href="${pageContext.request.contextPath}/todaylesson/total_lesson_list">전체레슨</a>
            <a href="${pageContext.request.contextPath}/todaylesson/freeboard">자유게시판</a>
            <a href="${pageContext.request.contextPath}/todaylesson/ej_store_main/0">스토어</a>
            <a href="${pageContext.request.contextPath}/todaylesson/hm_us_event">이벤트</a>
         </nav>
      </div>
      <div class="hs_us_mainheader_line"></div>
   </div>
   
</body>
</html>