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
<h5>주문내역 상세 </h5>
주문일자: ${dto.orderlist_date }		주문번호:${dto.orderlist_no }<br>
<c:forEach var="list" items="${list}">
${list.product_thumb }<br>
[스토어>카테고리명:${list.product_category }]<br>
판매가격:${list.product_cost }<br>
주문상세:${list.orderlist_orderstatus }<br>

</c:forEach>

<h5>배송 정보 </h5>
이름: ${dto.orderlist_receiver }<br>
주소:${dto.orderlist_addr }<br>
연락처:${dto.orderlist_phone }<br>
배송 요청사항:${dto.orderlist_msg }<br>

<h5>결제방법 및 결제 금액 </h5>
배송료: 무료
사용 포인트: ${dto.orderlist.usepoint }
총 결제 금액: ${dto.orderlist_cost }
결제 수단:
</body>
</html>
