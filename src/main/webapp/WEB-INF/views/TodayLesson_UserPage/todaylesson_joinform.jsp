<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>TodayLesson</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/yi_joinform.css?ver=2">
</head>
<body>
<div id="yi_container">
   <h2>회원가입</h2>
   <form method="post" id="smsForm">
 	<div class="form-group row">
      <label for="text1" class="col-sm-2 col-form-label">연락처</label>
      <div class="col-sm-3">
      <input type="text" class="form-control" name="to" id="text1" placeholder=" 전화번호 입력 " required="required" value="${to}"/>
      <input type="hidden" name="text" id="text2" > 
      </div>
      <div class="col-sm-2">
      <input type="button" class="joinform-btn" name="sendSMS" id="sendSMS" value="인증번호 요청" />
      </div>
    </div>
    
    <div class="form-group row">
      <label for="numcheck" class="col-sm-2 col-form-label">인증번호</label>
      <div class="col-sm-3">
      <input type="text" class="form-control" name="numcheck" id="numcheck" required="required" placeholder="인증번호 입력" onkeyup="smscheckfunction()"><br>
      </div>
      <div class="alert alert-success" id="alert-success2">인증번호가 일치합니다.</div>
      <div class="alert alert-danger" id="alert-danger2">인증번호가 일치하지않습니다.</div>
      <input type="hidden" id="authNum" value="${auth_num}">
	</div>
    </form>
    
<form method="post" action="${pageContext.request.contextPath}/joinresult">
<input type="hidden" name="phone" value="${to }"/>

<div class="form-group row">
<label for="id" class="col-sm-2 col-form-label">아이디</label>
<div class="col-sm-3">
<input type="text" class="form-control" name="id" id="id" required="required" placeholder="아이디">
</div>
 <div class="col-sm-2">
<input type="button" class="joinform-btn" id="multicheck" value="중복확인">
</div>
<div id="checkMsg"></div>
</div>

<div class="form-group row">
<label for="pwd" class="col-sm-2 col-form-label">비밀번호</label>
<div class="col-sm-3">
<input type="password" class="form-control" name="pwd" id="pwd" required="required" placeholder="비밀번호">
</div>

</div>

<div class="form-group row">
<label for="pwdcheck" class="col-sm-2 col-form-label">비밀번호확인</label>
<div class="col-sm-3">
<input type="password" class="form-control" name="pwdcheck" id="pwdcheck" required="required" placeholder="비밀번호확인"
onkeyup="passwordCheckFunction();">
</div>
<div class="alert alert-success" id="alert-success">비밀번호가
						일치합니다.</div>
					<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지
						않습니다.</div>
</div>

<div class="form-group row">
<label for="name" class="col-sm-2 col-form-label">이름</label>
<div class="col-sm-3">
<input type="text" class="form-control" name="name" id="name" placeholder="이름">
</div>
</div>

<div class="form-group row">
<label for="nick" class="col-sm-2 col-form-label">닉네임</label>
<div class="col-sm-3">
<input type="text" class="form-control" name="nick" placeholder="닉네임">
</div>
</div>

<div class="form-group row">
<label for="birth" class="col-sm-2 col-form-label">생년월일</label>
<div class="col-sm-3">
<input type="date" class="form-control" name="birth" id="birth" ><br>
 </div>
 </div>
 
 <div class="form-group row">
 <label for="email" class="col-sm-2 col-form-label">e-mail</label>
 <div class="col-sm-3">
<input type="email" class="form-control" name="email" id="email" placeholder="example@email.com">
 </div>
 </div>

 <div class="form-group row">
<label for='addr' class="col-sm-2 col-form-label">주소</label>				
						<div class="col-sm-3">
							<input type="text" id="sample4_postcode" name='zipcode'
								placeholder="우편번호" class='form-control'>
						</div>
						 <div class="col-sm-2">
						<input type="button" onclick="sample4_execDaumPostcode()"
							value="우편번호 찾기" readonly="readonly" class='joinform-btn'>
							</div>
				</div>





					<div class='juso'>

						<input type="text" id="sample4_roadAddress" placeholder="도로명주소"
							name="roadaddr" readonly="readonly" class="form-control" style="width:60%;">
						<input type="radio" id='roadAddress' name='addrselect' value="0"
							required><label for="addrselect">도로명주소 선택</label>


						<input type="text" id="sample4_jibunAddress" placeholder="지번주소"
							name="jibunaddr" readonly="readonly" class="form-control" style="width:60%;">
						<input type="radio" id='jibunAddress' name='addrselect' value="1">
						<label for="addrselect">지번주소 선택</label>

					</div>
					
					<div class="form-group row">
					<label for="detailaddr" class="col-sm-2 col-form-label">상세주소</label> 
					<div class="col-sm-5">
					<input type="text" class="form-control" id="detailaddr" name="detailaddr"> 
					</div>
					</div>

					 

<button type="submit" id="submit" class="joinform-btn" disabled="disabled">회원가입</button>
<!-- 시큐리티 토큰 -->
    <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
</form>

<!-- jQuery -->
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
<!-- jQuery -->

<!-- Join JS -->
   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/JS/yi_findAddr.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/JS/yi_todaylesson_join.js?ver=1"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/JS/ej_smscheck.js"></script>
<!-- Join JS -->
</div>
</body>

</html>
