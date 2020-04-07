<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 레슨 1:1문의 등록페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hm_us_question_insert.css?ver=4">  
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/JS/hm_us_questioninsert.js?ver=6"></script> 
</head>
<body>


<div class="usfaqmain">
<h2>1:1문의 등록
<svg class="bi bi-chat-dots" width="1em" height="1em" style="margin-bottom: 10px;" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M2.678 11.894a1 1 0 01.287.801 10.97 10.97 0 01-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 01.71-.074A8.06 8.06 0 008 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 01-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 00.244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 01-2.347-.306c-.52.263-1.639.742-3.468 1.105z" clip-rule="evenodd"/>
  <path d="M5 8a1 1 0 11-2 0 1 1 0 012 0zm4 0a1 1 0 11-2 0 1 1 0 012 0zm4 0a1 1 0 11-2 0 1 1 0 012 0z"/>
</svg>
</h2>








<form name ="hmquestionform" method="post" action="${pageContext.request.contextPath}/todaylessonmypage/hm_question_create">


<!-- 문의 유형 -->
<div style="margin:40px auto 0px;">
<select id="question_group" name="question_group" class="custom-select custom-select-lg mb-3" required="required"
style="width:20%; margin-left:10%; font-weight: 600;">
<option value ="">문의 유형을 선택하세요</option>
<option value ="0">레   슨</option>
<option value ="1">시니어</option>
<option value ="2">스토어</option>
<option value ="3">주   문</option>
<option value ="4">기   타</option>
</select>
</div>

<!-- 문의 유형 끝 -->


<!-- 문의 제목 -->
  <div class="form-group" style="margin-left:5%; margin:20px auto 0px; width:80%;">
    <label for="question_title">문의 제목</label>
    <input type="text" class="form-control" id="question_title" name="question_title" required="required">
    <small id="emailHelp" class="form-text text-muted">문의 제목은 100자 이내로 작성해주십시오.</small>
  </div>
<!-- 문의 제목 끝 -->

<!-- 문의 내용 -->
 <div class="form-group" style="margin-left:5%; margin:20px auto 0px; width:80%;">
    <label for="exampleFormControlTextarea1">문의 내용</label>
    <textarea class="form-control" id="question_content" name="question_content" placeholder="문의 내용을 입력하세요"  rows="25" cols="90" required="required"></textarea>
 </div>
<!-- 문의 내용 끝 -->


<div class="hmfaqinsertbtndiv">
<input type="button" id="hm_us_question_insertbtn" class="hmfaqinsertbtn" value="등록">
<button onclick="location.href='${pageContext.request.contextPath}/todaylessonmypage/hm_us_question'" class="hmfaqinsertbtn2">취소</button>
</div>



</form>

</div>


</body>
</html>
