<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<!--���� ����Ʈ ����  -->
�ֹ���¥  ${orderlistdto.orderlist_date }<br>
 �ֹ���ȣ  ${orderlistdto.orderlist_no }<br>
������  ${orderlistdto.orderlist_receiver }<br>
���� �ּ�  ${orderlistdto.orderlist_addr }<br>
�����ݾ�  ${orderlistdto.orderlist_cost }��<br>
�������Ʈ  ${orderlistdto.orderlist_usepoint  }<br>
<c:set var="cost" value="${orderlistdto.orderlist_cost }"> </c:set>
<c:set var="addedpoint" value="${(cost*0.1)}"></c:set>
${addedpoint } ����Ʈ�� �����Ǿ����ϴ�!<br>
��ۿ�û����  ${orderlistdto.orderlist_msg  }
<hr>
<!--���� ������ ����  -->
<c:forEach var="item" items="${list}"> 
��ǰ��: ${item.product_name }
����: ${item.order_count }<br>
</c:forEach>


</body>
</html>