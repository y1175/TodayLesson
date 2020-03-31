<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	var product_no=${dto.product_no};
	var hi="${pageContext.request.contextPath }";
	console.log('context',hi);
	$(".product_detail_updatebtn").on('click',function(){
		location.href="${pageContext.request.contextPath}/todaylessonadmin/ad_product_update/"+product_no;
		
	});
	
	$(".product_detail_deletebtn").on('click',function(){
		if(confirm("제품을 삭제하시겠습니까?")){
			location.href="${pageContext.request.contextPath}/todaylessonadmin/ad_product_delete/"+product_no;
		}
	
		
	});
});
</script>
</head>
<body>



제품번호 <c:out value="${dto.product_no}"></c:out><br>
제품명 <c:out value="${dto.product_name}"></c:out><br>
카테고리
<c:set var="category" value="${dto.product_category }"/>
 <c:choose>
         <c:when test = "${category==1}">외국어</c:when>
            <c:when test = "${category==2}">IT </c:when>
            <c:when test = "${category==3}"> 요리</c:when>
            <c:when test = "${category==4}">DIY</c:when>
            <c:when test = "${category==5}">운동</c:when>
            <c:when test = "${category==6}">기타</c:when>
          <c:otherwise> 잘못된 입력입니다.</c:otherwise> 
  </c:choose>
  <br>

	할인율<c:out value="${dto.product_sale }"></c:out>%<br>

<div id="content">
${dto.product_content}
</div>
<hr>
썸네일
<hr>
<img src="${dto.product_thumb}" alt="thumb"><br>
<br>
<button class="product_detail_updatebtn">수정</button>
<button class="product_detail_deletebtn">삭제</button><br>


<a href="${pageContext.request.contextPath }/ej_ad_productlist">목록으로</a>

</body>
</html>