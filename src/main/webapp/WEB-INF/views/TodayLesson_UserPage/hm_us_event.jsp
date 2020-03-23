<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/hm_us_event.css?ver=2">
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/JS/hm_us_event.js"></script>
</head>
<body>



 <form method ="get" action="hm_us_event?currPage=${page.startBlock }" style="text-align: center;  margin-top: 40px;">
 <select name="search">
 <option value="all">전체</option>
 <option value="event_title">제목</option>
 </select>
 <input type="text" name="searchtxt">
 <input type="submit" value="검색">
 </form>
 

<%-- 
출력 테스트완료
<c:forEach var="item" items="${list}">
<img src="${item.event_thumbnail}" alt="Thumbnail"/>
</c:forEach> --%>

















<c:if test="${page.prev }">
<a href="hm_us_event?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt }"><c:out value="이전"/></a>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
</c:if>
<a href="hm_us_event?currPage=${index }&search=${search}&searchtxt=${searchtxt}">${index }</a>
</c:forEach>

<c:if test="${page.next }">
<a href="hm_us_event?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}"><c:out value="다음"/></a>
</c:if>


 

</body>
</html>                                       