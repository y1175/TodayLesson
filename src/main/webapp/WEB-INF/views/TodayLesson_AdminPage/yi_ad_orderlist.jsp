<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
주문내역 관리
<form action="/todaylessonadmin/order_search">
<label>주문상태</label>
<input type="radio" id="order_all" name="order_status"><label for="order_all">전체</label>
<input type="radio" id="deposit_waiting" name="order_status"><label for="deposit_waiting">입금대기</label>
<input type="radio" id="deposit_complete" name="order_status"><label for="deposit_complete">입금완료</label>
<input type="radio" id="delivery_ready" name="order_status"><label for="delivery_ready">배송준비</label>
<input type="radio" id="deliverying" name="order_status"><label for="deliverying">배송중</label>
<input type="radio" id="order_complete" name="order_status"><label for="order_complete">완료</label>
<br>
<label>주문번호</label>
<input type="text" id="orderlist_no" name="orderlist_no"><br>

<label>주문기간</label>
<input type="date" name="start_date"> ~ <input type="date" name="end_date"><br>

<input type="submit" value="조회">

</form>
<select name="orderlist_category">
<option value="store">스토어</option>
<option value="lesson">레슨</option>
</select>
<form action="/todaylessonadmin/order_modify">
<table>
<thead>
<tr><th>주문번호</th><th>주문일자</th><th>주문자 연락처</th><th>상품명</th><th>금액합계</th><th rowspan="2">미수금</th></tr>
<tr><th>주문상태</th><th>주문자 ID</th><th>배송 주소</th><th>상품번호</th><th>입금합계</th><tr>
</thead>
<tbody>
<c:forEach var="item" items="${list }">


</c:forEach>
</tbody>
<tbody>
<tr><td colspan="4"></td><td>합계</td><td>원</td><td>원</td>
</tbody>
</table>
배송상태 수정하기 <input type="button" value="button">
</form>

</body>
</html>
