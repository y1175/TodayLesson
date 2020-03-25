<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
      <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hm_ad_event_manage.css?ver=2">
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/JS/hm_ad_event.js"></script>
</head>
<body>




 <form method ="get" action="hm_ad_event_manage?currPage=${page.startBlock }" style="text-align: center;  margin-top: 40px;">
 <select name="search">
 <option value="all">전체</option>
 <option value="event_title">제목</option>
 </select>
 <input type="text" name="searchtxt">
 <input type="submit" value="검색">
 </form>
 





<div>
   <div style="width: 100%; height: 50px; margin-top:40px; margin-bottom:80px;">
      <input type="button" id="eventinsertbtn" class="eventinsertbtn" value="이벤트등록">
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
	              <li class="eventreadmore"><a href="${pageContext.request.contextPath}/todaylessonadmin/hm_ad_event_detail/${item.event_no}" class="eventdetail">Read More</a></li>
                  </ul>
</div>
<div class="event_line"></div>
      </c:forEach>
   
</div>




<c:if test="${page.prev }">
<a href="hm_ad_event_manage?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt }"><c:out value="이전"/></a>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
</c:if>
<a href="hm_ad_event_manage?currPage=${index }&search=${search}&searchtxt=${searchtxt}">${index }</a>
</c:forEach>

<c:if test="${page.next }">
<a href="hm_ad_event_manage?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}"><c:out value="다음"/></a>
</c:if>




</body>
</html>