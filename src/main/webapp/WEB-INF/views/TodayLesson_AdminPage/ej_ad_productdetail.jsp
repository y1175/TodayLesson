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
	$("#product_detail_updatebtn").on('click',function(){
		location.href="${pageContext.request.contextPath}/todaylessonadmin/ad_product_update/"+product_no;
		
	});
	
	$("#product_detail_deletebtn").on('click',function(){
		if(confirm("제품을 삭제하시겠습니까?")){
			location.href="${pageContext.request.contextPath}/todaylessonadmin/ad_product_delete/"+product_no;
		}
	
		
	});
});
</script>
<style type="text/css">
#ej_container{
      width:80%;
      margin:0 auto;
      margin-top:40px;
      }
     .ej_btn{
border: 1px transparent;
padding: 5px 15px; 
background-color: rgb(224, 62, 82);
height:40px;
font-weight : 600;
font-size : 14px;
color: white;

}

.ej_link:hover{
text-decoration: none;
}
#ej_right{
float:right;}
</style>
</head>
<body>

<div id="ej_container">
<h2 style="text-align: center;">상품 관리</h2>
<h4><b>제품번호</b> <c:out value="${dto.product_no}"></c:out></h4><br>
<h4><b>제품명</b> <c:out value="${dto.product_name}"></c:out></h4><br>
<h4><b>카테고리</b>
<c:set var="category" value="${dto.product_category }"/>
 <c:choose>
         <c:when test = "${category==1}">외국어</c:when>
            <c:when test = "${category==2}">IT </c:when>
            <c:when test = "${category==3}"> 요리</c:when>
            <c:when test = "${category==4}">DIY</c:when>
            <c:when test = "${category==5}">운동</c:when>
            <c:when test = "${category==6}">기타</c:when>
          <c:otherwise> 잘못된 입력입니다.</c:otherwise> 
  </c:choose></h4>
  <br>

	<h4><b>할인율</b><c:out value="${dto.product_sale }"></c:out>%</h4><br>

<div id="content">
${dto.product_content}
</div>
<hr>
<h4><b>썸네일이미지</b></h4>
<hr>
<img src="${dto.product_thumb}" alt="thumb"><br>
<br>
<div id="ej_right">
<button id="product_detail_updatebtn" class="ej_btn">수정</button>
<button id="product_detail_deletebtn" class="ej_btn">삭제</button>
</div><br>

<a href="${pageContext.request.contextPath }todaylessonadmin/ej_ad_productlist" class="ej_link" style="font-size:15px; font-weight:bold;">목록으로</a>
</div>
</body>
</html>