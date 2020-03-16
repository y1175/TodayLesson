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

$(document).ready(function(){
	
	$('#summer').html();
	
});

</script>
</head>
<body>
여기에 레슨 명이랑 총 레슨 수 넣을지 고민중
챕터 명<br><c:out value="${dto.lessondetail_title}"/><br>
레슨 내용<br>
<div class="summer">
${dto.lessondetail_content}
</div><br>
현재 레슨 챕터 <br><c:out value="${dto.lessondetail_chapter }"/>
</body>
</html>