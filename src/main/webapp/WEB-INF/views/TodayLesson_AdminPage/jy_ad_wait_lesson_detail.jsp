<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/jy_mul_ad_sn_data3.css">  

<script>

$('document').ready(function() {
	

	// 온라인 클래스의 경우 주소가 없음 > 그니까 온라인의 경우(온라인은 타입 3번) 아예 그 부분을 hide시켜버림
	let state = ${dto.lesson_type};
	console.log(state);
	if ( state == 3 ) {
		$('.offline_lesson').hide();
	} else {
		$('.offline_lesson').show();
	}

	// 썸머노트로 작성한 부분을 html코드로 변환해서 가져옴
	$('#summer').html();
	
	

		
		
		let bank_code= "${dto.senior_bank_name}";
		let token = "${token}";

		console.log(bank_code);
		console.log(token);

		$.ajax({
		   method: 'get',
		   url: 'https://api.iamport.kr/banks',
		    headers: { 
		       "Authorization": token
		   }
		}).done(function(msg) {
		      console.log(msg);
		      let bank_name = msg.response;
			 console.log(bank_name.length);
		      for (var i = 0; i < bank_name.length; i++) {   
		         if (bank_name[i].code == bank_code) {
		            let senior_bank_name = bank_name[i].name;
		            console.log(senior_bank_name);
		            $('#bank_name').append(senior_bank_name);
		            //$('select[name="senior_bank_name"]').find('option[value='+i+']').attr("selected",true);
		            console.log("dddd");
		            break;
		         }
		      }
		      
		   });
		
	});

</script>

</head>
<body>


<div id="jy_container">

<h1>레슨 상세보기</h1>

<ul>
<li>
<b>레슨번호</b>
<span class="jy_text">
<c:out value="${dto.lesson_no }"/>
</span><br>
</li>

<li>
<b>레슨명</b>
<span class="jy_text">
<c:out value="${dto.lesson_title }"/>
</span><br>
</li>

<li>
<b>레슨 내용</b>

<div class="summer">
${dto.lesson_content}
</div>

</li>
<li>
<b>수강생수</b>
<span class="jy_text">

<c:out value="${dto.lesson_member_max}"/>
</span><br>
</li>


<li>
<b>
카테고리
</b>
<span class="jy_text">

<c:choose>

<c:when test="${dto.lesson_category == 1}">
<c:out value="운동"/>
</c:when>

<c:when test="${dto.lesson_category == 2}">
<c:out value="교육"/>
</c:when>

<c:when test="${dto.lesson_category == 3}">
<c:out value="핸드메이드"/>
</c:when>

<c:when test="${dto.lesson_category == 4}">
<c:out value="it"/>
</c:when>

<c:otherwise>
<c:out value="요리"/>
</c:otherwise>

</c:choose>
</span>
<br>
</li>

<li>
<b>얼리버드 여부</b>
<span class="jy_text">
<c:if test="${dto.lesson_earlybird eq 1 }">
<c:out value="Y"/>
</c:if>

<c:if test="${dto.lesson_earlybird eq 0 }">
<c:out value="N"/>
</c:if>

</span>
</li>


<li>
<b>
레슨 가격(정상가)
</b>
<span class="jy_text">
	<fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.lesson_cost }"/>원
</span><br>
</li>
<li>
<b>레슨 판매 기간</b> <span class="jy_text">
<c:out value="${dto.lesson_open_period}"/> ~
<c:out value="${dto.lesson_close_period}"/>
</span><br> 
</li>
<li>
<b>
레슨 타입
</b>

<span class="jy_text">

<c:choose>

<c:when test="${dto.lesson_type == 1}">
<c:out value="원데이 클래스"/>
</c:when>

<c:when test="${dto.lesson_type == 2}">
<c:out value="다회성 클래스"/>
</c:when>

<c:otherwise>
<c:out value="온라인 클래스"/>
</c:otherwise>

</c:choose>

</span>
</li>

<div class="offline_lesson">
<li>
<b>
레슨 시간 
</b>
<span class="jy_text">

<c:out value="${dto.lesson_date_time}"/>
</span><br>
</li>

