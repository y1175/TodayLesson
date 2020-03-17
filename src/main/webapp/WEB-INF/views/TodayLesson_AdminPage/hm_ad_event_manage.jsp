<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/JS/hm_ad_event.js"></script>
</head>
<body>

<ul>
<c:forEach var="item" items="${list}">
<div>
<img alt="썸네일" src="${item.event_thumbnail}">
<div>

</div>
</div>
</c:forEach>
</ul>

<input type="button"  id ="eventinsertbtn" value="이벤트 등록">

</body>
</html>