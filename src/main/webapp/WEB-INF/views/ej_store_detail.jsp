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
#ej_sdetail_top span{
border: 1px solid silver;
}
#ej_sdetail_right{
border: 1px solid silver;
width:400px;
float:right;
}
#top{
/* display:inline-block; */
/* float:left; */}

</style>

</head>
<body>


<span id="top">
<img src="${pageContext.request.contextPath }/${dto.product_img }" id="ej_sdetail_topimg">

<div id="ej_sdetail_right">
카테고리<br>
상품명: <c:out value="${dto.product_name}"></c:out><br>
가격: <c:out value="${dto.product_cost}"></c:out><br>
할인율 옆에 표기<br>

배송비 무료<br>
수량<br>
하트랑 장바구니 <button> 구매하기</button>
</div>
</span>
<div id="ej_sdetail_top">




<span>
상품소개
</span>
<span>
후기</span>
<span>
배송/교환/환불
</span>
</div>
상품소개
<hr>
<div id="content">

${dto.product_content}

</div>

<br>
후기
<hr>


<!--  -->
배송/교환/환불
<hr>

<%-- <a href="${pageContext.request.contextPath }/list">목록으로</a> --%>


</body>
</html>