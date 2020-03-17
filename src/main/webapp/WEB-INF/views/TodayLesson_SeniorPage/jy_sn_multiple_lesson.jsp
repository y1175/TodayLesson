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
	         minDate: 0,
	         onClose: function( selectedDate ) {
	        	  $("#enddate").datepicker( "option", "minDate", selectedDate );
	       	}
	    });	
	    
	    

	 
});

</script>
</head>
<body>


<form name="form">

레슨일
<input type="text" id="lesson_date" name="lesson_date">  

강의 시작시간
<select name="hour" id="hour">
<option value="00">오전 00시</option>
<option value="01">오전 01시</option>
<option value="02">오전 02시</option>
<option value="03">오전 03시</option>
<option value="04">오전 04시</option>
<option value="05">오전 05시</option>
<option value="06">오전 06시</option>
<option value="07">오전 07시</option>
<option value="08">오전 08시</option>
<option value="09">오전 09시</option>
<option value="10">오전 10시</option>
<option value="11">오전 11시</option>
<option value="12">오후 12시</option>
<option value="13">오후 1시</option>
<option value="14">오후 2시</option>
<option value="15">오후 3시</option>
<option value="16">오후 4시</option>
<option value="17">오후 5시</option>
<option value="18">오후 6시</option>
<option value="19">오후 7시</option>
<option value="20">오후 8시</option>
<option value="21">오후 9시</option>
<option value="22">오후 10시</option>
<option value="23">오후 11시</option>
</select>

<select name="minute" id="minute">
<option value="00">00분</option>
<option value="10">10분</option>
<option value="20">20분</option>
<option value="30">30분</option>
<option value="40">40분</option>
<option value="50">50분</option>
</select>

<input type="button" value="추가" onclick="add_Lesson_Time();">

</form>


<script>


function add_Lesson_Time(){

    let hour = $("#hour option:checked").text();
    let minute = $("#minute option:checked").text()
	let lesson_date = document.form.lesson_date.value;
    
    console.log(hour);
    console.log(minute);
    console.log(lesson_date);
    
 	num = $('#lessontable>tbody tr').length;

 	 if(num >= 10){
		alert("레슨은 10강을 넘길 수 없습니다.");
		return false;
	} else {
    $('tbody').append("<tr>"+"<td>"+lesson_date+"</td>"+"<td>"+hour+" "+minute+"</td>"+"<td>"+"<input type='button' value='삭제' onclick='delete_lesson_date(this);' >"+"</td>"+"</tr>");
     console.log(num);
	}
   
    
    
    
    };
    
    
    function delete_lesson_date(obj) {
        let tr = $(obj).parent().parent();
     
        //라인 삭제
        tr.remove();
    }
      
    

</script>

<table id = "lessontable">
<thead><tr><th>강의 일</th><th>강의 시간</th><th>삭제</th></tr></thead>
<tbody>

</tbody>
</table>

</body>
</html>