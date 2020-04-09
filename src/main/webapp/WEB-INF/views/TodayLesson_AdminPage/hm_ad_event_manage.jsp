<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
      <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의레슨 이벤트 관리</title>
<!-- CSSstyle --> 
   <link rel ="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hm_ad_event_manage.css?ver=5">
   <style type="text/css">
      .hs_ad_main_asidenav_nav_Event_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle -->


<script src="${pageContext.request.contextPath}/resources/JS/hm_ad_event.js"></script>
</head>
<body>



<div class="hm_ad_event_managemain">

<!-- 검색 --> 
 <nav class="navbar navbar-expand-lg navbar-light bg-light" style="width:23%; margin:40px auto;">
  <div class="collapse navbar-collapse" id="navbarSupportedContent" >
 <form class="form-inline my-2 my-lg-0" method ="get" action="${pageContext.request.contextPath}/todaylessonadmin/hm_ad_event_manage?currPage=${page.startBlock }"
 style="margin:0px auto;">
 <select name="search" class="custom-select mr-sm-3" id="inlineFormCustomSelect" style="height:34px; font-size: 1em;">
<option value="all">전체</option>
<option value="event_title">제목</option>
</select>
 <input class="form-control mr-sm-2" name="searchtxt" type="search" placeholder="Search" aria-label="Search">
      <input type="submit" class="hmeventbtn" value="검색"></button>
    </form>
  </div>
</nav>
<!-- 검색완료 -->






<div>
   <div style="width: 100%; height: 50px; margin-top:40px; margin-bottom:80px;">
      <input type="button" id="eventinsertbtn" class="eventinsertbtn" value="이벤트등록" >
   </div>
   
   
   <div class="event_line"></div>
   
      <c:forEach var="item" items="${list}">
        <div  id="eventdiv1" class="eventdiv1">
               <span class="eventimg">
                  <img src="${item.event_thumbnail}" alt="Thumbnail"/>
               </span>
                  <ul class="eventtext">
                  <li class="eventgroup">
                     <c:choose>
                        <c:when test="${item.event_group eq '0'}">
                           <c:out value="레슨"/>
                           
                        </c:when>
                        <c:when test="${item.event_group eq '1'}">
                           <c:out value="스토어"/>
                        </c:when>
                        <c:when test="${item.event_group eq '2'}">
                           <c:out value="기타"/>
                        </c:when>
                     </c:choose>
                  </li>
                  <br>
					<jsp:useBean id="now" class="java.util.Date"/>
					<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
					<li class="event-head">${item.event_title}
					<c:if test="${today <= item.event_endperiod}">(진행중)</c:if> 
					<c:if test="${today > item.event_endperiod}">(종료)</c:if>
					</li>
					<li class="eventperiod">${item.event_startperiod}~${item.event_endperiod}</li>
                  <br><br>
	              <li class="eventreadmore"><a href="${pageContext.request.contextPath}/todaylessonadmin/hm_ad_event_detail/${item.event_no}" class="eventdetail"
	              style="font-size:20px;">Read More</a></li>
                  </ul>
</div>
<div class="event_line"></div>
      </c:forEach>
   
</div>




</div>


<div style="width:80%; margin:0px auto; text-align: center;">
<ul class="pagination pagination-danger">
<c:if test="${page.prev }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath}/todaylessonadmin/hm_ad_event_manage?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt }">PREV
</a></li>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath}/todaylessonadmin/hm_ad_event_manage?currPage=${index }&search=${search}&searchtxt=${searchtxt}">${index }
</a></li>
</c:if>

<c:if test="${index==page.currPage }">
<li class="active page-item"><a href="javascript:void(0);" class="page-link">${index }
</a></li>
</c:if>
</c:forEach>

<c:if test="${page.next }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath}/todaylessonadmin/hm_ad_event_manage?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}">NEXT
</a></li>
</c:if>
</ul>
</div>

</body>
</html>