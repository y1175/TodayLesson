<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>얼리버드</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hm_us_bird.css?ver=2"> 
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/JS/hm_us_bird.js"></script> 
</head>
<body>

<img src="" alt="얼리버드 메인 이미지">
<%-- <jsp:useBean id="now" class="java.util.Date" /> --%>
<%-- <c:set var="now" value="<%=new Date()%>"/> --%>
<br>
<%-- <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" /> --%><!-- 오늘 날짜 구하기 -->
<%-- <fmt:parseDate var="opendate" value="${dto.lesson_open_period}" pattern="yyyy-MM-dd"/> --%><!-- 오픈일을 String -> Date형식으로 파싱 -->

<jsp:useBean id="now" class="java.util.Date" />
<fmt:parseDate value="${dto.lesson_open_period}" var="dateFmt" pattern="yyyy-MM-dd"/>

레슨시작일  <fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd"/>
<br>
오늘 <fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>
<br>

<fmt:parseNumber value="${dateFmt.time / (1000*60*60*24)}" integerOnly="true" var="isDate"  />
<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="itDate" />
${itDate - isDate} 일 지남






<%-- <fmt:parseNumber value="${today.time * 1}" var="today1"/> --%>
<br>
<c:out value="${today1}"/>
<%-- <fmt:parseNumber var="open" value="<%=opendate(new Date().getTime() + 60*60*24*1000*7)%>;"/> --%>
<%-- <fmt:parseNumber var ="open" value="${opendate(new Date().getTime() +60*60*24*1000*7)} "/> --%>
<%-- <fmt:parseNumber var ="open" value="${opendate(today.getTime() +60*60*24*1000*7)} "/> --%>

<%-- <fmt:parseNumber var="open1" value="${opendate(today.getTime() + 60*60*24*1000*7)}" /> --%>

<!-- 7일을 더해줌 -->
<%-- <fmt:parseDate var="open2" value="${open1}" pattern="yyyy-MM-dd"/> --%>

<%-- <c:set var="opentime" value="${opendate(new Date().getTime() + 60*60*24*1000*7)}"/> --%>

<%-- <c:set var="opentime" value="<%=opendate(new Date().getTime() + 60*60*24*1000*7)%>"/> --%>
<%-- <fmt:parseNumber var="opentime" value="${opendate + 60*60*24*1000*7}"/> --%>
<%-- <c:out value="${open1}"></c:out>  --%>
<%-- <c:set var="open_period" value="${dto.lesson_open_period(new Date().getTime() + 60*60*24*1000*7)}"/>  --%>



</body>
</html>