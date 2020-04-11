<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Today Lesson</title>
<c:set var="item" value="${dto }"></c:set>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/yi_freeboard_detail.css?ver=2">
</head>
<body>
<c:set var="item" value="${dto }"></c:set>
<div id="notice_container">
	

<span class="category"><p>카테고리</p></span >

<span class="category_text">공지사항</span>

<div class="yi_freeboard_title">제목 : ${item.notice_title }</div>
	<div class="writer">작성자 : ${item.member_nick }</div>	<div class="writedate">작성일 : ${item.notice_writedate }</div>

<br>

<div class="detailline"></div>
<div class="yi_freeboard_content">
${item.notice_content } <br>

</div>
<div class="notice_end">
<a class="goback" href="${pageContext.request.contextPath}/todaylesson/freeboard">목록으로</a>
</div>



</div>
</body>
</html>