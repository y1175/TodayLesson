<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/jy_mul_ad_sn_data2.css">  

<script>

$(document).ready(function(){
	
	$('#summer').html();
	
});

</script>
</head>
<body>

<div id="jy_container">

 <div stlye="width:100%;">
 <h2 style="margin-top:40px; text-align: center;"><c:out value="${ldto.lesson_title}"/></h2>
 </div>
 
 
 

<ul>
<li>
<b>강의 제목</b>
<span class="jy_text">
<c:out value="${dto.lessondetail_title }"/>
</span><br>
</li>

<li>
<b>강의 내용</b>
<div class="summer">
${dto.lessondetail_content}
</div>
</li>

<li>
<b>전체 강의 수 / 현재 레슨 챕터</b>
<span class="jy_text">
<c:out value="${ldto.lesson_number }"> </c:out>/<c:out value="${dto.lessondetail_chapter }"/>
</span>
</li>

</ul>

<button id="reward_point" class="ej_btn" onclick="location.href='${pageContext.request.contextPath }/todaylessonsenior/approve_lesson_detail/${ldto.lesson_no}'">목록으로</button>

</div>
</body>
</html>