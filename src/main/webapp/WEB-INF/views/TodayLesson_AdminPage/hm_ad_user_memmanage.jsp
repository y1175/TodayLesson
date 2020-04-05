<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/JS/hm_ad_user_memmanagelist.js"></script>
<!-- CSSstyle -->
   <style type="text/css">
      .hs_ad_main_asidenav_nav_Member_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle -->


</head>
<body>
 
 <form method ="get" action="${pageContext.request.contextPath}/todaylessonadmin/admin_hm_memmanage?currPage=${page.startBlock }">
 <select name="search">
 <option value="all">전체</option>
 <option value="member_id">아이디</option>
 <option value="member_name">이름</option>
 <option value="member_nick">닉네임</option>
 </select>
 <input type="text" name="searchtxt">
 <input type="submit" value="검색">
 </form>
 
 
 
 
<table>
<thead><tr><th>no</th><th>Id</th><th>이름</th>
<th>닉네임</th><th>적립금</th><th>회원등급</th><th>가입일</th></tr></thead>
<tbody>
<c:forEach var="item" items="${list}">
<tr><td>${item.member_no}</td>
<td>${item.member_id}</td>
<td>${item.member_name}</td>
<td>${item.member_nick}</td>
<td>${item.member_point}</td>
<form method="post" action="adminmember_levelupdate">
<td>
<input type="hidden" name="member_id" id="member_id" value="${item.member_id}">
<select id="member_level" name="member_level">
<option value="">${item.member_level} 레벨</option>
<option value="0">0 관리자</option>
<option value="1">1 주니어</option>
<option value="2">2 시니어</option>
<option value="3">3 블   락</option>
</select> 
<input type="submit" value="수정">

</td>
</form>
<td>${item.member_join_date}</td>
<td><input type="button" name="detailbutton" id="detailbutton" class="detailbutton" value="상세보기"></td></tr>
</c:forEach>
</tbody>
</table> 

<c:if test="${page.prev }">
<a href="${pageContext.request.contextPath}/todaylessonadmin/admin_hm_memmanage?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt }"><c:out value="이전"/></a>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
</c:if>
<a href="${pageContext.request.contextPath}/todaylessonadmin/admin_hm_memmanage?currPage=${index }&search=${search}&searchtxt=${searchtxt}">${index }</a>
</c:forEach>

<c:if test="${page.next }">
<a href="${pageContext.request.contextPath}/todaylessonadmin/admin_hm_memmanage?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}"><c:out value="다음"/></a>
</c:if>



</body>
</html>