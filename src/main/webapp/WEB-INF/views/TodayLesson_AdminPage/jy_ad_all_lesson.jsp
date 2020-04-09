<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSSstyle -->
   <style type="text/css">
      .hs_ad_main_asidenav_nav_Lesson_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
     <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/jy_ad_all_lesson.css?ver=4">   
<!-- CSSstyle -->


</head>
<body>
 <div stlye="width:100%;">
 <h2 style="margin-top:40px; text-align: center;">레슨 관리</h2>
 </div>
 
 
 <nav class="navbar navbar-expand-lg navbar-light bg-light" style="width:28%; margin:40px auto;">
  <div class="collapse navbar-collapse" id="navbarSupportedContent" >
 <form class="form-inline my-2 my-lg-0" method ="get" action="${pageContext.request.contextPath}/todaylessonadmin/alllesson?currPage=${page.startBlock }"
 style="margin:0px auto;">
 
  <select name="search" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
 <option value="all">전체</option>
<option value="lesson_title">레슨명</option>
 <option value="member_id">시니어 아이디</option>
</select>
 <input class="form-control mr-sm-2" name="searchtxt" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-secondary" type="submit">검색</button>
    </form>
  </div>
</nav>

	<table class="table" style="width: 80%; margin: 0px auto 40px;">
		<thead>
			<tr  style="background-color: #fff2f2;">
				<th scope="col"><a href="${pageContext.request.contextPath }/todaylessonadmin/alllesson?order=lesson_no">#</a></th>
				<th scope="col"><a href="${pageContext.request.contextPath }/todaylessonadmin/alllesson?order=lesson_title">레슨명</a></th>
				<th scope="col"><a href="${pageContext.request.contextPath }/todaylessonadmin/alllesson?order=lesson_category">카테고리</a></th>
				<th scope="col"><a href="${pageContext.request.contextPath }/todaylessonadmin/alllesson?order=lesson_type">레슨타입</a></th>
				<th scope="col"><a href="${pageContext.request.contextPath }/todaylessonadmin/alllesson?order=lesson_register_date">등록일자</a></th>
				<th scope="col">오픈일</th>
				<th scope="col">마감일</th>
				<th scope="col"><a href="${pageContext.request.contextPath }/todaylessonadmin/alllesson?order=member_id">시니어아이디</a></th>
				<th scope="col"><a href="${pageContext.request.contextPath }/todaylessonadmin/alllesson?order=lesson_result">승인상태</a></th>
				
			</tr>
		</thead>
		<tbody>
<thead>
<tbody>
			<c:forEach var="item" items="${list}">
				<tr>
					<td>${item.lesson_no}</td>
					<td><a href="${pageContext.request.contextPath }/todaylessonadmin/admin_lesson_detail/${item.lesson_no}">${item.lesson_title}</a></td>

<c:choose>

<c:when test="${item.lesson_category == 1}">
<td><c:out value="운동"/></td>
</c:when>

<c:when test="${item.lesson_category == 2}">
<td><c:out value="교육"/></td>
</c:when>

<c:when test="${item.lesson_category == 3}">
<td><c:out value="핸드메이드"/></td>
</c:when>

<c:when test="${item.lesson_category == 4}">
<td><c:out value="it"/></td>
</c:when>

<c:otherwise>
<td><c:out value="요리"/></td>
</c:otherwise>

</c:choose>


<c:choose>

<c:when test="${item.lesson_type == 1}">
<td><c:out value="원데이 클래스"/></td>
</c:when>

<c:when test="${item.lesson_type == 2}">
<td><c:out value="다회성 클래스"/></td>
</c:when>

<c:otherwise>
<td><c:out value="온라인 클래스"/></td>
</c:otherwise>

</c:choose>
					<td>${item.senior_register_date}</td>
					<td><c:out value="${item.lesson_open_period}"></c:out></td>
<td><c:out value="${item.lesson_close_period}"></c:out></td>
<td><c:out value="${item.member_id}"></c:out></td>
<c:choose>

<c:when test="${item.lesson_result == 0}">
<td><c:out value="신청완료"/></td>
</c:when>

<c:when test="${item.lesson_result == 1}">
<td><c:out value="심사중"/></td>
</c:when>

<c:when test="${item.lesson_result == 2}">
<td><c:out value="레슨승인"/></td>
</c:when>

<c:otherwise>
<td><c:out value="레슨거절"/></td>
</c:otherwise>

</c:choose>


</tr>
</c:forEach>
</tbody>
</table>

<div class="paging">
<div class="paginginside">

<ul class="pagination pagination-danger">
<c:if test="${page.prev }">
<li class="page-item">
<a href="${pageContext.request.contextPath}/todaylessonadmin/alllesson?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt }">PREV
</a></li>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath}/todaylessonadmin/alllesson?currPage=${index }&search=${search}&searchtxt=${searchtxt}">${index }
</a></li>
</c:if>

<c:if test="${index==page.currPage }">
<li class="active page-item"><a href="javascript:void(0);" class="page-link">${index }</a></li>
</c:if>

</c:forEach>

<c:if test="${page.next }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath}/todaylessonadmin/alllesson?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}">NEXT
</a></li>
</c:if>
</ul>
</div>
</div>

</body>
</html>