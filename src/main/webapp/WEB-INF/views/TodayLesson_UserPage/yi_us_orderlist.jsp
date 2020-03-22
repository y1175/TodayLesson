<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
주문내역
<form action="/todaylessonuser/user_myorderlist_date">
<input type="date" name="start_date"> ~ <input type="date" name="end_date"> <input type="submit" value="조회">
</form>

<c:forEach var="orderlist" items="${list}">
주문일자:${orderlist.orderlist_date }	주문번호: ${orderlist.orderlist_no } 주문상태:${orderlist.orderlist_orderstatus}
<input type="button" value="상세보기" onclick="location.href='/todaylessonuser/user_myorderdetail/${orderlist.orderlist_no}'">
<c:forEach var="orderdetail" items="${detailList }">
<img src="${orderdetail.product_thumb}" alt="thumb"><br>
[스토어>${orderdetail.product_category}]<br>
[상품명:${orderdetail.product_name}]<br>
가격:${orderdetail.orderlist_cost}<br>
<br>
</c:forEach>
</c:forEach>
</body>
</html>
