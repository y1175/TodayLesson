<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!--style-->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/ej_us_orderlistdetail.css"> 
<!--style-->
</head>
<body>
<div id="ej_container">
<h4>오늘의 레슨을 이용해주셔서 감사합니다</h4>
<h2>주문이 정상적으로 완료되었습니다.</h2>
 <h3>주문번호  ${orderlistdto.orderlist_no }</h3><br>
 
 <!--오더 디테일 정보  -->
<c:forEach var="item" items="${list}"> 
<img src="${item.product_thumb }" alt="thumb">
<span class="ej_bold">상품명:</span>  ${item.product_name }
<span class="ej_bold">수량:</span>  ${item.order_count }
</c:forEach>
<br>
<div id="ej_line"></div>
<!--오더 리스트 정보  -->
<br>
<span class="ej_bold">주문날짜</span>  ${orderlistdto.orderlist_date }<br>
<span class="ej_bold">수령인</span>   ${orderlistdto.orderlist_receiver }<br>
<span class="ej_bold">수령 주소</span>   ${orderlistdto.orderlist_addr }<br>
<span class="ej_bold">결제금액</span>   ${orderlistdto.orderlist_cost }원<br>
<span class="ej_bold">사용포인트</span>   ${orderlistdto.orderlist_usepoint  }<br>
<c:set var="cost" value="${orderlistdto.orderlist_cost }"> </c:set>
<span class="ej_bold">축하드립니다</span>  
<fmt:parseNumber var="addpoint" value="${(cost*0.1)}" integerOnly="true" /> <span class="ej_bold">${addpoint }포인트</span>가 적립되었습니다!<br>
<span class="ej_bold">배송요청사항</span>   ${orderlistdto.orderlist_msg  }
<hr>


</div>

</body>
</html>