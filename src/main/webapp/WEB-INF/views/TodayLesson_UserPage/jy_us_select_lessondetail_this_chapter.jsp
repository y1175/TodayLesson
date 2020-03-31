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
	
	$('.time_count').hide();
	
	
});

</script>
</head>
<body>

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
        console.log ("카운트 완료");
        time_change();
    }
}

function time_change(){
	 $('#time_change').val(0);
};


</script>

<form method="post" action="${pageContext.request.contextPath }/update_lesson_comp">

<div class ="time_count">
<input type="hidden" name="display" size=2 id = "time">
<input type="hidden" name="time_change" id ="time_change">
</div>

<script>
startInterval();
</script>


레슨명
<br>
<c:out value="${dto.lesson_title}"/><br>
챕터 명<br><c:out value="${dto.lessondetail_title}"/><br>
레슨 내용<br>
<div class="summer">
${dto.lessondetail_content}
</div><br>
현재 레슨 챕터 <br><c:out value="${dto.lessondetail_chapter}"/>

<input type="hidden" name="lessondetail_no" id="lessondetail_no" value="${dto.lessondetail_no}">
<input type="hidden" name="lesson_no" id="lesson_no" value="${dto.lesson_no}">

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<br>
<input type="submit" name="lesson_comp_update" id="lesson_comp_update">

</form>
</body>
</html>