<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

주문이 완료 되었습니다!<br>
주문번호: ${oldto.orderlist_no }<br>
주문날짜:${oldto.orderlist_date}<br>
<%-- 주문상품번호: ${oddto.product_no }<br>
수량: ${oddto.order_count }<br> --%>
결제금액: ${oldto.orderlist_cost }<br>
사용 포인트: ${oldto.orderlist_usepoint }<br>

</body>
</html>