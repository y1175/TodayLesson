<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
mycart페이지<br>
<table>
<thead>
<tr>
<th>상품번호</th><th></th><th>상품명</th><th>가격</th><th>수량</th>
</tr>
</thead>
<tbody>
<c:forEach var="item" items="${list}">
<tr>
<td>${item.product_no }</td>
<td><a href="${pageContext.request.contextPath}/ej_store_detail/${item.product_no}"><img src="${item.product_thumb}" alt="thumb"></a></td>
<td><a href="${pageContext.request.contextPath}/ej_store_detail/${item.product_no}">${item.product_name }</a></td>
<td>${item.product_cost }</td>
<td>${item.cart_amount }</td>
</tr>
</c:forEach> 
</tbody>
</table>

</body>
</html>