<li style="text-align: center; margin: 30px 0px">
<b >레슨 주소</b><br> 
</li>
<li>
<b>우편번호</b>
<span class="jy_text">

<c:out value="${dto.lesson_zipno}"/>
</span>

<br>
</li>
<li>
<b>주소</b>
<span class="jy_text">


<c:out value="${dto.lesson_addr}"/>
</span><br>
<!-- 여기에 map가져오기 -->
</li>

<div id="map" style="width:750px;height:350px; margin: 0px auto"></div>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c30db34dfed42d05a59b83a50829000e"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(${dto.lesson_lat}, ${dto.lesson_long}), // 지도의 중심좌표
	        level: 1, // 지도의 확대 레벨
	        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	    }; 
	// 지도를 생성한다 
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	// 지도에 마커를 생성하고 표시한다
	var marker = new kakao.maps.Marker({
	    position: new kakao.maps.LatLng(${dto.lesson_lat}, ${dto.lesson_long}), // 마커의 좌표
	    map: map // 마커를 표시할 지도 
	});
</script>

</div>

<li>
<b>총 강의 수</b>
<span class="jy_text">
<c:out value="${dto.lesson_number}"/>강<br>
</span>
</li>

<li>
<b>시니어 명</b>
<span class="jy_text">
<c:out value="${dto.lesson_senior_title}"/><br>
</span>
</li>
<li>
<b>시니어 소개</b>

<div class="summer">
${dto.lesson_senior_content}
</div>
</li>


<hr>


<li>
<b>시니어 아이디</b>
<span class="jy_text">
	<c:out value="${dto.member_id}" />
</span>
</li>

<li>
<b>시니어 이메일</b>
<span class="jy_text">
	<c:out value="${dto.senior_email}" />
</span>
</li>

<li>
<b>시니어 사업자 번호</b>
<span class="jy_text">

	<c:out value="${dto.senior_crno}" />
</span>
</li>


<li>
<b>시니어 사업자명</b>
<span class="jy_text">

	<c:out value="${dto.senior_crno_name}" />
	

</span>
</li>



<li>
<b>시니어 닉네임</b>
<span class="jy_text">
	<c:out value="${dto.senior_nick}" />
</span>
</li>


<li>
<b>은행명</b>
<span class="jy_text">
<div id = "bank_name"></div>
</span>
</li>

<li>
<b>예금 주</b>
<span class="jy_text">
	<c:out value="${dto.senior_account_name}" />
</span>
</li>

<li>
<b>계좌번호</b>
<span class="jy_text">
	<c:out value="${dto.senior_account_num}" />
</span>
</li>

	</ul>







<div class="row" style="margin: 0px; ">



<div class="col-md-4">

<table class="table " style="font-size: 15px;">
		<thead>
		<tr class="table-warning">
		<th colspan="4" style="text-align: center;">
					수락된 레슨 목록
					</th>
		</tr>
			<tr class="table-warning">
				<th scope="col">#</th>
				<th scope="col">레슨명</th>
				<th scope="col">카테고리</th>
				<th scope="col">레슨타입</th>

			</tr>
		</thead>
		<tbody>
	
				
<c:forEach var="item" items="${list}">
<c:if test="${item.lesson_result == 2}">

<tr>
<td>${item.lesson_no}</td>
<td><a href="${pageContext.request.contextPath }/todaylessonadmin/admin_lesson_detail/${item.lesson_no}">${item.lesson_title}</a></td>


<c:choose>
<c:when test="${item.lesson_category eq 1}">
<td><c:out value="운동"/></td>
</c:when>

<c:when test="${item.lesson_category eq 2}">
<td><c:out value="교육"/></td>
</c:when>

<c:when test="${item.lesson_category eq 3}">
<td><c:out value="핸드메이드"/></td>
</c:when>

<c:when test="${item.lesson_category eq 4}">
<td><c:out value="it"/></td>
</c:when>

<c:otherwise>
<td><c:out value="요리"/></td>
</c:otherwise>

</c:choose>


<c:choose>

<c:when test="${item.lesson_type eq 1}">
<td><c:out value="원데이"/></td>
</c:when>

<c:when test="${item.lesson_type eq 2}">
<td><c:out value="다회성"/></td>
</c:when>

