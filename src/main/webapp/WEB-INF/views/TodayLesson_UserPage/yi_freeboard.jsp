<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<script>
/* 정렬 자바스크립트 */
 /* 
 order function=>정렬 함수
 orderSelect function=>셀렉트박스 선택 함수
 mapper는 id=list를 참고
 컨트롤러에는 order를 필요한곳에 추가해줘야함!
 */
function order(data)
{

location.href="freeboard?order="+data;
	
	
	}
function orderSelect()
{
	var selectOption=orderselect.options[orderselect.selectedIndex].value;
	console.log(selectOption);
	location.href="freeboard?order="+selectOption;
	}
</script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/yi_freeboard.css?ver=1">
</head>
<body>
<sec:authentication property="principal" var="pinfo"/>	
<table class="table">
<thead>
<tr><th>카테고리
<select name="order" id="orderselect" onchange="orderSelect()">
<option value="">선택</option>
<option value="1" >자유글</option>
<option value="2" >질문과답변</option>
</select></th>
<th>번호		<input type="button" name="order" value="정렬" onclick="order('freeboard_no')"></th>
<th>제목		</th>
<th>작성자	</th>
<th>작성일	<input type="button" name="order" value="정렬" onclick="order('freeboard_writedate')"></th>
<th>조회수	<input type="button" name="order" value="정렬" onclick="order('freeboard_readno')"></th>
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
<td>${notice.notice_readno }</td>
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
<a href="freeboard_detail/${item.freeboard_no }">${item.freeboard_title }		[${replist[status.index]}]</a>
</sec:authorize>
<sec:authorize access="isAnonymous()">
${item.freeboard_title }		[${replist[status.index]}]
</sec:authorize>
</td>
<td><c:out value=" ${item.member_nick }"></c:out></td>
<td><c:out value=" ${item.freeboard_writedate }"></c:out></td>
<td><c:out value=" ${item.freeboard_readno }"></c:out></td>
</tr>
</c:forEach>
</tbody>
</table>
<form method="get" action="freeboard?currPage=${page.startBlock }">
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
<input type="button" id="write" class="freeboard_btn" value="글쓰기" onclick="location.href='/todaylesson/freeboard_insert'"><br>
</sec:authorize>

<c:if test="${page.prev }">
<a href="freeboard?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt }&order=${order}"><c:out value="이전"/></a>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
</c:if>
<a href="freeboard?currPage=${index }&search=${search}&searchtxt=${searchtxt}&order=${order}">${index }</a>
</c:forEach>

<c:if test="${page.next }">
<a href="freeboard?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}&order=${order}"><c:out value="다음"/></a>
</c:if>
</body>
</html>






<%--   <sec:authorize access="isAuthenticated()">
                 <!--  <form action="/logout" method='post'> -->
                     <input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>  <!-- 이걸  main 페이지에 넣어서 구분을   -->
                     <a href="freeboard_write">글쓰기</a><span style="margin-left: 10px;">
                 <!--  </form> -->
               </sec:authorize> --%>

