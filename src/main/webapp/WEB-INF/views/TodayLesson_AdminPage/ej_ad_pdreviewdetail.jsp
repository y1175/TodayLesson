<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="resources/JS/summernote-lite.js"></script>
<script src="resources/JS/summernote-ko-KR.js"></script>
<script>
$(document).ready(function(){
	
	var pdreview_no =${dto.pdreview_no};

	$(".pdreview_detail_deletebtn").on('click',function(){
		if(confirm("도배 또는 악성 후기인 경우 삭제합니다. 삭제하시겠습니까?")){
			location.href="/ad_product_reviewdelete/"+pdreview_no;
		}
	
		
	});
});
</script>
</head>


리뷰번호 ${dto.pdreview_no }<br>
상품번호 ${dto.product_no}<br>
상품명 ${dto.product_name}<br>
리뷰내용<br>
${dto.pdreview_content }<br>
작성자 ${dto.member_id}<br>
작성날짜 ${dto.pdreview_date}<br>

<button class="pdreview_detail_deletebtn">삭제</button>



</body>
</html>