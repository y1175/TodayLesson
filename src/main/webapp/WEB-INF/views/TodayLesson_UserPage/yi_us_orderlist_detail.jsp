<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function cancel(orderlist_orderstatus,orderlist_no)
{
	var result=confirm("주문을 취소하시겠습니까?");
if(result)
	{
	if(orderlist_orderstatus<3)
		{
			location.href='/todaylessonmypage/user_myorderlist_cancel/'+orderlist_no;
		}
	else if(orderlist_orderstatus==5)
		{
			alert("이미 취소된 주문입니다.");
		}
	else
		{
			alert("배송중에는 주문을 취소할 수 없습니다.");
		}
	}

}
</script>
</head>
<body>
<h5>주문내역 상세 </h5>
주문일자: ${dto.orderlist_date }		주문번호:${dto.orderlist_no }		주문상태:${dto.orderlist_orderstatus }<br>
<c:forEach var="list" items="${list}">
${list.product_thumb }<br>
[스토어>카테고리명:${list.product_category }]<br>
판매가격:${list.product_cost }<br>

</c:forEach>
<br>

<h5>배송 정보 </h5>
이름: ${dto.orderlist_receiver }<br>
주소:${dto.orderlist_addr }<br>
연락처:${dto.orderlist_phone }<br>
배송 요청사항:${dto.orderlist_msg }<br>

<h5>결제방법 및 결제 금액 </h5>
배송료: 무료<br>
사용 포인트: ${dto.orderlist_usepoint }<br>
총 결제 금액: ${dto.orderlist_cost }<br>
결제 수단:<br>
<input type="button" name="order_cancel" value="주문취소" onclick="cancel(${dto.orderlist_orderstatus},${dto.orderlist_no })">
<input type="button" name="go_previous" value="돌아가기" onclick="location.href='/todaylessonmypage/user_myorderlist'">
</body>
</html>
