<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
<title>TodayLesson</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/yi_find_id.css?ver=5">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script>



$(document).ready(function() {
	/////////모///달///기///능///////////
	// 1. 모달창 히든 불러오기
	$('#searchBtn').click(function() {
		//시큐리티 csrf토큰
		/* var csrfHeaderName ="${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}"; */ 
		
		$('#background_modal').show();
		
		// 아이디 
		var idV = "";
		// 아이디 값 받고 출력하는 ajax

			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/userSearch?inputName_1="
						+$('#inputName_1').val()+"&inputPhone_1="+$('#inputPhone_1').val(),
						/* beforeSend : function(xhr){
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						}, */
				success:function(data){
					if(data == 0){
						$('#id_value').text("회원 정보를 확인해주세요!");	
					} else {
						$('#id_value').text(data);
						// 아이디값 별도로 저장
						idV = data;
					}
				}
			});
		
		
	});
	
	
	
	
	$('#searchBtn2').click(function() {
		//시큐리티 csrf토큰
		/* var csrfHeaderName ="${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";  */
		
		$('#background_modal').show();
		
		// 아이디 
		var idV = "";
		// 아이디 값 받고 출력하는 ajax

			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/searchPassword?inputId_2="
						+$('#inputId_2').val()+"&inputEmail_2="+$('#input_2').val(),
						/* beforeSend : function(xhr){
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						}, */
				success:function(data){
					if(data == 0){
						$('#id_value').text("회원 정보를 확인해주세요!");	
					} else {
						$('#id_value').text("이메일 전송완료");
						// 아이디값 별도로 저장
						idV = data;
					}
				}
			});
		
		
	});
	
	
	
	
	
	// 2. 모달창 닫기 버튼
	$('.close').on('click', function() {
		$('#background_modal').hide();
	});
	// 3. 모달창 위도우 클릭 시 닫기
	$(window).on('click', function() {
		if (event.target == $('#background_modal').get(0)) {
            $('#background_modal').hide();
         }
	});
	
	
	

	
	
	
});

</script>
</head>
<body>
<div class="findidmain">

<h2>아이디 찾기<i class='fas fa-search' style='font-size:36px'></i>
</h2>
<h5>기존에 가입하신 <b>이름</b>과 <b>휴대폰번호</b>를 입력해주시면 <b>아이디</b>가 출력됩니다.<br>가입하신 아이디를 확인하세요.</h5>
			
	<div class="idline">
	<div style="width:70%; margin:40px auto;">
					<div class="form-group findid">
						<label for="inputName_1">이름</label>
							<input type="text" class="form-control" id="inputName_1" name="inputName_1" placeholder="ex) 갓혜미">					
					</div>
					<div class="form-group findid">
						<label for="inputPhone_1">휴대폰번호</label>
							<input type="text" class="form-control" id="inputPhone_1" name="inputPhone_1" placeholder="ex) 01012341234" aria-describedby="phoneHelp">
							<small id="phoneHelp" class="form-text text-muted">"-"를 빼고 입력하세요.</small>					
					</div>
	</div>				
	</div>
		<div class="submitdiv">
		<div class="submitdivinside">
					<div class="form-group">				
						<button id="searchBtn" type="button" class="findidbtn">확인</button>
					<button type="reset" href="${pageContext.request.contextPath}/todaylessonlogin" class="findidbtn2">취소</button>
					</div>
					</div>
					
					<div class="gotoid">
<p>아이디로 비밀번호를 찾으려면? <a class="findId" href="/findPw">비밀번호 찾기 바로가기</a>
<svg class="bi bi-box-arrow-in-right" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M8.146 11.354a.5.5 0 010-.708L10.793 8 8.146 5.354a.5.5 0 11.708-.708l3 3a.5.5 0 010 .708l-3 3a.5.5 0 01-.708 0z" clip-rule="evenodd"/>
  <path fill-rule="evenodd" d="M1 8a.5.5 0 01.5-.5h9a.5.5 0 010 1h-9A.5.5 0 011 8z" clip-rule="evenodd"/>
  <path fill-rule="evenodd" d="M13.5 14.5A1.5 1.5 0 0015 13V3a1.5 1.5 0 00-1.5-1.5h-8A1.5 1.5 0 004 3v1.5a.5.5 0 001 0V3a.5.5 0 01.5-.5h8a.5.5 0 01.5.5v10a.5.5 0 01-.5.5h-8A.5.5 0 015 13v-1.5a.5.5 0 00-1 0V13a1.5 1.5 0 001.5 1.5h8z" clip-rule="evenodd"/>
</svg>
</p>
</div>
				</div>
			
				
			<%-- 	
				<div id="searchP" style="display: none;">
					<div class="form-group">
						<label for="inputId">아이디</label>
						<div>
							<input type="text" class="form-control" id="inputId_2" name="inputId_2" placeholder="ex) godmisu">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold" for="inputEmail_2">이메일</label>
						<div>
							<input type="email" class="form-control" id="inputEmail_2"	name="inputEmail_2" placeholder="ex) E-mail@gmail.com">
						</div>
					</div>
					<div class="form-group">
						<button id="searchBtn2" type="button" class="btn btn-primary btn-block">확인</button>
					<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
				</div>
				</div> --%>
				
				
				<form id="searchP"  style="display: none;">
				<div class="form-group">
				<label for="inputId">아이디</label>
						<div>
							<input type="text" class="form-control" id="inputId_2" name="inputId_2" placeholder="ex) godmisu">
						</div>
				</div>
				<div class="form-group">
						<label class="font-weight-bold" for="inputEmail_2">이메일</label>
						<div>
							<input type="email" class="form-control" id="inputEmail_2"	name="inputEmail_2" placeholder="ex) E-mail@gmail.com">
						</div>
					</div>
				<div class="form-group">
				<input type="submit" id="searchBtn2" class="btn btn-primary btn-block" value="확인">
				<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
				</div>
				</form>
				
				
				
<div class="submitdiv">
		<div class="submitdivinside">			
			
<div id="background_modal" class="background_modal" style="display:none">
	<div class="modal_contents">
		<h4>
			<b>회원님의 아이디는?</b><span class="close">&times;</span>
		</h4><br>
			<h2 id="id_value"></h2>
		<br>
		<button type="button" id="pwSearch_btn" class="btn peach-gradient btn-rounded waves-effect"></button>
<!-- 		<i class="fa fa-envelope"></i>비밀번호 찾기</button> -->
	</div>



	</div>
	</div>
	</div>
</div>
</body>
</html>




