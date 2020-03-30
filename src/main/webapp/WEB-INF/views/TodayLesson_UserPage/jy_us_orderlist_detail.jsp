<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta>
<title>Insert title here</title>
</head>
<body>

<!--오더 리스트 정보  -->
주문날짜  ${orderlistdto.orderlist_date }<br>
 주문번호  ${orderlistdto.orderlist_no }<br>
수령인  ${orderlistdto.orderlist_receiver }<br>
수령 주소  ${orderlistdto.orderlist_addr }<br>
결제금액  ${orderlistdto.orderlist_cost }원<br>
사용포인트  ${orderlistdto.orderlist_usepoint  }<br>
<c:set var="cost" value="${orderlistdto.orderlist_cost }"> </c:set>
<c:set var="addedpoint" value="${(cost*0.1)}"></c:set>
${addedpoint } 포인트가 적립되었습니다!<br>
배송요청사항  ${orderlistdto.orderlist_msg  }
<hr>
<!--오더 디테일 정보  -->
<c:forEach var="item" items="${list}"> 
상품명: ${item.product_name }
수량: ${item.order_count }
</c:forEach>


</body>
</html>