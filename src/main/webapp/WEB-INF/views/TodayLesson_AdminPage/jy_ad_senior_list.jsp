<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/JS/hm_ad_user_memmanagelist.js?ver=2"></script>
<!-- CSSstyle -->
   <style type="text/css">
      .hs_ad_main_asidenav_nav_Member_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle -->


</head>
<body>
 <div stlye="width:100%;">
 <h2 style="margin-top:40px; text-align: center;">시니어 관리</h2>
 </div>

 
 <nav class="navbar navbar-expand-lg navbar-light bg-light" style="width:30%; margin:40px auto;">
  <div class="collapse navbar-collapse" id="navbarSupportedContent" >
 <form class="form-inline my-2 my-lg-0" method ="get" action="${pageContext.request.contextPath}/todaylessonadmin/all_senior?currPage=${page.startBlock }"
 style="margin:0px auto;">
 <select name="search" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
<option value="all">전체</option>
<option value="member_id">아이디</option>
 <option value="senior_nick">이름</option>
 <option value="senior_account_name">예금주</option>
</select>
 <input class="form-control mr-sm-2" name="searchtxt" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-secondary" type="submit">검색</button>
    </form>
  </div>
</nav>





	<table class="table" style="width: 80%; margin: 0px auto 40px;">
		<thead>
			<tr class="table-warning">
				<th scope="col">#</th>
				<th scope="col">아이디</th>
				<th scope="col">닉네임</th>
				<th scope="col">시니어명</th>
				<th scope="col">시니어전환일</th>
				<th scope="col">사업자여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr><a href="/todaylessonadmin/select_senior/${item.senior_no}">
					<td>${item.senior_no}</td>
					<td>${item.member_id}</td>
					<td>${item.senior_nick}</td>
					<td>${item.senior_register_date}</td>
					<c:choose>

<c:when test="${item.senior_crno == null}">
<td><c:out value="N"/></td>
</c:when>

<c:otherwise>
<td><c:out value="Y"/></td>
</c:otherwise>

</c:choose>
</a>
</tr>
</c:forEach>
</tbody>
</table>


<c:if test="${page.prev }">
<a href="${pageContext.request.contextPath}/todaylessonadmin/all_senior?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt }"><c:out value="이전"/></a>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
</c:if>
<a href="${pageContext.request.contextPath}/todaylessonadmin/all_senior?currPage=${index }&search=${search}&searchtxt=${searchtxt}">${index }</a>
</c:forEach>

<c:if test="${page.next }">
<a href="${pageContext.request.contextPath}/todaylessonadmin/all_senior?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}"><c:out value="다음"/></a>
</c:if>



</body>
</html>