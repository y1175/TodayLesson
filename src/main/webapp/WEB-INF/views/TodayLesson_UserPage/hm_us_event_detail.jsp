<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hm_us_event_detail.css?ver=2"> 



</head>
<body>



<jsp:useBean id="now" class="java.util.Date" />



<div class="eventdetailmain">
<c:set var="dto" value="${dto}"></c:set>
<div class="eventdetailtitle">
<div class="eventdetailgroup">
			<p><c:choose>
				<c:when test="${dto.event_group eq '0'}">
					<c:out value="레슨" />
				</c:when>
				<c:when test="${dto.event_group eq '1'}">
					<c:out value="스토어" />
				</c:when>
				<c:when test="${dto.event_group eq '2'}">
					<c:out value="기타" />
				</c:when>
			</c:choose></p>
		</div>
<h3>${dto.event_title}</h3>
</div>


		<div class="event_period">
			${dto.event_startperiod}~${dto.event_endperiod}
				<c:if test="${now < dto.event_endperiod}">(종료)</c:if>
				<c:if test="${now >= dto.event_endperiod}">(진행중)</c:if>
			
		</div>
		<div class="eventdetailline"></div>
		<div class="event_content">${dto.event_content}</div>



<button onclick="location.href='${pageContext.request.contextPath}/todaylesson/hm_us_event'" class="hmuseventbtn">목록으로</button>

</div>




</body>
</html>