<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!--mypage nav style-->
<link rel="stylesheet" href="resources/CSS/hs_us_mypage_nav.css">
<!--mypage nav style-->

</head>
<body>
   <div class="hs_us_mypage_box">
      <div class="hs_us_mypage_div">
         <div class="hs_us_mypage_img_nick">
            <span class="hs_us_mypage_img">
               <img alt="" src="">
            </span>
            <span class="hs_us_mypage_nick">
               ${pageContext.request.userPrincipal.name}님
            </span>  <!-- 나중에 닉네임 정보로 가져오기 -->
         </div>
         <div class="hs_us_mypage_level_inclass_point">   
            <span>
               <span>회원등급</span>
               <span>시니어</span> <!-- 회원등급 가져오기 -->
            </span>
            <span>
               <span>수강중인 클래스</span>
               <span>10</span> <!-- 수강중인 클래스 수 가져오기 -->
            </span><span>
               <span>적립금</span>
               <span>1,000원</span> <!-- 적립금 가져오기 -->
            </span>
         </div>
      </div>
      <div class="hs_us_mypage_navdiv">
         <nav class="hs_us_mypage_nav">
            <span style="background-color: rgb(53, 54, 58); padding: 20px;">
            <a href="">내 정보관리</a>
            <a href="">주문내역</a>
            <a href="">나의 레슨</a>
            <a href="">나의 레슨관리</a>
            <a href="">1:1 문의</a>
            </span>
            <span style="background-color: rgb(224, 62, 82); padding: 20px; float: right;">
            <a href="">♥ 좋아요</a>
            </span>
         </nav>
      </div>           
   </div>


</body>
</html>