<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
 <script src="/resources/JS/summernote-ko-KR.js"></script>
<title>Insert title here</title>

<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder : 'content',
			minHeight : 370,
			maxHeight : null,
			focus : true,
			lang : 'ko-KR', 
		
		});
		
		
});
		
</script>
</head>
<body>
	<h2 style="text-align: center;">이벤트 수정</h2>
	<br>
	<br>
	<br>

	<div style="width: 60%; margin: auto;">
		
		<form role="form" method="post" autocomplete="off" enctype="multipart/form-data"'
		 action="${pageContext.request.contextPath}/hm_ad_event_modify"> 
		<input type ="hidden" id="event_no" name="event_no" value="${dto.event_no}">
		
		<br>
		<label>이벤트 유형</label><br>
		<select name="event_group" id="event_group">
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
		<br>
		<br>
		<label>이벤트명</label><br>
		 <input type="text" id="event_title" name="event_title" value="${dto.event_title}" style="width: 40%;" placeholder="이벤트명" required="required"/> <br>
			<br>
			<label>이벤트 시작기간</label><br>
			<input type="date" id="event_startperiod" name="event_startperiod" value="${dto.event_startperiod}" style="width: 30%;" required="required"/><br>
			<label>이벤트 종료기간</label><br>
			<input type="date" name="event_endperiod" style="width: 30%;" value="${dto.event_endperiod}" required="required"/><br>
				<label>이벤트 상세설명</label><br>
				<textarea id="summernote" name="event_content"><c:out value="${dto.event_content}"/></textarea>
			
			
			<div class="inputArea">
			
 <label for="event_thumbnail">썸네일</label>
 <input type="file" id="event_thumbnail" name="file"/>
 <div class="select_img"><img src="" /></div>
 

 <input type="submit" value="이벤트 등록"/>
  <%-- <%=request.getRealPath("/") %>  --%>
  <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
</div>
			
		</form>
	</div>


</body>
</html>