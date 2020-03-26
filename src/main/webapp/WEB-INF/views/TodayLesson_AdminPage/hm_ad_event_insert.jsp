<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
 <script src="/resources/JS/summernote-ko-KR.js"></script>
<script src="${pageContext.request.contextPath}/resources/JS/hm_ad_event_insert.js"></script>
<title>글쓰기</title>

<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder : 'content',
			minHeight : 370,
			maxHeight : null,
			focus : true,
			lang : 'ko-KR', 
		
		});
		
		document.getElementById('event_startperiod').valueAsDate = new Date();

		
	});
	
	
</script>
</head>
<body>
	<h2 style="text-align: center;">이벤트 등록</h2>
	<br>
	<br>
	<br>

	<div style="width: 60%; margin: auto;">
		
		<form role="form" method="post" autocomplete="off" enctype="multipart/form-data"'
		 action="${pageContext.request.contextPath}/todaylessonadmin/hm_ad_event_insertresult" name="eventinsertfrm" id="eventinsertfrm"> 
		
		
		<br>
		<label>이벤트 유형</label><br>
		<select name="event_group" id="event_group">
		<option value="">유형을 선택해주세요</option>
		<option value="0">레슨</option>
		<option value="1">스토어</option>
		<option value="2">기타</option>
		</select>
		<br>
		<br>
		<label>이벤트명</label><br>
		 <input type="text" id="event_title" name="event_title" style="width: 40%;" placeholder="이벤트명" required="required"/> <br>
			<br>
			<label>이벤트 시작기간</label><br>
			<input type="date" id="event_startperiod" name="event_startperiod" style="width: 30%;" required="required"/><br>
			<label>이벤트 종료기간</label><br>
			<input type="date" name="event_endperiod" style="width: 30%;" required="required"/><br>
				<label>이벤트 상세설명</label><br>
				<textarea id="summernote" name="event_content" placeholder="이벤트 상세 설명" required="required"></textarea>
			
			
			<div class="inputArea">
			
 <label for="event_thumbnail">썸네일</label>
 <input type="file" id="event_thumbnail" name="file" />
 <br>
 <div class="select_img"><img src="" /></div>
 
 <script>
  $("#event_thumbnail").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(300);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>
 <br><br>
 <li style="list-style: none;">이벤트 간단설명</li>
 <textarea rows="5" cols="40" id="event_thumbexplain" name="event_thumbexplain" maxlength="100"></textarea>
<br>
<br>
 <input type="button" id="hm_ad_event_insertbtn" value="이벤트 등록"/>
  <%-- <%=request.getRealPath("/") %>  --%>
  <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
</div>
			
		</form>
	</div>

</body>
</html>