<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/jy_sn_lesson_write.css">  
<!-- CSSstyle -->
   <style type="text/css">
      .hs_ad_main_asidenav_nav_Member_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.js"></script>
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

<div id="jy_container">


<form name="form" action="${pageContext.request.contextPath }/todaylessonsenior/mal_lesson_update_result" method="post">

<input type="hidden" name= "lessondetail_no" value="${dto.lessondetail_no }">

<div class="input-group">
  <input type="text" class="form-control" placeholder="강의 제목을 입력하세요." aria-describedby="basic-addon1" id="lessondetail_title" name="lessondetail_title" value="${dto.lessondetail_title }">
</div>

<label for="lessondetail_content">레슨 내용</label>
<textarea id="summernote" name="lessondetail_content" style="display:none" >${dto.lessondetail_content}</textarea>

<br>

<input type="submit" value="레슨 등록" class="ej_btn">
<input type="reset" value="취소" class="ej_btn2">


</form>
</div>

</body>
</html>