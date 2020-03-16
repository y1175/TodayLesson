<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"	rel="stylesheet">
<script	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/JS/summernote-ko-KR.js"></script>
<script>

$('document').ready(function(){
	

$('textarea').summernote({
	placeholder : 'content',
	minHeight : 370,
	maxHeight : null,
	focus : true,
	lang : 'ko-KR'
});		




});

</script>
</head>
<body>

<form name="form" action="${pageContext.request.contextPath }/mal_lesson_upload_result" method="post">

<h2><c:out value="${dto.lesson_title}"/></h2>

<input type="hidden" id="lesson_no" name="lesson_no" value="${dto.lesson_no}">
<input type="hidden" id="senior_no" name="senior_no" value="${dto.senior_no}">
<input type="hidden" id="member_id" name="member_id" value="${pageContext.request.userPrincipal.name}">
<label for="lessondetail_title">레슨 명</label>
<input type="text" id="lessondetail_title" name="lessondetail_title">

<label for="lessondetail_content">레슨 내용</label>
<textarea id="summernote" name="lessondetail_content"></textarea>

여기도 썸네일 넣을까 고민중임

<input type="submit" value="레슨 등록">
<input type="reset" value="취소">

</form>

</body>
</html>