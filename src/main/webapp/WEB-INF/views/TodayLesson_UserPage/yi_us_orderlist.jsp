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
<form action="/todaylessonuser/user_orderlist_date">
<input type="date" name="start_date"> ~ <input type="date" name="end_date"> <input type="submit" value="조회">
</form>

<c:forEach var="item" items="${list}">
주문일자:${item.orderlist_date }

</c:forEach>
</body>
</html>
