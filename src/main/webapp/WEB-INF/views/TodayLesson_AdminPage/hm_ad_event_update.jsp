<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSSstyle -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/hm_ad_event_update.css?ver=1"> 
   <style type="text/css">
      .hs_ad_main_asidenav_nav_Event_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
 <script src="/resources/JS/summernote-ko-KR.js"></script>
<title>관리자 이벤트 수정페이지</title>

<!-- 썸머노트 -->
 <script>
 	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder : 'content',
			minHeight : 370,
			maxHeight : null,
			focus : true,
			lang : 'ko-KR', 
		
		});
		
		$('#event_thumbnail').on('click',function(){
			$(this).removeAttr("style");
		});
	

		
}); 
</script> 
<!-- 썸머노트 끝 -->



</head>
<body>



<div class="hm_ad_event_updatemain">
<h3>이벤트 수정</h3>


	
		
		<form role="form"  name="eventupdateform" method="post" autocomplete="off" enctype="multipart/form-data"'
		 action="${pageContext.request.contextPath}/todaylessonadmin/hm_ad_event_modify"> 
		 
		 
		 <div class="form-group">

		 <input type ="hidden" id="event_no" name="event_no" value="${dto.event_no}">
		
		
		
		
		
		<label for="event_group">이벤트 유형</label>
		<select name="event_group" id="event_group" class="form-control" style="width:20%; margin-bottom:20px;">
		<option value="${dto.event_group}">
		  <c:choose>
				<c:when test="${dto.event_group eq '0'}">
					<c:out value="레슨" />
				</c:when>
				<c:when test="${dto.event_group eq '1'}">
					<c:out value="스토어" />
				</c:when>
				<c:when test="${dto.event_group eq '2'}">
					<c:out value="기타" />
				</c:when>
		  </c:choose>
		</option>
		<option value="0">레슨</option>
		<option value="1">스토어</option>
		<option value="2">기타</option>
		</select>
		
		
		
		<label for="event_startperiod">이벤트 시작기간</label>
		<input type="date" id="event_startperiod" name="event_startperiod" value="${dto.event_startperiod}"  required="required" class="form-control" style="width:20%; margin-bottom:20px;"/>
		
		<label for="event_endperiod">이벤트 종료기간</label>
		<input type="date" name="event_endperiod" required="required" value="${dto.event_endperiod}" class="form-control" style="width:20%; margin-bottom:20px;"/>	
		
		
		<label for="event_title">이벤트명</label>
		<input type="text" id="event_title" name="event_title" value="${dto.event_title}" placeholder="이벤트명을 입력해주세요" required="required" class="form-control"  aria-describedby="titleHelp" style="width:50%; "/> 
		<small id="titleHelp" class="form-text text-muted" style="margin-bottom:20px;">이벤트명은 한글 100자/영문 300자를 넘기지 않아야 합니다.</small>
		
		<label>썸네일 간단설명</label>
	    <textarea rows="5" cols="40" id="event_thumbexplain" name="event_thumbexplain" class="form-control" maxlength="100" aria-describedby="explainHelp" style="width:50%;">${dto.event_thumbexplain}</textarea>
	    <small id="explainHelp" class="form-text text-muted" style="margin-bottom:20px;">썸네일에 대한 간략한 설명을 한글 100자 / 영문 300자 이내로 작성해주세요.</small>
		
		</div>	
		
				
		<!-- 썸머노트 -->
		<label for="event_content">이벤트 상세설명</label><br>
		<textarea id="summernote" name="event_content" style="display:none"><c:out value="${dto.event_content}"/></textarea>
		<!-- 썸머노트 끝 -->	
			
			
			
		<div class="form-group" style="margin-top:20px;">
		<div class="inputArea">


 		<label for="event_thumbnail">썸네일 수정</label>
 		<input type="file" id="event_thumbnail" name="file" style="width: 80px; margin-bottom:20px;"/>
 
 		<div class="select_img" style="margin-top:20px;"><img src="${dto.event_thumbnail}" /></div>
		
		</div>
		
		
		

	    <!-- 썸네일 선택 시 div에 썸네일 보여줌 -->
 		<script>
  		$("#event_thumbnail").change(function(){
  		 if(this.files && this.files[0]) {
   		 var reader = new FileReader;
   		 reader.onload = function(data) {
    	 $(".select_img img").attr("src", data.target.result).width(450);        
    	 }
   		 reader.readAsDataURL(this.files[0]);
   		 }
 		 });
 		</script>
 		<!-- script 끝 -->


 
 
 
		<div class="eventbtndiv">
 		<input type="button" id="event_update_btn" onclick="updatethumbnail();" class="hmeventupdatebtn" value="이벤트 등록"/>
 		<button onclick="location.href='${pageContext.request.contextPath}/todaylessonadmin/hm_ad_event_manage'" class="hmeventupdatebtn2">수정 취소</button>
 		</div>
 
 
 
 
 <!-- 등록버튼 누를 시 썸네일의 수정 유무에 따라 다르게 script를 잡아준다 -->
 <script>
  function updatethumbnail(){
	  
	var updateform = document.eventupdateform;  
	var thumbnail =  updateform.file.value;
	var newthumbnail = document.getElementById('event_thumbnail');
	console.log(thumbnail);
	console.log(newthumbnail);
	if(thumbnail==null){
		newthumbnail.disabled = true;
		console.log(newthumbnail);
		updateform.submit();
	}else{
		updateform.submit();	
	}
  }
  </script>
  
  
  
  			<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
  		
  		</div>
			
		
	</form>
	

</div>

</body>
</html>