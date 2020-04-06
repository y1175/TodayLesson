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
 <h2 style="margin-top:40px; text-align: center;">회원 관리</h2>
 </div>

 
 <nav class="navbar navbar-expand-lg navbar-light bg-light" style="width:30%; margin:40px auto;">
  <div class="collapse navbar-collapse" id="navbarSupportedContent" >
 <form class="form-inline my-2 my-lg-0" method ="get" action="${pageContext.request.contextPath}/todaylessonadmin/admin_hm_memmanage?currPage=${page.startBlock }"
 style="margin:0px auto;">
 <select name="search" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
<option value="all">전체</option>
<option value="member_id">아이디</option>
 <option value="member_name">이름</option>
 <option value="member_nick">닉네임</option>
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
				<th scope="col">이름</th>
				<th scope="col">닉네임</th>
				<th scope="col">적립금</th>
				<th scope="col">회원등급</th>
				<th scope="col">가입일</th>
				<th scope="col">상세보기</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr>
					<td>${item.member_no}</td>
					<td>${item.member_id}</td>
					<td>${item.member_name}</td>
					<td>${item.member_nick}</td>
					<td>${item.member_point}</td>

					<!-- 회원등급 & 권한 조정 -->
					<form method="post" action="adminmember_levelupdate">
						<td><input type="hidden" name="member_id" id="member_id"
							value="${item.member_id}"> <select id="member_level"
							name="member_level">
								<option value="">${item.member_level}레벨</option>
								<option value="0">0 관리자</option>
								<option value="1">1 주니어</option>
								<option value="2">2 시니어</option>
								<option value="3">3 블 락</option>
						</select> <input type="submit" class="btn btn-secondary" value="수정"></td>
					</form>


					<td>${item.member_join_date}</td>
					<!-- <td><input type="button" name="detailbutton" id="detailbutton" class="detailbutton" value="상세보기"></td> -->
					<!-- Button trigger modal -->
					 <td><button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#exampleModal">상세보기</button></td> 
					<!-- data-target="#exampleModal" -->
					
					<script>
					$('#exampleModal').on('show.bs.modal',function(event){
						
						
						
					});
					</script>

					
					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1"	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">회원 상세 정보</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
								
								 <ul>
								<li>
								<c:out value="${item.member_no}"></c:out>
								</li>
								<li>
								<c:out value="${item.member_id}"></c:out>
								</li>
								<li>
								<c:out value="${item.member_name}"></c:out>
								</li>
								<li>
								<c:out value="${item.member_nick}"></c:out>
								</li>
								<li>
								<c:out value="${item.member_birth}"></c:out>
								</li>
								<li>
								<c:out value="${item.member_phone}"></c:out>
								</li>
								<li>
								<c:out value="${item.member_zipcode}"></c:out>
								</li>
								<li>
								<c:out value="${item.member_addr}"></c:out>
								</li>
								<li>
								<c:out value="${item.member_point}"></c:out>
								</li>
								<li>
								<c:out value="${item.member_level}"></c:out>
								</li>
								<li>
								<c:out value="${item.member_email}"></c:out>
								</li>
								<li>
								<c:out value="${item.member_join_date}"></c:out>
								</li>
								</ul> 
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</tr>
				
				
				
				
				
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