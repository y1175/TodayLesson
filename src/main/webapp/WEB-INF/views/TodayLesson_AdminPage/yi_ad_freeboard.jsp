<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<title>게시글 목록</title>
</head>
<body>
<sec:authentication property="principal" var="pinfo"/>
게시판 관리페이지<br>
<input type="button" value="공지등록">	
<table class="table">
<thead>
<tr><th>카테고리</th><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>관리</th>
</tr>
</thead>
<tbody>
<c:forEach var="notice" items="${notice }">
<tr>
<td>공지사항</td>
<td>${notice.notice_no }</td>
<td>			
<a href="notice_detail/${notice.notice_no }" >${notice.notice_title }</a>
</td>
<td>${notice.member_nick }</td>
<td>${notice.notice_writedate }</td>
<td>
<a class="btn btn-primary" data-toggle="collapse" data-target="#notice_detail-${notice.notice_no}" role="button" aria-expanded="false" aria-controls="#detail-${notice.notice_no}">
    상세보기
  </a>

</td>
<tr>
<td colspan="6">
<div class="collapse" id="notice_detail-${notice.notice_no}">
  
   
  <div>
  내용 : ${notice.notice_content}<br>
  <form action="" method="post">
  <textarea style="resize: none;" name="boardreply_content"></textarea><br>
  <input type="hidden" name="member_id" value=""><br>
  <input type="button" value="답변"><input type="button" value="삭제">
  </form>
  </div>

</div>
</td>
</tr>


</tr>
</c:forEach>
</tbody>

<tbody>
<c:forEach var="item" items="${list }" varStatus="status">


<tr>
<td>
<c:choose>
<c:when test="${item.freeboard_category eq 1 }">자유글</c:when>
<c:when test="${item.freeboard_category eq 2 }">질문과답변</c:when>
</c:choose>
</td>
<td>${item.freeboard_no}</td>
<td>
<sec:authorize access="isAuthenticated()">
<a href="freeboard_detail/${item.freeboard_no }">${item.freeboard_title }</a>
</sec:authorize>
<sec:authorize access="isAnonymous()">
${item.freeboard_title }		[${replist[status.index]}]
</sec:authorize>
</td>
<td><c:out value=" ${item.member_nick }"></c:out></td>
<td><c:out value=" ${item.freeboard_writedate }"></c:out></td>
<td>
<a class="btn btn-primary" data-toggle="collapse" data-target="#freeboard_detail-${item.freeboard_no}" role="button" aria-expanded="false" aria-controls="#detail-${item.freeboard_no}">
   상세보기
  </a>
</td>

</tr>

<tr>
<td colspan="6">
<div class="collapse" id="freeboard_detail-${item.freeboard_no}">
  
   
  <div>
  내용 : ${item.freeboard_content}<br>
  <form action="" method="post">
  <textarea style="resize: none;" name="boardreply_content"></textarea><br>
  <input type="hidden" name="member_id" value=""><br>
  <input type="button" value="답변"><input type="button" value="삭제">
  </form>
  </div>

</div>
</td>
</tr>

</c:forEach>
</tbody>
</table>
<form method="get" action="admin_freeboard?currPage=${page.startBlock }">
<select name="search">
<option value="all">전체</option>
<option value="member_nick">닉네임</option>
<option value="freeboard_title">제목</option>
<option value="freeboard_content">내용</option>
</select>
<input type="text" name="searchtxt" >
<input type="submit" value="검색">

</form>

<sec:authorize access="isAuthenticated()">
<input type="button" id="write" value="글쓰기" onclick="location.href='/freeboard_insert'"><br>
</sec:authorize>

<c:if test="${page.prev }">
<a href="admin_freeboard?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt }"><c:out value="이전"/></a>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
</c:if>
<a href="admin_freeboard?currPage=${index }&search=${search}&searchtxt=${searchtxt}">${index }</a>
</c:forEach>

<c:if test="${page.next }">
<a href="admin_freeboard?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}"><c:out value="다음"/></a>
</c:if>
</body>
</html>