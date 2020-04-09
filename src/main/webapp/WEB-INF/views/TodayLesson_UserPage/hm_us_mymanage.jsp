<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSSstyle -->
   <style type="text/css">
      .hs_us_mypage_mymanage>a{
         color: white;
      }
   </style>
<!-- CSSstyle -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hm_us_mymanage.css?ver=2">
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

<h1 style="margin-top:40px; text-align: center; color: rgb(53, 54, 58); ">내 정보 관리</h1>
<div class="hmpwdimg">
<img alt="내정보관리 이미지" src="/resources/IMG/password.png">
</div>


<div class="hmmanagemain">
<h2>비밀번호 재확인</h2>
<p>본인 확인을 위해 한번 더 비밀번호를 입력해주세요
<br>비밀번호는 타인에게 노출되지 않도록 주의해 주세요</p>
<form method="post" action="${pageContext.request.contextPath}/todaylessonmypage/hm_us_mymanage2">
<input type="hidden" id="member_id" name="member_id" value="${pageContext.request.userPrincipal.name}"> 
<input type="password" id="member_pwd" name="member_pwd" placeholder="8~20자 영문숫자 조합" required="required">
<input type ="submit" class="managebtn" value="확인">
<input type ="reset" class="managebtn" value="취소">
</form>
</div>
</body>
</html>