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
<style>
 .hs_ad_main_asidenav_nav_Product_Title>a{
         color: rgb(224, 62, 82);
      }
     
/*page*/
.pagination .page-link:focus{
    box-shadow: none;
}
.pagination>.page-item>.page-link, .pagination>.page-item>span {
    border: 0;
    border-radius: 30px!important;
    transition: all .3s;
    padding: 0 11px !important;
    margin: 0 3px !important;
    min-width: 30px;
    height: 30px;
    line-height: 30px;
    color: #999;
    font-weight: 400;
    font-size: 12px;
    text-transform: uppercase;
    background: 0 0;
    text-align: center;
}

.pagination>.page-item.active>a, .pagination>.page-item.active>a:focus, .pagination>.page-item.active>a:hover, .pagination>.page-item.active>span, .pagination>.page-item.active>span:focus, .pagination>.page-item.active>span:hover {
    background-color: #9c27b0;
    border-color: #9c27b0;
    color: #fff;
    box-shadow: 0 4px 5px 0 rgba(156,39,176,.14), 0 1px 10px 0 rgba(156,39,176,.12), 0 2px 4px -1px rgba(156,39,176,.2);
}


.pagination.pagination-info>.page-item.active>a, .pagination.pagination-info>.page-item.active>a:focus, .pagination.pagination-info>.page-item.active>a:hover, .pagination.pagination-info>.page-item.active>span, .pagination.pagination-info>.page-item.active>span:focus, .pagination.pagination-info>.page-item.active>span:hover {
    background-color: #00bcd4;
    border-color: #00bcd4;
    box-shadow: 0 4px 5px 0 rgba(0,188,212,.14), 0 1px 10px 0 rgba(0,188,212,.12), 0 2px 4px -1px rgba(0,188,212,.2);
}


.pagination.pagination-success>.page-item.active>a, .pagination.pagination-success>.page-item.active>a:focus, .pagination.pagination-success>.page-item.active>a:hover, .pagination.pagination-success>.page-item.active>span, .pagination.pagination-success>.page-item.active>span:focus, .pagination.pagination-success>.page-item.active>span:hover {
    background-color: #4caf50;
    border-color: #4caf50;
    box-shadow: 0 4px 5px 0 rgba(76,175,80,.14), 0 1px 10px 0 rgba(76,175,80,.12), 0 2px 4px -1px rgba(76,175,80,.2);
}

.pagination.pagination-warning>.page-item.active>a, .pagination.pagination-warning>.page-item.active>a:focus, .pagination.pagination-warning>.page-item.active>a:hover, .pagination.pagination-warning>.page-item.active>span, .pagination.pagination-warning>.page-item.active>span:focus, .pagination.pagination-warning>.page-item.active>span:hover {
    background-color: #ff9800;
    border-color: #ff9800;
    box-shadow: 0 4px 5px 0 rgba(255,152,0,.14), 0 1px 10px 0 rgba(255,152,0,.12), 0 2px 4px -1px rgba(255,152,0,.2);
}

.pagination.pagination-danger>.page-item.active>a, .pagination.pagination-danger>.page-item.active>a:focus, .pagination.pagination-danger>.page-item.active>a:hover, .pagination.pagination-danger>.page-item.active>span, .pagination.pagination-danger>.page-item.active>span:focus, .pagination.pagination-danger>.page-item.active>span:hover {
    background-color: #f44336;
    border-color: #f44336;
    box-shadow: 0 4px 5px 0 rgba(244,67,54,.14), 0 1px 10px 0 rgba(244,67,54,.12), 0 2px 4px -1px rgba(244,67,54,.2);
}


.ej_btn{
	border: 1px transparent;
padding: 5px 15px; 
background-color: rgb(224, 62, 82);
height:40px;
width:120px;
font-weight : 600;
font-size : 14px; 
color: white;
float:right;
}
</style>
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
	<h2 style="text-align: center;"><b>상품 등록</b></h2>
	<br>
	<br>
	<br>

	<div style="width: 80%; margin: auto;">
		<!-- 블로그에서는  -->
		<form role="form" method="post" autocomplete="off" enctype="multipart/form-data"'
		 action="${pageContext.request.contextPath }/todaylessonadmin/ej_ad_product_insertresult"> 
		
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
		 <input type="text" name="product_name" size="40" placeholder="제품명" required="required"/> <br>
			<br>
				<label>가격</label><br>
				 <input type="text" class="ej_num_input" name="product_cost" size="6" placeholder="가격"  required="required"/>원 <br>
				  <label>할인율</label><br>
				 <input type="text" class="ej_num_input" name="product_sale" size="6"  maxlength="2" placeholder="%" required="required"/>% <br>
				 <label>수량</label><br>
				 <input type="text" class="ej_num_input" name="product_stock" size="6"  placeholder="수량" required="required"/>개 <br>
				
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
 <input type="submit" value="제품 등록" class="ej_btn"/>
  <%-- <%=request.getRealPath("/") %>  --%>
</div>
			
		</form>
	</div>

</body>
</html>