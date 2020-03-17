<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hm_ad_event_manage.css?ver=1">
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/JS/hm_ad_event.js"></script>
</head>
<body>

<button class="eventinsertbtn">이벤트 등록</button>

<c:forEach var="item" items="${list}">
<div id="eventdiv1" class="eventdiv1">
<ul class="eventul">
<li>
<div class="eventimg">
<img src="${item.event_thumbnail}" alt="Thumbnail"/>
</div>
<div class="eventtext">
<h6 class="eventgroup">
<c:choose>
<c:when test="${item.event_group eq '0'}">
레슨
</c:when>
<c:when test="${item.event_group eq '1'}">
스토어
</c:when>
<c:when test="${item.event_group eq '2'}">
기타
</c:when>
</c:choose>
</h6>
<h4 class="event-head">${item.event_title}</h4>
<p class="eventperiod">${item.event_startperiod}~${item.event_endperiod}</p>
	<a href="" class="eventdetail"><p class="eventreadmore">Read More</p></a>
</div>
</li>
</ul>
</div>
</c:forEach>




</body>
</html>