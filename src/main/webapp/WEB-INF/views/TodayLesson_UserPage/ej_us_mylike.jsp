<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
.ej_likespan{
border: 1px black;
display: inline-block;
background-color: silver;
}
</style>

<title>Insert title here</title>
</head>
<body>
<script>
$(".ej_likespan").click(function(){
	alert(hi);
	alert(this);
	var val=$(this).val();
	cnosole.log(val);
});

</script>
<a href="?category=all"><div class="ej_likespan all">전체</div></a>
<a href="?category=lesson"><div class="ej_likespan lesson">레슨</div></a>
<a href="?category=store"><div class="ej_likespan store">상품</div></a>
<br>
<table>
<thead>
<tr>
<th>구분</th><th></th><th></th><th></th><th>가격</th>
</tr>
</thead>
<tbody>
<c:forEach var="item" items="${list}">
<tr>
<c:set var="product_name" value="${item.product_name }"/>
<c:set var="lesson_title" value="${item.lesson_title }"/>

<c:if test="${lesson_title==null }">
<td>상품</td>
<td><a href="${pageContext.request.contextPath}/ej_store_detail/${item.product_no}"><img src="${item.product_thumb}" alt="thumb"></a></td>
<td><a href="${pageContext.request.contextPath}/ej_store_detail/${item.product_no}">${item.product_name }</a></td>
<td>${item.product_cost }원</td></c:if>


<c:if test="${product_name==null }">
<td>레슨</td>
<td><a href="#"><img src="${item.lesson_thumb}" alt="thumb"></a></td>
<td><a href="#">${item.lesson_title }</a></td>
<td>${item.lesson_cost }원</td></c:if>

</tr>
</c:forEach> 
</tbody>
</table>
</body>
</html>