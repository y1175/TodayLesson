<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<!--오더 리스트 정보  -->
주문날짜  ${orderlistdto.orderlist_date }<br>
 주문번호  ${orderlistdto.orderlist_no }<br>
수령인  ${orderlistdto.orderlist_receiver }<br>
수령 주소  ${orderlistdto.orderlist_addr }<br>
결제금액 <fmt:formatNumber value="${orderlistdto.orderlist_cost }" type="number" maxFractionDigits="3"/> 원<br>
사용포인트 <fmt:formatNumber value="${orderlistdto.orderlist_usepoint  }" type="number" maxFractionDigits="3"/> <br>
<c:set var="cost" value="${orderlistdto.orderlist_cost }"> </c:set>
<c:set var="addedpoint" value="${(cost*0.1)}"></c:set>
<fmt:formatNumber value="${addedpoint }" type="number" maxFractionDigits="3"/> 포인트가 적립되었습니다!<br>
배송요청사항  ${orderlistdto.orderlist_msg  }
<hr>
<!--오더 디테일 정보  -->
<c:forEach var="item" items="${list}"> 
<c:set var="product_name" value="${item.product_name }"/>
<c:set var="lesson_title" value="${item.lesson_title }"/>
<c:if test="${lesson_title==null }">
상품명: ${item.product_name }  </c:if>
<c:if test="${product_name==null }">
레슨명:${item.lesson_title} </c:if>
수량: ${item.order_count }
<br>
</c:forEach>


</body>
</html>