<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/jy_mul_ad_sn_data3.css?ver=2">  

<style>



</style>
<!-- CSSstyle -->
   <style type="text/css">
      .hs_ad_main_asidenav_nav_NewLessonEvaluation_Title>a{
         color: rgb(224, 62, 82);
      }

 
   </style>
<!-- CSSstyle -->

</head>
<body>

<div id="jy_container">

 <div stlye="width:100%;">
 <h2 style="margin-top:40px; text-align: left;"><b>신규 레슨 심사</b></h2>
 </div>
 <br>
 
 
	<table class="table table-hover" style="width: 100%; margin: 0px auto 40px;">
		<thead>
			<tr  style="background-color: #fff2f2;">
				<th scope="col"><a href="${pageContext.request.contextPath }/todaylessonadmin/wait_lesson?order=lesson_no">#</a></th>
				<th scope="col"><a href="${pageContext.request.contextPath }/todaylessonadmin/wait_lesson?order=lesson_title">레슨명</a></th>
				<th scope="col"><a href="${pageContext.request.contextPath }/todaylessonadmin/wait_lesson?order=lesson_category">카테고리</a></th>
				<th scope="col"><a href="${pageContext.request.contextPath }/todaylessonadmin/wait_lesson?order=lesson_type">레슨타입</a></th>
				<th scope="col"><a href="${pageContext.request.contextPath }/todaylessonadmin/wait_lesson?order=lesson_register_date">등록일자</a></th>
				<th scope="col">오픈일</th>
				<th scope="col">마감일</th>
				<th scope="col"><a href="${pageContext.request.contextPath }/todaylessonadmin/alllesson?order=member_id">시니어아이디</a></th>				
			</tr>
		</thead>
		<tbody>

<c:forEach var="item" items="${list}">
<tr>
<td><c:out value="${item.lesson_no}"/></td>
<td><a href="${pageContext.request.contextPath }/todaylessonadmin/admin_wait_lesson_detail/${item.lesson_no}"><c:out value="${item.lesson_title}"/></a></td>


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

<td><c:out value="${item.lesson_register_date}"></c:out></td>
<td><c:out value="${item.lesson_open_period}"></c:out></td>
<td><c:out value="${item.lesson_close_period}"></c:out></td>

<td><c:out value="${item.member_id}"></c:out></td>



</tr>
</c:forEach>
</tbody>
</table>

</div>
</body>
</html>