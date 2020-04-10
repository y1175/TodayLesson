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
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/JS/summernote-ko-KR.js"></script>

<script>
	$(document).ready(function() {
		 
		
		$('textarea').summernote({
			placeholder : 'content',
			minHeight : 370,
			maxHeight : null,
			focus : true,
			lang : 'ko-KR'
		});	



		if ('#lesson_type' == 3) {
			
		$('.offline_lesson').hide();

		} else {
		$('.offline_lesson').show();
		}
		
		
		$('#lesson_type').change(function() {
		let state = $('#lesson_type option:selected').val();
		console.log(state);
		if ( state == 3 ) {
			$('.offline_lesson').hide();
		} else {
			$('.offline_lesson').show();
		}
		});	
		
		
		
		
		
		
		document.form.lesson_category.value = ${dto.lesson_category};
		document.form.lesson_type.value = ${dto.lesson_type};
		

		
		  $( "#lesson_open_period" ).datepicker({
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
		        	  $("#lesson_close_period").datepicker( "option", "minDate", selectedDate );
		       	}
		    });	
		  
		  $( "#lesson_close_period" ).datepicker({
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
                   // 종료일(toDate) datepicker가 닫힐때
                   // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                   $("#fromDate").datepicker( "option", "maxDate", selectedDate );
               }                


		    });	
		  
		  
		  

		$(".lesson_earlybird").click(function(){

			let val = $("input:radio[name=lesson_earlybird]:checked").val();
			if (val == "1") {
				$('.earlybird').show();
			} else {
				$('.earlybird').hide();
			}
			
		});
		
		
	});
	
	
	
</script>



</head>

<body>




<script>





function addr(roadAddrPart1) {

	console.log(roadAddrPart1);

	
	//시큐리티 csrf토큰
	/* var csrfHeaderName ="${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";  */
	
	
	$.ajax({
		//여기엔 우리가 요청하는 정보들이 들어감
		method : "GET",
		url : "https://dapi.kakao.com/v2/local/search/address.json",
		/* beforeSend : function(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		}, */
		data : {
				query : roadAddrPart1
		},
		headers : {
				Authorization : "KakaoAK 5443dbc41329c551772b1a1cbb3b44db"
		}
			}).done(
				function(msg) {
					// 성공시 실행되는 곳 > 즉 응답이 여기 표시된다고 할 수 있음
					console.log(msg);
					// > 콘솔창에 제이슨 타입으로 들어오는 것을 볼 수 있음

					let adn = msg.documents[0].address.address_name;
					//  "전북 익산시 부송동 10"  이라는 주소를 볼 수 있음
					let yy = msg.documents[0].address.x;
					let xx = msg.documents[0].address.y;

					$(".map").append("<input type='hidden' id='lesson_lat' name='lesson_lat' value="+xx+">"
					+"<input type='hidden' id='lesson_long' name='lesson_long' value="+yy+">" );
				});

}





function goPopup() {
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("${pageContext.request.contextPath }/jusoPopup", "pop","width=570,height=420, scrollbars=yes, resizable=yes");

	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}





/** API 서비스 제공항목 확대 (2017.02) **/
function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
		roadAddrPart2, jibunAddr, zipNo) {
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	
	console.log(roadFullAddr);
	
	document.getElementById('lesson_addr').value= roadFullAddr;
	document.getElementById('lesson_zipno').value = zipNo;
	   
	
	addr(roadAddrPart1);

	}
	
	

function multiple_time_lesson_date(){
	
	window.open("${pageContext.request.contextPath }/multiple_time_lesson_date", "pop","width=570,height=420, scrollbars=yes, resizable=yes");

	
}	

function add_Lesson_Time(lesson_date_and_time){
	for (var i = 0; i < lesson_date_and_time.length; i++) {
		console.log(lesson_date_and_time);	
		$('#lesson_d_t').append(lesson_date_and_time[i].lesson_date+" "+lesson_date_and_time[i].lesson_time+"<br>"
				+"<input type='hidden' name='lesson_date' id='lesson_date' value=" + lesson_date_and_time[i].lesson_date+">"
				+"<input type='hidden' name='lesson_time' id='lesson_time' value=" + lesson_date_and_time[i].lesson_time+">");	

	}
	document.getElementById("lesson_number").value=lesson_date_and_time.length;
		 

	
}

	
	
	
//document.form.lesson_addr.value= ${dto.lesson_addr};
//document.form.lesson_zipno.value = ${dto.lesson_zipno};


</script>






<div id="jy_container">

 <div stlye="width:100%;">
 <h2 style="margin-top:40px; text-align: center;"><b>레슨 수정</b></h2>
 </div>
 
 
<form method="post" action="${pageContext.request.contextPath }/todaylessonsenior/lesson_update_result" name="form" autocomplete="off" enctype="multipart/form-data"> 

<ul>
<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>

<input type="hidden" id="lesson_no" name="lesson_no" value="${dto.lesson_no}">
 
 <li>
