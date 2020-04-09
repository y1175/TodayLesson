<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TodayLesson</title>

<!-- CSSstyle -->
   <style type="text/css">
      .hs_sn_approveLessonList_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle --> 
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/jy_sn_approve_list.css?ver=2">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/jy_mul_ad_sn_data3.css?ver=2">  
	
</head>
<body>
<div id="jy_container">

 <div stlye="width:100%;">
 <h2 style="margin-top:40px; text-align: left;"><b>수락된 레슨</b></h2>
 </div>
 
 
 <!-- 검색 --> 
 <nav class="navbar navbar-expand-lg navbar-light bg-light" style="width:31.5%; margin:40px auto;">
  <div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin:0px auto;">
<form class="form-inline my-2 my-lg-0" method ="get" action="${pageContext.request.contextPath}/todaylessonsenior/my_approve_lesson?currPage=${page.startBlock }"
 style="margin:0px auto;">
 <select name="search" class="custom-select mr-sm-3" id="inlineFormCustomSelect" style="height:34px; font-size: 1em;">
 <option value="all">전체</option>
<option value="lesson_title">레슨명</option>
 <option value="lesson_content">레슨 내용</option>
</select>
 <input class="form-control mr-sm-2" name="searchtxt" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-secondary" style="background-color: rgb(224, 62, 82);" type="submit">검색</button>
    </form>
  </div>
</nav>
<!-- 검색완료 -->
 

	<table class="table table-hover" style="width: 100%; margin: 0px auto 40px;">
		<thead>
			<tr  style="background-color: #fff2f2;">

				<th scope="col">#</th>
				<th scope="col">레슨명</th>
				<th scope="col">카테고리</th>
				<th scope="col">레슨 종류</th>
				<th scope="col">등록일자</th>
				<th scope="col">오픈일</th>
				<th scope="col">마감일</th>
				
				
			</tr>
		</thead>
		<tbody>
<thead>
<tbody>
<c:forEach var="item" items="${list}">
<tr>


<td><c:out value="${item.lesson_no}"/></td>
<td><a href="/todaylessonsenior/approve_lesson_detail/${item.lesson_no}"><c:out value="${item.lesson_title}"/></a></td>


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

<c:when test="${item.lesson_category == 4}">
<td><c:out value="요리"/></td>
</c:when>


<c:otherwise>
<td><c:out value="기타"/></td>
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

<td><c:out value="${item.lesson_register_date }"/></td>

<td><c:out value="${item.lesson_open_period }"/></td>
<td><c:out value="${item.lesson_close_period }"/></td>


</tr>

</c:forEach>
</tbody>
</table>

<div class="paging">
<div class="paginginside">

<ul class="pagination pagination-danger">
<c:if test="${page.prev }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath}/todaylessonsenior/my_approve_lesson?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt }">PREV
</a></li>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath}/todaylessonsenior/my_approve_lesson?currPage=${index }&search=${search}&searchtxt=${searchtxt}">${index }
</a></li>
</c:if>

<c:if test="${index==page.currPage }">
<li class="active page-item"><a href="javascript:void(0);" class="page-link">${index }</a></li>
</c:if>
</c:forEach>

<c:if test="${page.next }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath}/todaylessonsenior/my_approve_lesson?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}">NEXT
</a></li>
</c:if>
</ul>

</div>
</div>
</div>
</body>

</html>