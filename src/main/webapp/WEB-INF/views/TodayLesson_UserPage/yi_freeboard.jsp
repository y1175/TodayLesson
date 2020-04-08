<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Today Lesson</title>
   
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
<script src="${pageContext.request.contextPath}/resources/JS/yi_freeboard.js?ver=1"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/yi_freeboard.css?ver=2">
</head>
<body>
<div id="yi_container">
<sec:authentication property="principal" var="pinfo"/>	
<table class="table table-hover">
<thead class=" yi_thead">
<tr><th><label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">카테고리</label>
<select name="order" id="orderselect" class="yi_orderselect custom-select mr-sm-2" id="inlineFormCustomSelect"  onchange="orderSelect()">
<option value="">카테고리 선택</option>
<option value="">전체</option>
<option value="1" >자유글</option>
<option value="2" >질문과답변</option>
</select>
</th>
<th scope="col">번호		<input type="button" name="order" class="yi_order_btn" value="정렬" onclick="order('freeboard_no')"></th>
<th scope="col">제목		</th>
<th scope="col">작성자	</th>
<th scope="col">작성일	<input type="button" name="order" class="yi_order_btn" value="정렬" onclick="order('freeboard_writedate')"></th>
<th scope="col">조회수	<input type="button" name="order" class="yi_order_btn" value="정렬" onclick="order('freeboard_readno')"></th>
</tr>
</thead>
<tbody class="yi_notice_tbody">

<c:forEach var="notice" items="${notice }">
<tr>
<td style="font-weight:600;">공지사항</td>
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
<td style="font-weight:600;">
<c:choose>
<c:when test="${item.freeboard_category eq 1 }" >자유글</c:when>
<c:when test="${item.freeboard_category eq 2 }">질문과답변</c:when>
</c:choose>
</td>
<td>${item.freeboard_no}</td>
<td>
<sec:authorize access="isAuthenticated()">
<a href="freeboard_detail/${item.freeboard_no }">${item.freeboard_title }		</a><span class="yi_replycount">[${replist[status.index]}]</span>
</sec:authorize>
<sec:authorize access="isAnonymous()">
${item.freeboard_title }		<span class="yi_replycount">[${replist[status.index]}]</span>
</sec:authorize>
</td>
<td><c:out value=" ${item.member_nick }"></c:out></td>
<td><c:out value=" ${item.freeboard_writedate }"></c:out></td>
<td><c:out value=" ${item.freeboard_readno }"></c:out></td>
</tr>
</c:forEach>
</tbody>
</table>
<form method="get" class="form-inline my-2 my-lg-3" action="freeboard?currPage=${page.startBlock }">


<div class="container">
<div class="row">
<div class="col-sm">
<select name="search" class="custom-select mr-sm-4"  id="inlineFormCustomSelect">
<option value="all">전체</option>
<option value="member_nick">닉네임</option>
<option value="freeboard_title">제목</option>
<option value="freeboard_content">내용</option>
</select>
<input type="text" name="searchtxt" class="form-control mr-sm-2" >
<input type="submit" value="검색" class="yi_search_btn">
</div>

<div class="col-sm"></div>

<div class="col-sm">
<div class="yi_write">
<sec:authorize access="isAuthenticated()">
<input type="button" id="write" class="yi_freeboard_btn" value="글쓰기" onclick="location.href='/todaylesson/freeboard_insert'">
</sec:authorize>
</div>
</div>

</div>
</div>
</form>






<div class="paging">
<ul class="pagination pagination-danger">
<!-- 이전페이지블럭 -->
<c:if test="${page.prev }">
<li class="page-item">
<a href="freeboard?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt }&order=${order}" class="page-link">PREV
</a></li>
</c:if>

<!-- 현재 페이지블럭 -->
<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">

<!-- if 인덱스가 현재페이지가 아니면 a태그 -->
<c:if test="${index!= page.currPage }">
<li class="page-item">
<a href="freeboard?currPage=${index }&search=${search}&searchtxt=${searchtxt}&order=${order}" class="page-link">${index }
</a></li>
</c:if>

<!--  if 인덱스가 현재페이지면 현재페이지 출력 -->
<c:if test="${index==page.currPage }">
<li class="active page-item"><a href="javascript:void(0);" class="page-link">${index }</a></li>
</c:if>
</c:forEach>

<!-- 다음페이지블럭 -->
<c:if test="${page.next }">
<li class="page-item">
<a href="freeboard?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}&order=${order}" class="page-link">NEXT
</a></li>
</c:if>
</ul>
</div>

</div>
</body>

</html>






<%--   <sec:authorize access="isAuthenticated()">
                 <!--  <form action="/logout" method='post'> -->
                     <input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>  <!-- 이걸  main 페이지에 넣어서 구분을   -->
                     <a href="freeboard_write">글쓰기</a><span style="margin-left: 10px;">
                 <!--  </form> -->
               </sec:authorize> --%>

