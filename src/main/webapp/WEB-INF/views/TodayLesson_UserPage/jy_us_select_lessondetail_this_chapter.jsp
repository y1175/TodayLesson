<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/jy_us_my_lesson_detail.css?ver=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script>

$(document).ready(function(){
	
	$('#summer').html();
	
	$('.time_count').hide();
	
	$('#lesson_comp_update').hide();
	
});

</script>
</head>
<body>
<div id="jy_container">

<script>


var interval = "";
var it = ${dto.lessondetail_running_time };

function startInterval() {
    interval = window.setInterval("tTimer()",1000);
} 
function stopInterval() {
    window.clearInterval(interval);
    interval="";
}
function tTimer() {
    document.getElementById('time').value = it--;
    if (it == -1)
    {
        stopInterval();
        alert("챕터 수강 완료");
        time_change();
    	$('#lesson_comp_update').show();

    }
}

function time_change(){
	 $('#time_change').val(0);
};


</script>





<form method="post" action="${pageContext.request.contextPath }/todaylessonmypage/update_lesson_comp">

<div class ="time_count">
<input type="hidden" name="display" size=2 id ="time">
<input type="hidden" name="time_change" id ="time_change">
</div>

<script>
startInterval();
</script>


 <div style="width:100%;">
 <h2 style="margin-top:40px; text-align: center;"><c:out value="${ldto.lesson_title}"/></h2>
 </div>

<div class="my_lesson_line"></div>

<div class="lesson_basic_info">
현재 챕터 / 총 강의 수 <br>

<c:out value="${dto.lessondetail_chapter}"/> / <c:out value="${ldto.lesson_number}"/> 
 </div>

<br>

<div class="chap">
<c:out value="${dto.lessondetail_title}"/>
<br>
</div>

<div class="summer" style=" margin: 0px auto; padding: 0px;">
${dto.lessondetail_content}
</div><br>

<input type="hidden" name=lessondetail_no id="lessondetail_no" value="${dto.lessondetail_no}">
<input type="hidden" name="lesson_no" id="lesson_no" value="${dto.lesson_no}">

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<br>
<input type="submit" name="lesson_comp_update" class="ej_btn" id="lesson_comp_update" style="float: right;"/>
</form>
</div>
</body>
</html>