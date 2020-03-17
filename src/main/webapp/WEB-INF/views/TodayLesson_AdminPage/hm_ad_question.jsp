<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/JS/hm_ad_question.js"></script>
</head>
<body>
<h2>1:1문의 관리 페이지</h2>

<form method ="get" action="hm_ad_question?currPage=${page.startBlock }">
<select name="search">
<option value="all">전체</option>
<option value="question_title">제목</option>
<option value="member_id">아이디</option>
</select>
<input type="text" name="searchtxt">
<input type="submit" value="검색">
</form>






<table>
<thead>
<tr><th>문의번호</th><th>문의유형</th><th>아이디</th><th>문의제목</th><th>답변상태</th><th>문의일</th></tr>
</thead>
<tbody>
<c:forEach var="item" items="${list}">
<tr>
<td><span class="questiondetailno">${item.question_no}</span></td>
<c:choose>
<c:when test="${item.question_group eq '0'}">
<td><p>레  슨</p></td>
</c:when>
<c:when test="${item.question_group eq '1'}">
<td><p>시니어</p></td>
</c:when>
<c:when test="${item.question_group eq '2'}">
<td><p>스토어</p></td>
</c:when>  
<c:when test="${item.question_group eq '3'}">
<td><p>주  문</p></td>
</c:when>
<c:when test="${item.question_group eq '4'}">
<td><p>기  타</p></td>
</c:when>
</c:choose>
<td><span>${item.member_id}</span></td>
<td><span>${item.question_title}</span></td>
<c:choose>
<c:when test="${item.question_situation eq '0' }">
<td><p>답변대기</p></td>
</c:when>
<c:when test="${item.question_situation eq '1' }">
<td><p>답변완료</p></td>
</c:when>
</c:choose>
<td><span>${item.question_writedate}</span></td>
<td><input type="button" name="questionbtn" id="questionbtn" class="questionbtn" value="상세보기"></td>
</tr>
</c:forEach>
</tbody>
</table>




<c:if test="${page.prev }">
<a href="hm_ad_question?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt }"><c:out value="이전"/></a>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
</c:if>
<a href="hm_ad_question?currPage=${index }&search=${search}&searchtxt=${searchtxt}">${index }</a>
</c:forEach>

<c:if test="${page.next }">
<a href="hm_ad_question?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}"><c:out value="다음"/></a>
</c:if>



</body>
</html>
