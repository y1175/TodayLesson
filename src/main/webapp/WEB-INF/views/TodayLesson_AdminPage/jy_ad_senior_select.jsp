<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/jy_mul_ad_sn_data3.css?ver=1">  
<!-- CSSstyle -->
   <style type="text/css">
      .hs_ad_main_asidenav_nav_Senior_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle -->
<title>Insert title here</title>
<script>
	$('document').ready(function() {

		let bank_code = "${dto.senior_bank_name}";
		let token = "${token}";

		console.log(bank_code);
		console.log(token);

		$.ajax({
			method : 'get',
			url : 'https://api.iamport.kr/banks',
			headers : {
				"Authorization" : token
			}
		}).done(function(msg) {
			console.log(msg);
			let bank_name = msg.response;

			for (var i = 0; i < bank_name.length; i++) {
				console.log(bank_name[i]);
				console.log(bank_name[i].code);
				console.log(bank_name[i].name);
				//console.log(bank_code);

				if (bank_name[i].code == bank_code) {
					let senior_bank_name = bank_name[i].name;
					$('#bank_name').append(senior_bank_name);
					break;
				}
			}

		})
	});
</script>

</head>
<body>
	<div id="jy_container">

		<h2 style="text-align: center;"><b>시니어 상세 보기</b></h2>
		<br>
		<ul>
			<li><b>시니어 번호</b><span class="jy_text"> <c:out
						value="${dto.senior_no }" /></span></li>

			<li><b>시니어 아이디</b> <span class="jy_text"> <c:out
						value="${dto.member_id}" /></span></li>

			<li><b>시니어 이메일</b> <span class="jy_text"> <c:out
						value="${dto.senior_email}" /></span></li>

			<li><b>시니어 연락처</b><span class="jy_text"> <c:out
						value="${dto.senior_phone}" /></span></li>

			<li><b>시니어 닉네임 </b><span class="jy_text"> <c:out
						value="${dto.senior_nick}" /></span></li>
			<li><b>시니어 등록일 </b><span class="jy_text"> <c:out
						value="${dto.senior_register_date}" /></span></li>

			<li><b>시니어 은행명</b> <span class="jy_text">
					<div id="bank_name"></div>
			</span></li>

			<li><b>시니어 예금주</b> <span class="jy_text"> <c:out
						value="${dto.senior_account_name}" /></span></li>

			<li><b>시니어 계좌번호</b><span class="jy_text"> <c:out
						value="${dto.senior_account_num}" /></span></li>

			<li><b>시니어 사업자 번호</b><span class="jy_text"> <c:out
						value="${dto.senior_crno }" /></span></li>

			<li><b>시니어 상호명</b> <span class="jy_text"> <c:out
						value="${dto.senior_crno_name}" /></span></li>

		</ul>
<br>
		<table class="table ">
			<thead>
				<tr  style="background-color: #fff2f2;">
					<th scope="col">#</th>
					<th scope="col">레슨 제목</th>
					<th scope="col">레슨 타입</th>
					<th scope="col">레슨 결과</th>
					<th scope="col">수강생수</th>
					<th scope="col">레슨 등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.lesson_no}</td>
						<td><a
							href="${pageContext.request.contextPath}/todaylessonadmin/admin_lesson_detail/${list.lesson_no }">${list.lesson_title}</a></td>
						<c:choose>

							<c:when test="${list.lesson_type == 1}">
								<td><c:out value="원데이 클래스" /></td>
							</c:when>

							<c:when test="${list.lesson_type == 2}">
								<td><c:out value="다회성 클래스" /></td>
							</c:when>

							<c:otherwise>
								<td><c:out value="온라인 클래스" /></td>
							</c:otherwise>

						</c:choose>

						<c:choose>

							<c:when test="${list.lesson_result == 0}">
								<td>신청완료</td>
							</c:when>

							<c:when test="${list.lesson_result == 1}">
								<td>심사중</td>
							</c:when>

							<c:when test="${list.lesson_result == 2}">
								<td>레슨승인</td>
							</c:when>

							<c:otherwise>
								<td>레슨거절</td>
							</c:otherwise>

						</c:choose>

						<td>${list.lesson_junior_count}</td>
						<td>${list.lesson_register_date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button id="reward_point" class="ej_btn" onclick="location.href='${pageContext.request.contextPath }/todaylessonadmin/all_senior'" style="margin-top: 10px;">목록으로</button>
	</div>
</body>
</html>