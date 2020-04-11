<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--mypage nav style-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hs_us_mypage_nav.css?ver=4">
<!--mypage nav style-->
<script type="text/javascript">
function member_level_1() {
	alert('주니어는 접근하실 수 없습니다.');
	location.href="${pageContext.request.contextPath}/todaylessonmypage";
}
</script>

</head>
<body>
   <div class="hs_us_mypage_box">
      <div class="row">
         <div class="col-md-5">
            <div class="hs_us_mypage_imgbox">
	             <c:choose>
                     <c:when test="${myPageMyLevel_MyPoint.member_level == 1}">
	           <img alt="user" src="${pageContext.request.contextPath}/resources/IMG/user.svg" class="hs_us_mypage_img">
	           </c:when>
	            <c:when test="${myPageMyLevel_MyPoint.member_level == 2}">
	           <img alt="user" src="${pageContext.request.contextPath}/resources/IMG/senior.svg" class="hs_us_mypage_img">
	           </c:when>
	           </c:choose>
			</div>
			<div class="hs_us_mypage_nickbox">
			   <%-- <b class="hs_us_mypage_nick">${pageContext.request.userPrincipal.name}님</b> --%>
			   <b class="hs_us_mypage_nick">${myPageMyLevel_MyPoint.member_nick}님</b>
			  <!--  <input type="file" id="member_img" name="file"> -->
            </div>
         </div>
         <div class="col-md-7" style="text-align: center;">   
            <div class="col-sm-4" style="display: inline-block; border-right: 1px solid rgba(53, 54, 58, 0.1); position: relative; top: 35px;">
               <p class="hs_us_mypage_myLevelLessonPoint_title">회원등급</p>
               <p class="hs_us_mypage_myLevelLessonPoint_content">
                  <c:choose>
                     <c:when test="${myPageMyLevel_MyPoint.member_level == 0}">
                        <c:out value="관리자"></c:out>
                     </c:when>
                     <c:when test="${myPageMyLevel_MyPoint.member_level == 1}">
                        <c:out value="주니어"></c:out>
                     </c:when>
                     <c:when test="${myPageMyLevel_MyPoint.member_level == 2}">
                        <c:out value="시니어"></c:out>
                     </c:when>
                  </c:choose>
               </p> <!-- 회원등급 가져오기 -->
            </div>
            <div class="col-sm-4" style="display: inline-block; border-right: 1px solid rgba(53, 54, 58, 0.1); position: relative; top: 35px;">
               <p class="hs_us_mypage_myLevelLessonPoint_title">수강중인 레슨</p>
               <p class="hs_us_mypage_myLevelLessonPoint_content">
                  <c:out value="${myPageAttendLseeon.mypagelessoncount}"/>개
               </p> <!-- 수강중인 레슨 수 가져오기 -->
            </div>
            <div class="col-sm-4" style="display: inline-block; position: relative; top: 35px;">
               <p class="hs_us_mypage_myLevelLessonPoint_title">적립금</p>
               <p class="hs_us_mypage_myLevelLessonPoint_content">
                  <fmt:formatNumber value="${myPageMyLevel_MyPoint.member_point}" type="number" maxFractionDigits="3"/>원
               </p> <!-- 적립금 가져오기 -->
            </div>
         </div>
      </div>
      <div class="hs_us_mypage_navdiv">
         <nav class="hs_us_mypage_nav">
            <ul>
               <li class="hs_us_mypage_mymanage">
                  <a href="${pageContext.request.contextPath}/todaylessonmypage/hm_us_mymanage">내 정보관리</a>
               </li>
               <li class="hs_us_mypage_myorderlist">
                  <a href="${pageContext.request.contextPath}/todaylessonmypage/user_myorderlist">주문내역</a>
               </li>
               <li class="hs_us_mypage_mylesson">
                  <a href="${pageContext.request.contextPath}/todaylessonmypage/my_lesson_list">나의 레슨</a>
               </li>
               <li class="hs_us_mypage_mylessonadmin">
               <c:choose>
                     <c:when test="${myPageMyLevel_MyPoint.member_level==1}">
                        <a href="#" onclick="window.open('${pageContext.request.contextPath}/todaylesson/senior_request_form','senior_form','width=570,height=253'); return false" value="시니어 지원하기">나의 레슨관리</a>
                     </c:when>
                     <c:when test="${myPageMyLevel_MyPoint.member_level==2}">
                        <a href="${pageContext.request.contextPath}/todaylessonsenior/my_approve_lesson">나의 레슨관리</a>
                     </c:when>
                  </c:choose>
               </li>
               <li class="hs_us_mypage_my1_1question">
                  <a href="${pageContext.request.contextPath}/todaylessonmypage/hm_us_question">1:1 문의</a>
               </li>
               <li style="float: right; width: 200px; background-color: rgb(224, 62, 82);  text-align: center; ">
                  <a href="/todaylessonmypage/mylike/${pageContext.request.userPrincipal.name}" style="color: white;">
                     <i class='fas fa-heart'></i> 좋아요
                  </a>
               </li>
            </ul>
         </nav>
      </div>           
   </div>
</body>
</html>