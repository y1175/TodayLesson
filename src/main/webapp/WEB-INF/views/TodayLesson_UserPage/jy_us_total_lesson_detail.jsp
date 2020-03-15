<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>

$(document).ready(function() {
	
	
	
	// 온라인 클래스의 경우 주소가 없음 > 그니까 온라인의 경우(온라인은 타입 3번) 아예 그 부분을 hide시켜버림
	let state = ${dto.lesson_type};
	console.log(state);
	if ( state == 3 ) {
		$('.layer').hide();
	} else {
		$('.layer').show();
	}
	
	
	// 썸머노트로 작성한 부분을 html코드로 변환해서 가져옴
	$('#summer').html();

	
	
	
});



</script>




</head>
<body>

<!-- 레슨명, 이런 기본적인건 옆에 배치 -->

레슨명
<br><c:out value="${dto.lesson_title }"/><br>


이 강의는 "
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
"에 관심이 있는 분들을 위한 강의이며,
<br>
총 <c:out value="${dto.lesson_number}"/>강으로 구성되어 있습니다.

<!-- 이 위에 멘트는 다회성, 온라인에만 나오게  -->

<br>
레슨 내용
<br>
<div class="summer">
${dto.lesson_content}
</div>

수강 가능한 최대 주니어수
<br>
<c:out value="${dto.lesson_member_max}"/><br>

현재 수강 중인 주니어 수
<br>
<c:out value="${dto.lesson_junior_count}"/><br>

수강 가능한 주니어 수 
<br>
<c:set var="possible_junior" value="${dto.lesson_member_max - dto.lesson_junior_count}"/>
<c:out value="${possible_junior}"/><br>


카테고리
<br>
<c:choose>

<c:when test="${dto.lesson_category == 1}">
<c:out value="운동"/><br>
</c:when>

<c:when test="${dto.lesson_category == 2}">
<c:out value="교육"/><br>
</c:when>

<c:when test="${dto.lesson_category == 3}">
<c:out value="핸드메이드"/><br>
</c:when>

<c:when test="${dto.lesson_category == 4}">
<c:out value="it"/><br>
</c:when>

<c:otherwise>
<c:out value="요리"/><br>
</c:otherwise>

</c:choose>

레슨 가격 
<br>
<c:out value="${dto.lesson_cost}"/><br>

레슨 판매 기간
<br>
<c:out value="${dto.lesson_open_period}"/> ~ <c:out value="${dto.lesson_close_period}"/><br> 

레슨 타입
<br>
<c:choose>

<c:when test="${dto.lesson_type == 1}">
<c:out value="원데이 클래스"/><br>
</c:when>

<c:when test="${dto.lesson_type == 2}">
<c:out value="다회성 클래스"/><br>
</c:when>

<c:otherwise>
<c:out value="온라인 클래스"/><br>
</c:otherwise>

</c:choose>

<div class="layer">
레슨 시간 <c:out value="${dto.lesson_time}"/><br>

레슨 주소<br> 
우편번호<c:out value="${dto.lesson_zipno}"/><br>
주소<c:out value="${dto.lesson_addr}"/><br>
<!-- 여기에 map가져오기 -->

<div id="map" style="width:750px;height:350px;"></div>

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

시니어 명<c:out value="${dto.lesson_senior_title}"/><br>

시니어 소개
<div class="summer">
${dto.lesson_senior_content}
</div>

<a href="${pageContext.request.contextPath }/total_lesson_list">목록으로</a>
</body>
</html>