<c:otherwise>
<td><c:out value="온라인"/></td>
</c:otherwise>

</c:choose>
</tr>
</c:if>
</c:forEach>
</tbody>
</table>
</div>

	

	
	
<div class="col-md-4">

	
<table class="table " style="font-size: 15px;">
		<thead>
		<tr class="table-warning">
		<th colspan="4" style="text-align: center;">
					거절된 레슨 목록
					</th>
		</tr>
		
			<tr class="table-warning">
				<th scope="col">#</th>
				<th scope="col">레슨명</th>
				<th scope="col">카테고리</th>
				<th scope="col">레슨타입</th>

			</tr>
		</thead>
		<tbody>
		
				
<c:forEach var="item" items="${list}">
	<c:if test="${item.lesson_result == '3'}">

<tr>
<td>${item.lesson_no}</td>
<td><a href="${pageContext.request.contextPath }/todaylessonadmin/admin_lesson_detail/${item.lesson_no}">${item.lesson_title}</a></td>


<c:choose>
<c:when test="${item.lesson_category eq 1}">
<td><c:out value="운동"/></td>
</c:when>

<c:when test="${item.lesson_category eq 2}">
<td><c:out value="교육"/></td>
</c:when>

<c:when test="${item.lesson_category eq 3}">
<td><c:out value="핸드메이드"/></td>
</c:when>

<c:when test="${item.lesson_category eq 4}">
<td><c:out value="it"/></td>
</c:when>

<c:otherwise>
<td><c:out value="요리"/></td>
</c:otherwise>

</c:choose>


<c:choose>

<c:when test="${item.lesson_type eq 1}">
<td><c:out value="원데이"/></td>
</c:when>

<c:when test="${item.lesson_type eq 2}">
<td><c:out value="다회성"/></td>
</c:when>

<c:otherwise>
<td><c:out value="온라인"/></td>
</c:otherwise>

</c:choose>
</tr>
</c:if>
</c:forEach>
</tbody>
</table>
	
	</div>
	
<div class="col-md-4">
<table class="table " style="font-size: 15px;">
		<thead>
		<tr class="table-warning">
		<th colspan="4" style="text-align: center;">
					심사중인 레슨 목록
					</th>
		</tr>
		
			<tr class="table-warning">
				<th scope="col">#</th>
				<th scope="col">레슨명</th>
				<th scope="col">카테고리</th>
				<th scope="col">레슨타입</th>

			</tr>
		</thead>
		<tbody>
		
				
<c:forEach var="item" items="${list}">
<c:if test="${item.lesson_result == 1}">

<tr>
<td>${item.lesson_no}</td>
<td><a href="${pageContext.request.contextPath }/todaylessonadmin/admin_lesson_detail/${item.lesson_no}">${item.lesson_title}</a></td>


<c:choose>
<c:when test="${item.lesson_category eq 1}">
<td><c:out value="운동"/></td>
</c:when>

<c:when test="${item.lesson_category eq 2}">
<td><c:out value="교육"/></td>
</c:when>

<c:when test="${item.lesson_category eq 3}">
<td><c:out value="핸드메이드"/></td>
</c:when>

<c:when test="${item.lesson_category eq 4}">
<td><c:out value="it"/></td>
</c:when>

<c:otherwise>
<td><c:out value="요리"/></td>
</c:otherwise>

</c:choose>


<c:choose>

<c:when test="${item.lesson_type eq 1}">
<td><c:out value="원데이"/></td>
</c:when>

<c:when test="${item.lesson_type eq 2}">
<td><c:out value="다회성"/></td>
</c:when>

<c:otherwise>
<td><c:out value="온라인"/></td>
</c:otherwise>

</c:choose>
</tr>
</c:if>
</c:forEach>
</tbody>
</table>
</div>


	</div>


<div>
<button id="reward_point" class="ej_btn" onclick="location.href='${pageContext.request.contextPath }/todaylessonadmin/wait_lesson'">목록으로</button>
<button id="reward_point" class="ej_btn2" onclick="window.open('${pageContext.request.contextPath}/todaylessonadmin/lesson_result_update/${dto.lesson_no}','lesson_result_update','width=570,height=237')">심사하기</button>
</div>

</div>
</body>


</html>