<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/hm_ad_user_memmanage.css?ver=3">
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/JS/hm_ad_user_memmanagelist.js?ver=5"></script>
<!-- CSSstyle -->
   <style type="text/css">
      .hs_ad_main_asidenav_nav_Member_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle -->

<!-- 모달 비활성때문에 해줌...흑흑흑흑흐긓 -->
<style>
  .modal-backdrop {
        z-index: -1;
    }
</style>


</head>
<body>
 <div stlye="width:100%;">
 <h2 style="margin-top:40px; text-align: center;">회원 관리</h2>
 </div>


<!-- 검색 --> 
 <nav class="navbar navbar-expand-lg navbar-light bg-light" style="width:23%; margin:40px auto;">
  <div class="collapse navbar-collapse" id="navbarSupportedContent" >
 <form class="form-inline my-2 my-lg-0" method ="get" action="${pageContext.request.contextPath}/todaylessonadmin/admin_hm_memmanage?currPage=${page.startBlock }"
 style="margin:0px auto;">
 <select name="search" class="custom-select mr-sm-3" id="inlineFormCustomSelect" style="height:34px; font-size: 1em;">
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
<!-- 검색완료 -->




	<table class="table" style="width: 80%; margin: 0px auto 40px;">
		<thead>
			<tr class="table-warning">
				<th scope="col">#</th><!-- 보여줘야함 -->
				<th scope="col">아이디</th><!-- 보여줘야함 -->
				<th scope="col">이름</th><!-- 보여줘야함 -->
				<th scope="col">닉네임</th><!-- 보여줘야함 -->
				<th scope="col">생일</th>
				<th scope="col">휴대전화</th>
				<th scope="col">우편번호</th>
				<th scope="col">주소</th>
				<th scope="col">적립금</th><!-- 보여줘야함 -->
				<th scope="col">회원등급</th><!-- 보여줘야함 -->
				<th scope="col">이메일</th>
				<th scope="col">가입일</th><!-- 보여줘야함 -->
				<th scope="col">상세보기</th><!-- 보여줘야함 -->
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
			

							
				<tr onclick="PopupInfo(this)">
					<td>${item.member_no}</td> <!-- 보여줘야함 -->
					<td>${item.member_id}</td> <!-- 보여줘야함 -->
					<td>${item.member_name}</td> <!-- 보여줘야함 -->
					<td>${item.member_nick}</td> <!-- 보여줘야함 -->
					<td>${item.member_birth}</td>
					<td>${item.member_phone}</td>
					<td>${item.member_zipcode}</td>
					<td>${item.member_addr}</td>
					<td>${item.member_point}</td> <!-- 보여줘야함 -->
					<td>${item.member_level}</td>
					<td>${item.member_email}</td>
					<td>${item.member_join_date}</td>
						


					<!-- 회원등급 & 권한 조정 -->
					<form method="post" action="adminmember_levelupdate">
						<td><input type="hidden" name="member_id" value="${item.member_id}"> <select id="member_level"
							name="member_level">
								<option value="">${item.member_level}레벨</option>
								<option value="0">0 관리자</option>
								<option value="1">1 주니어</option>
								<option value="2">2 시니어</option>
								<option value="3">3 블 락</option>
						</select> <input type="submit" class="btn btn-secondary" value="수정"></td>
					</form>

					<td>${item.member_join_date}</td>
					

					
					
					 <td><button type="button" id="detailbutton" class="btn btn-secondary" onclick="PopupInfo(this)" data-toggle="modal"  data-target="#exampleModal" >상세보기</button></td> 
					<!-- data-target="#exampleModal" -->
					<script>
					$('#exampleModal').on('shown.bs.modal', function (event) {
						  $('#exampleModal').trigger('focus')
						})
					
					
					</script>

				   <script>
				     function PopupInfo(clicked_element) {
				    	 
				    	
				    	 
				
					   var row_td = clicked_element.getElementsByTagName("td");
					   var modal = document.getElementById("exampleModal");
					   
					   var result = "";
					   
					   result += "아이디 : "+row_td[1].innerHTML+"<br/>"
					   		+ "이름 :" +row_td[2].innerHTML+"님"+"<br/>"
					   		+ "닉네임 :" +row_td[3].innerHTML+"<br/>" 
					   		+ "생일 :" +row_td[4].innerHTML+"<br/>"
					   		+ "휴대전화 :" +row_td[5].innerHTML+"<br/>"
					   		+ "우편번호 :" +row_td[6].innerHTML+"<br/>"
					   		+ "주소 :" +row_td[7].innerHTML+"<br/>"
					   		+ "적립금 :" +row_td[8].innerHTML+"<br/>"
					   		+ "회원레벨 :" +row_td[9].innerHTML+"레벨"+"<br/>"
					   		+ "이메일 :" +row_td[10].innerHTML+"<br/>"
					   		+ "가입일자 :" +row_td[11].innerHTML+"<br/>";
					   		
					   		
					   document.getElementById("member_detail").innerHTML = result;
					
					}
		
				</script>




		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog" role="document">
   		<div class="modal-content">
        <div class="modal-header">
        <h4 class="modal-title" id="exampleModallabel">회원 상세 정보</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
        </button>
      	</div>
     	 <div class="modal-body">
     	 			<p id="member_detail">
     	 			</p>
          		
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        </div>
        </div>
        </div>
		 
		
				</tr>
				
			
				
			</c:forEach>
	</tbody>
	</table>
	
	
	
			
	















<ul class="pagination pagination-danger">
<c:if test="${page.prev }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath}/todaylessonadmin/admin_hm_memmanage?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt }">PREV
</a></li>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath}/todaylessonadmin/admin_hm_memmanage?currPage=${index }&search=${search}&searchtxt=${searchtxt}">${index }
</a></li>
</c:if>

<c:if test="${index==page.currPage }">
<li class="active page-item"><a href="javascript:void(0);" class="page-link">${index }</a></li>
</c:if>
</c:forEach>

<c:if test="${page.next }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath}/todaylessonadmin/admin_hm_memmanage?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}">NEXT
</a></li>
</c:if>
</ul>


</body>
</html>