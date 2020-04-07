<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/hm_find_pwd.css?ver=3">
<script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"></script>
</head>
<body>

<div class="findpwdmain">
<h2>비밀번호 찾기
<svg class="bi bi-envelope-open" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M.243 6.929l.514-.858L8 10.417l7.243-4.346.514.858L8 11.583.243 6.93z" clip-rule="evenodd"/>
  <path fill-rule="evenodd" d="M7.184 10.68L.752 14.432l-.504-.864L6.68 9.816l.504.864zm1.632 0l6.432 3.752.504-.864L9.32 9.816l-.504.864z" clip-rule="evenodd"/>
  <path fill-rule="evenodd" d="M8.47 1.318a1 1 0 00-.94 0l-6 3.2A1 1 0 001 5.4V14a1 1 0 001 1h12a1 1 0 001-1V5.4a1 1 0 00-.53-.882l-6-3.2zM7.06.435a2 2 0 011.882 0l6 3.2A2 2 0 0116 5.4V14a2 2 0 01-2 2H2a2 2 0 01-2-2V5.4a2 2 0 011.059-1.765l6-3.2z" clip-rule="evenodd"/>
</svg>
</h2>


<form id="searchP" method="post" action="/findPassword">
  <div class="form-group">
    <label for="exampleInputEmail1">아이디</label>
    <input type="text" class="form-control"  id="inputId_2" name="inputId_2" placeholder="ex) godmisu" required="required" >
  </div>
  
  
  <div class="form-group">
    <label for="exampleInputPassword1">이메일</label>
    <input type="text"  class="form-control" id="inputEmail_2" name="inputEmail_2" placeholder="ex) E-mail@gmail.com" required="required" aria-describedby="emailHelp">
    <small id="emailHelp" class="form-text text-muted">10분이내로 이메일에 임시비밀번호가 전송됩니다. 전송되지 않았을 시 문의해주십시오.</small>
  </div>
  

  <button type="submit"   id="searchBtn2"  class="findpwdbtn">확인</button>
  <button type="reset" href="${pageContext.request.contextPath}/todaylessonlogin" class="findpwdbtn2">취소</button>
</form>
</div>




<%-- <form id="searchP" method="post" action="/findPassword">
<ul>
<li>
<label for="inputId">아이디</label>
<input type="text"  class="form-control" id="inputId_2" name="inputId_2" placeholder="ex) godmisu" required="required">
</li>
<li>
<label>이메일</label>
<input type="text"  class="form-control" id="inputEmail_2" name="inputEmail_2" placeholder="ex) E-mail@gmail.com" required="required">
</li>
<li>
<input type="submit" id="searchBtn2" class="btn btn-primary btn-block" value="확인">
<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}/todaylessonlogin">취소</a>
</li>
</ul>

</form> --%>
</body>
</html>