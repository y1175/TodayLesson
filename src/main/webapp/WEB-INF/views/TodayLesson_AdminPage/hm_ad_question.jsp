<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 레슨 관리자 1:1문의</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hm_ad_question.css?ver=5">
<script src="${pageContext.request.contextPath}/resources/JS/hm_ad_question.js?ver=4"></script>

<!-- CSSstyle --> 
   <style type="text/css">
      .hs_ad_main_asidenav_nav_question_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle -->

</head>
<body>




<div class="questionheader">


<h2><b>1:1문의 관리 페이지</b></h2>
	
<!-- 검색 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="width:30%; margin:40px auto;">
   <div class="collapse navbar-collapse" id="navbarSupportedContent" >
     <form class="form-inline my-2 my-lg-0" method ="get" action="${pageContext.request.contextPath}/todaylessonadmin/hm_ad_question?currPage=${page.startBlock }"
    style="margin:0px auto;">
    <select name="search" class="custom-select mr-sm-2" id="inlineFormCustomSelect" style="height:34px; font-size: 1em;">
    <option value="all">전체</option>
    <option value="question_title">제목</option>
    <option value="member_id">아이디</option>
    </select>
   <input class="form-control mr-sm-2" name="searchtxt" type="search" placeholder="Search" aria-label="Search">
   <button class="hmadfaqbtn" type="submit" style="background-color: rgb(224, 62, 82);">검색</button>
   </form>
  </div>
</nav>
<!-- 검색 끝 -->






	<table class="table" >
		<thead>
			<tr class="table-warning">
				<th scope="col" style="background-color:#fff2f2;">#</th>
				<th scope="col" style="background-color:#fff2f2;">문의유형</th>
				<th scope="col" style="background-color:#fff2f2;">아이디</th>
				<th scope="col" style="background-color:#fff2f2;">제목</th>
				<th scope="col" style="background-color:#fff2f2;">답변상태</th>
				<th scope="col" style="background-color:#fff2f2;">문의일</th>
				<th scope="col" style="background-color:#fff2f2;">상세보기</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr>
					<td><span class="questiondetailno">${item.question_no}</span></td>

					<c:choose>
						<c:when test="${item.question_group eq '0'}">
							<td><p>레 슨</p></td>
						</c:when>
						<c:when test="${item.question_group eq '1'}">
							<td><p>시니어</p></td>
						</c:when>
						<c:when test="${item.question_group eq '2'}">
							<td><p>스토어</p></td>
						</c:when>
						<c:when test="${item.question_group eq '3'}">
							<td><p>주 문</p></td>
						</c:when>
						<c:when test="${item.question_group eq '4'}">
							<td><p>기 타</p></td>
						</c:when>
					</c:choose>
					
					
					<td><span>${item.member_id}</span></td>
					
					<td><span>${item.question_title}</span></td>
					
					<c:choose>
						<c:when test="${item.question_situation eq '0' }">
							<td><p class="waitanswer">답변대기</p></td>
						</c:when>
						<c:when test="${item.question_situation eq '1' }">
							<td><p class="endanswer">답변완료</p></td>
						</c:when>
					</c:choose>
					
					<td><span>${item.question_writedate}</span></td>
					
					<td><input type="button" onclick="location.href='${pageContext.request.contextPath}/todaylessonadmin/hm_ad_question_detail/${item.question_no}'" name="questionbtn" id="questionbtn"
						class="questionbtn" value="상세보기"></td>
				</tr>
				
			</c:forEach>
		</tbody>
	</table>






</div>


<div style="width:80%; margin:0px auto; text-align: center;">
<ul class="pagination pagination-danger">
<c:if test="${page.prev }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath}/todaylessonadmin/hm_ad_question?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt }">PREV
</a></li>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath}/todaylessonadmin/hm_ad_question?currPage=${index }&search=${search}&searchtxt=${searchtxt}">${index }
</a></li>
</c:if>


<c:if test="${index==page.currPage }">
<li class="active page-item"><a href="javascript:void(0);" class="page-link">${index }</a></li>
</c:if>

</c:forEach>

<c:if test="${page.next }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath}/todaylessonadmin/hm_ad_question?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}">NEXT
</a></li>
</c:if>

</ul>
</div>
</body>
</html>
