<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hm_ad_event.css">
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/JS/hm_ad_event.js"></script>
</head>
<body>

	<c:forEach var="item" items="${list}">
		<div id="pattern" class="pattern">
			<ul class="list img-list">
				<li><a href="#" class="inner">
						<div class="li-img">
							<img src="${item.event_thumbnail}" alt="Thumbnail" />
						</div>
						<div class="li-text">
							<h4 class="li-head">${item.event_title}</h4>
							<p class="li-summary">Lorem ipsum dolor sit amet, consectetur
								adipiscing elit. Duis sit amet tellus velit, ut semper neque.</p>
							<p class="li-action">Read More</p>
						</div>
	</c:forEach>


	<%-- <ul>
<c:forEach var="item" items="${list}">
<div>
<img alt="썸네일" src="${item.event_thumbnail}">
<div>
</c:forEach>
</ul> --%>

<input type="button"  id ="eventinsertbtn" value="이벤트 등록">

</body>
</html>