<label for="lesson_title">레슨명</label><br>
<input type="text" id="lesson_title" name="lesson_title" value=${dto.lesson_title } class="form-control" style="width :50%;"><br>
</li>


<li>
<label for="lesson_content">레슨 내용</label><br>
<textarea id="summernote" name="lesson_content" style="display:none"><c:out value="${dto.lesson_content}"/></textarea><br>
</li>

<li>
<label for="lesson_thumb">썸네일</label>
<input type="file" id="lesson_thumb" name="file" />
 </li>
 
 
 <div class="select_img"><img src="" /></div>
 
 <script>
  $("#lesson_thumb").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>
 
 <li>
<label for="lesson_member_max">수강생수</label><br>
<input type="number" id="lesson_member_max" name="lesson_member_max" value="${dto.lesson_member_max}" class="form-control" style="width:10%;"><br>
</li>

<li>
<label for="lesson_category">카테고리</label><br>
<select name="lesson_category" class="form-control">
  <option value="0" selected="selected">---</option>
  <option value="1">운동</option>
  <option value="2">교육</option>
  <option value="3">핸드메이드</option>
  <option value="4">it</option>
  <option value="5">요리</option>
  <option value="6">기타</option>
</select>
<br>
</li>

<li>
<label for="lesson_cost">가격</label><br>
<input type="number" id="lesson_cost" name="lesson_cost" required="required" value="${dto.lesson_cost}" class="form-control" style="width:10%;"><br>
</li>

<li>
<label for="lesson_earlybird">얼리버드 할인</label>
네
<input type="radio" name="lesson_earlybird" class="lesson_earlybird" value="1">
아니요
<input type="radio" name="lesson_earlybird" class="lesson_earlybird" value="0"> 
</li>


<div class="earlybird">
(주의사항) : 수수료는 동일 / 얼리버드 시 27% 일괄 할인(얼리버드 할인은 일주일간 진행됩니다.)<br>
얼리버드 등록 시 메인 홈에서 얼리버드 레슨이 우선시 되어 노출도가 높습니다. <br>
또한, 얼리버드 카테고리에 
얼리버드 레슨 등록 & 얼리버드 세일이 마감될 때 노출되어 신규 주니어를 모으는데 용이합니다. 
</div>

<br>
<li>
<h5> * 레슨 심사는 3일~7일 정도 걸리므로 오픈 날짜 설정 시 참고해주세요</h5>
</li>

<li>
<label for="lesson_open_period">시작일</label> / <label for="lesson_close_period">종료일</label><br>
<input type="text" class="lesson_date" id="lesson_open_period" name="lesson_open_period" required="required" value="${dto.lesson_open_period}">
/ <input type="text" class="lesson_date" id="lesson_close_period" name="lesson_close_period" required="required" value="${dto.lesson_close_period}">
</li>

<li>
<label for="lesson_type">레슨타입</label><br>
<select id="lesson_type" name="lesson_type" class="form-control">
  <option value="0" selected="selected">---</option>
  <option value="1">원데이 레슨</option>
  <option value="2">다회성 레슨</option>
  <option value="3">온라인 레슨</option>
</select>
</li>


<h5> * 오프라인은 레슨 수정 시 레슨 일정을 다시 입력해주셔야 합니다.</h5>
<div class="offline_lesson">

<input type ="button" onclick="multiple_time_lesson_date();" value="날짜/시간 설정하기" name="" class="ej_btn">

<div id="lesson_d_t">


</div>

<li>
<label>레슨주소</label><br>
우편번호<br>
<input type="hidden" id="confmKey" name="confmKey" value="devU01TX0FVVEgyMDIwMDIyNzEwMzUzNTEwOTUwMDM="> 
<input type="text" id="lesson_zipno" name="lesson_zipno" readonly style="width: 100px"> 
<input type="button"value="주소검색" onclick="goPopup();">
<br>	
</li>	
	
<li>
도로명주소<br>
<input type="text" id="lesson_addr" name="lesson_addr" style="width: 50%" readonly="readonly">
<p class="map"></p>

</div>
</li>

<li>
<label for="lesson_number">총강의수</label><br>
<input type="number" id="lesson_number" name="lesson_number" value="${dto.lesson_number}" class="form-control" style="width:10%;"><br>
</li>

<li>
<label for="lesson_senior_title">시니어명</label><br>
<input type="text" id="lesson_senior_title" name="lesson_senior_title" required="required" value="${dto.lesson_senior_title}" class="form-control" style="width:50%;"><br>
</li>

<li>
<label for="lesson_senior_content">시니어소개</label><br>
<textarea id="lesson_senior_content" name="lesson_senior_content" required="required"> ${dto.lesson_senior_content}
</textarea><br>
</li>

<li>
<input type="submit" value="글 작성" class="ej_btn"/>
<input type="reset" value="취소" class="ej_btn2"/>
</li>

</ul>
</form>
</div>

</body>
</html>