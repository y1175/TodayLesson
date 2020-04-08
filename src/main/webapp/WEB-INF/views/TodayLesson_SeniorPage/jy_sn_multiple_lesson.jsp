<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

$(document).ready(function(){
	
	    $( "#lesson_date" ).datepicker({
	    	dateFormat:"yy-mm-dd",
	    	changeMonth: true, 
	         changeYear: true,
	         nextText: '다음 달',
	         prevText: '이전 달',
	         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	         minDate: 0
	    });	
	    
	    

	 
});

</script>
</head>
<body>


<form name="form">


총 강의 수
<br>* 강의는 10강을 넘길 수 없습니다.
<input type="text" id="lesson_max_number" name="lesson_max_number" >
<br>

레슨일
<input type="text" id="lesson_date" name="lesson_date" required="required" >  

<br>
강의 시작시간
<input type="time" id="lesson_time" name="lesson_time" required="required"> 


<input type="button" value="추가" onclick="add_Lesson_Time();">

<script>






var lesson_date_and_time = [];

function add_Lesson_Time(){

	let lesson_date = document.form.lesson_date.value;
	let lesson_time = document.form.lesson_time.value;

	let lesson_maxnumber = document.form.lesson_max_number.value;
	
	let num = $('#lessontable>tbody tr').length;

	
	if(num >= lesson_maxnumber){
 		 
		alert("레슨 수는 "+ lesson_maxnumber + "강을 초과할 수 없습니다.");
    		
	    for (let i = 0; i < num; i++) {
	    	console.log(lesson_date_and_time[i] );
	    }
	   	
	}  else  {
		  $('tbody').append("<tr>"+"<td>"+lesson_date+"</td>"+"<td>"+lesson_time+"</td>"+"<td>"+"<input type='button' value='삭제' onclick='delete_lesson_date(this);' >"+"</td>"+"</tr>");
		lesson_date_and_time.push(
				{lesson_date : lesson_date, 
				lesson_time : lesson_time}
				);
			console.log(lesson_date_and_time[num]); 
		 	console.log(num);
	} 
 	
}
    
    
    function delete_lesson_date(obj) {
        let tr = $(obj).parent().parent();
     
        //라인 삭제
        tr.remove();
    }
      
    
    
    function lesson_date_submit(){
    	window.opener.add_Lesson_Time(lesson_date_and_time);
    	window.close();
    }

   
    
    
</script>

<table id = "lessontable">
<thead><tr><th>강의 일</th><th>강의 시간</th><th>삭제</th></tr></thead>
<tbody>

</tbody>
</table>


<br>
<br>

<input type="submit" value="전송" onclick="lesson_date_submit();">

</form>
</body>
</html>