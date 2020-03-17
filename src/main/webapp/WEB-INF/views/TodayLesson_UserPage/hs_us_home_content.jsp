<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
<!-- jQuery -->
<!--Main HOME style-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hs_us_home_content.css?ver=1">
<!--Main HOME style-->
<!--Main HOME JS-->
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/JS/hs_us_home_content.js"> --%>
<!--Main HOME JS-->


</head>
<body>
   <div id="imgslide" class="alldiv">
		<div class="imgbox">
			<div class="slide">
				<a><img src="resources/Banner/main_banner1.jpg" alt="s"></a>
				<a><img src="resources/Banner/main_banner2.jpg" alt="s"></a>
				<a><img src="resources/Banner/main_banner3.jpg" alt="s"></a>
				<a><img src="resources/Banner/main_banner4.jpg" alt="s"></a>
			</div>
		</div>
	</div>	
	<script type="text/javascript">

	var idx = 0; // 함수 호출 횟수
	var i=0; // 이미지 인덱스
	var imgNum=4; // 이미지 개수
	var imgSize=100; // 이미지 크기
	function imgSlide() {
	   idx = idx + 1; // 함수 호출 회수 증가
		i=(idx-1)%imgNum; // 이미지는 3개를 돌려 쓸거라서
	  // idx-1을 해주는 이유 : idx>1 일 때부터 리스트 삭제, 추가가 이루어짐(1초 뒤부터 리스트 추가)
		if(i==0){
			i=imgNum; // 1,2,3,1,2,3 이 반복되어야 함
		}
		
		$('.slide').css({"left":"0px"}); // 0 -> -imgSize을 반복하기 위해
		
	   	$('.slide').stop().animate({'left' : -imgSize+"%"}, "slow");
		if(idx>1){ //idx>0으로 하면 첫 번째 리스트가 슬라이스되기전에 삭제가 된다.
			$('.slide>a:first').remove(); // 제일 첫 <a> 삭제
			$('.slide').append('<a><img src="/resources/Banner/main_banner'+i+'.jpg" alt="s">');
	    //마지막에 <a> 추가
		}
		
	}
	// 3초에 한번 함수를 실행
	setInterval(function() { imgSlide() }, 3000);
	</script>

</body>
</html>