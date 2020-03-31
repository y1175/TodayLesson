<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>TodayLesson</title>
</head>

<body>
   <h2>회원가입</h2>
   <form method="post" id="smsForm">
      <label>연락처</label>
      <input type="text" name="to" id="text1" placeholder=" 전화번호 입력 " required="required" value="${to}"/>
      <input type="hidden" name="text" id="text2" > 
      <input type="button" name="sendSMS" id="sendSMS" value="인증번호 요청" /><br>
      <label>인증번호 확인:</label>
      <input type="text" name="numcheck" id="numcheck" required="required" placeholder="인증번호 입력" onkeyup="smscheckfunction()"><br>
      <div class="alert alert-success" id="alert-success2">인증번호가 일치합니다.</div>
      <div class="alert alert-danger" id="alert-danger2">인증번호가 일치하지않습니다.</div>
      <input type="hidden" id="authNum" value="${auth_num}">
    </form>
<form method="post" action="/joinresult">
<input type="hidden" name="phone" value="${to }"/>
<label>아이디</label>
<input type="text" name="id" id="id" required="required" placeholder="아이디">
<button type="button" class="btn btn-primary" id="multicheck">중복확인</button><br>
<div id="checkMsg"></div>

<label>비밀번호</label>
<input type="password" name="pwd" id="pwd" required="required" placeholder="비밀번호"><br>
<label>비밀번호확인</label>
<input type="password" name="pwdcheck" id="pwdcheck" required="required" placeholder="비밀번호확인"
onkeyup="passwordCheckFunction();"
><br>
<div class="alert alert-success" id="alert-success">비밀번호가
						일치합니다.</div>
					<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지
						않습니다.</div>

<label>이름</label>
<input type="text" name="name" id="name" placeholder="이름"><br>
<label>생년월일</label>
<input type="date" name="birth" id="birth" ><br>
 
 <label>e-mail</label>
<input type="email" name="email" id="email" placeholder="example@email.com"><br>
 
<label for='addr'>주소</label>
					<div class='form-row'>
						<div class='col-5'>
							<input type="text" id="sample4_postcode" name='zipcode'
								placeholder="우편번호" class='form-control'>
						</div>
						<input type="button" onclick="sample4_execDaumPostcode()"
							value="우편번호 찾기" readonly="readonly" class='btn btn-primary'><br>
					</div>
					<div class='juso'>
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소"
							name="roadaddr" readonly="readonly" class="form-control">
						<input type="radio" id='roadAddress' name='addrselect' value="0"
							required><label for="addrselect">도로명주소 선택</label> <br>

						<input type="text" id="sample4_jibunAddress" placeholder="지번주소"
							name="jibunaddr" readonly="readonly" class="form-control">
						<input type="radio" id='jibunAddress' name='addrselect' value="1"><label
							for="addrselect">지번주소 선택</label><br>
					</div>
					<span id="guide" style="color: #999"></span> <label
						for="detailaddr">상세주소</label> <input type="text" id="detailaddr"
						name="detailaddr" class="form-control"> 


<label>닉네일</label>
<input type="text" name="nick" placeholder="닉네임"><br>
<button type="submit" id="submit" class="btn btn-primary">회원가입</button><br>
<!-- 시큐리티 토큰 -->
    <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
</form>

<!-- Join JS -->
   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   <script type="text/javascript" src="resources/JS/yi_findAddr.js"></script>
   <script type="text/javascript" src="resources/JS/yi_todaylesson_join.js"></script>
   <script type="text/javascript" src="resources/JS/ej_smscheck.js"></script>
<!-- Join JS -->

</body>

</html>
