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
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/jy_us_senior_form.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

$(document).ready(function(){
	
	    $( "#lesson_date" ).datepicker({
	    	dateFormat:"yy-mm-dd" //Input Display Format 변경
		    	,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
		    	,changeMonth: false  //콤보박스에서 월 선택 가능 
		        ,changeYear: false  //콤보박스에서 년 선택 가능
		        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
	            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
	            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트  
	            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
	            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
	            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
	            ,minDate: 0,
	    });	
	    
	    

	 
});

</script>
</head>
<body>

<div class="jy_container">

<form name="form">
<br>
<h2><b>오프라인 레슨</b></h2>
<br>
<p style="text-align: center; font-weight: bold;">* 강의는 10강을 넘길 수 없습니다.</p>
<br>
<table>
<tbody>
<tr><td>총 강의 수</td>
<td><input type="text" id="lesson_max_number" name="lesson_max_number" placeholder="총 강의 수를 입력하세요."  class="form-control" style="width:100%;"></td></tr>

<tr><td>레슨일</td>
<td><input type="text" id="lesson_date" name="lesson_date" required="required"  class="form-control" style="width:90%;">  </td>
</tr>

<tr><td>강의 시작시간</td>
<td><input type="time" id="lesson_time" name="lesson_time" required="required" class="form-control" style="width:100%;"> </td>

<td><input type="button" value="추가" onclick="add_Lesson_Time();" class="ej_btn"></td>
</tr>
</tbody>
</table>

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
		  $('tbody').append("<tr>"+"<td>"+lesson_date+"</td>"+"<td>"+lesson_time+"</td>"+"<td>"+"<input type='button' value='삭제' onclick='delete_lesson_date(this);' class= 'ej_btn2' >"+"</td>"+"</tr>");
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


<br>

<table id = "lessontable" style="margin: 0px auto;">
<thead  style="background-color: #fff2f2;"><tr><th>강의 일</th><th>강의 시간</th><th>삭제</th></tr></thead>
<tbody>

</tbody>
</table>


<br>
<br>

<input type="submit" value="전송" onclick="lesson_date_submit();" class="ej_btn" style="float: right;">

</form>
</div>
</body>
</html>