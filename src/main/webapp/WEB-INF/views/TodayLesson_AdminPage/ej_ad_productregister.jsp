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
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<!-- <script src="TodayLesson\src\main\webapp\resources\JS\summernote-ko-KR.js"></script> -->
 <script src="/resources/JS/summernote-ko-KR.js"></script> 
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
	});
	//
	/* 	function sendFile(file, el) {
		var form_data = new FormData();
      	form_data.append('file', file);
      	$.ajax({
        	data: form_data,
        	type: "POST",
        	url: './profileImage.mpf',
        	cache: false,
        	contentType: false,
        	enctype: 'multipart/form-data',
        	processData: false,
        	success: function(img_name) {
          		$(el).summernote('editor.insertImage', img_name);
        	}
      	});
    }
	 */
	
</script>
</head>
<body>
	<h2 style="text-align: center;">제품 등록</h2>
	<br>
	<br>
	<br>

	<div style="width: 60%; margin: auto;">
		<%-- <form method="post" action="${pageContext.request.contextPath }/insertresult"
		enctype="multipart/form-data"> --%>
		<!-- 블로그에서는  -->
		<form role="form" method="post" autocomplete="off" enctype="multipart/form-data"'
		 action="${pageContext.request.contextPath }/ej_ad_product_insertresult"> 
		
		<label>카테고리</label>
		<select name="product_category">
		<option value="1">외국어</option>
		<option value="2">IT</option>
		<option value="3">요리</option>
		<option value="4">DIY</option>
		<option value="5">운동</option>
		<option value="6">기타</option>
		</select>
		<br>
		<label>제품명</label><br>
		 <input type="text" name="product_name" style="width: 40%;" placeholder="제품명" required="required"/> <br>
			<br>
				<label>가격</label>
				 <input type="text" name="product_cost" style="width: 40%;" placeholder="가격"  required="required"/> <br>
				  <label>할인율</label>
				 <input type="text" name="product_sale" style="width: 40%;" placeholder="%" required="required"/> <br>
			<!-- 	 <label>할인 후 가격</label>
				 <input type="text" name="product_after_cost" style="width: 40%;" placeholder="할인 후 가격"  required="required"/> <br> -->
				 <label>수량</label>
				 <input type="text" name="product_stock" style="width: 40%;" placeholder="수량" required="required"/> <br>
				
				<label>상세설명</label><br>
				<textarea id="summernote" name="product_content" placeholder="제품 상세 설명" required="required"></textarea>
			
			
			<div class="inputArea">
			
 <label for="product_img">썸네일</label>
 <input type="file" id="product_img" name="file" />
 <div class="select_img"><img src="" /></div>
 
 <script>
  $("#product_img").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>
 <input type="submit" value="제품 등록"/>
  <%-- <%=request.getRealPath("/") %>  --%>
</div>
			
		</form>
	</div>

</body>
</html>