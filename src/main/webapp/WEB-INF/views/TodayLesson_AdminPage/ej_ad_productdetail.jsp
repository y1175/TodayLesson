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
      .hs_ad_main_asidenav_nav_Product_Title>a{
         color: rgb(224, 62, 82);
      }
      #ej_container{
      width:80%;
      margin:0 auto;
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
<h2 style="text-align: center;"><b>상품 관리</b></h2>
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

<a href="${pageContext.request.contextPath }/todaylessonadmin/ej_ad_productlist" class="ej_link" style="font-size:15px; font-weight:bold;">목록으로</a>
</div>
</body>
</html>