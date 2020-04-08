<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSSstyle -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/hm_ad_event_detail.css?ver=2"> 
   <style type="text/css">
      .hs_ad_main_asidenav_nav_Event_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/JS/hm_ad_event_detail.js"></script>
</head>
<body>
	<jsp:useBean id="now" class="java.util.Date" />
	<input type="hidden" value="${dto.event_no}" class="event_no">
	<h1 style="text-align: center; margin : 50px 0px; ">이벤트 상세페이지</h1>
	<div class="eventdetailmain">
		<div class="eventdetailgroup">
			<c:choose>
				<c:when test="${dto.event_group eq '0'}">
					<c:out value="레슨" />
				</c:when>
				<c:when test="${dto.event_group eq '1'}">
					<c:out value="스토어" />
				</c:when>
				<c:when test="${dto.event_group eq '2'}">
					<c:out value="기타" />
				</c:when>
			</c:choose>
		</div>
		<div class="event_title">${dto.event_title}</div>
		<div class="event_period">
			<${dto.event_startperiod}~${dto.event_endperiod}> <br>
			<p>
				<c:if test="${now < dto.event_endperiod}">(종료)</c:if>
				<c:if test="${now >= dto.event_endperiod}">(진행중)</c:if>
			</p>
		</div>
		<div class="eventdetailline"></div>
		<div class="event_content">${dto.event_content}</div>
			<div class="eventthumbnail">
			<p>썸네일</p>
			<img alt="thumbnail" src="${dto.event_thumbnail}">
			<br><br>
			<p>${dto.event_thumbexplain}</p>
			</div>
	</div>
			<div class="eventdetailbtn">
			<button onclick="location.href='${pageContext.request.contextPath}/todaylessonadmin/hm_ad_event_manage'" class="hmeventdetailbtn">목록으로</button>
			<button class="eventdetailupdatebtn">수정</button>
			<button class="eventdetaildeletebtn">삭제</button>
			</div>
			
			
			
</body>
</html>