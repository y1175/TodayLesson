<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

$(document).ready(function(){
	let con = $('#content').html();
});

</script>
<style>
 #ej_sdetail_top{
border: 1px solid silver;
width:400px;

} 
#ej_sdetail_top{
border: 1px solid silver;
}
#ej_sdetail_right{
border: 1px solid silver;
width:400px;
float:right;
}
#ej_top{
border: 1px solid silver;}

</style>

</head>
<body>


<span id="ej_topimg">
<!--썸네일 이미지와 동일. 크기는 큼 -->
<img src="${dto.product_img }" id="ej_sdetail_topimg" width="600">
</span>

<nav id="ej_sdetail_right">
카테고리<br>
상품명: <c:out value="${dto.product_name}"></c:out><br>
가격: <c:out value="${dto.product_cost}"></c:out><br>
할인율 옆에 표기<br>

배송비 무료<br>
수량<br>
하트랑 장바구니 <button> 구매하기</button>
</nav>

<nav id="ej_sdetail_top">
<span id="ej_top">
상품소개
</span>
<span id="ej_top">
후기</span>
<span id="ej_top">
배송/교환/환불
</span>
</nav>

상품소개
<hr>
<div id="content">

${dto.product_content}

</div>

<!-- 후기 -->
<br>
후기
<hr>


<!--  -->
배송/교환/환불
<hr>

<%-- <a href="${pageContext.request.contextPath }/list">목록으로</a> --%>


</body>
</html>