<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	
	$.ajax({
		url:'/todaylessonmypage/myorderlist_detail/'
		,dataType:'json'
		,success:function(item){
			console.log(item[0].orderlist_no);
			
			for(var i=0;i<item.length;i++)
				{
				let orderdetail="";

			orderdetail+="<img src="+"'"+item[i].product_thumb+"'"+" alt='thumb'><br>";
			orderdetail+="[스토어>"+item[i].product_category+"]<br>";
			orderdetail+="[상품명:"+item[i].product_name+"]<br>";
			orderdetail+="가격:"+item[i].orderlist_cost+"<br>";
			orderdetail+="주문번호:"+item[i].orderlist_no+"<br>";
				$("#"+item[i].orderlist_no).append(orderdetail);
				}
			
			
		}
		
	});
	
})

</script>
<body>
주문내역
<form action="/todaylessonuser/user_myorderlist_date">
<input type="date" name="start_date"> ~ <input type="date" name="end_date"> <input type="submit" value="조회">
</form>

<c:forEach var="orderlist" items="${list}">

주문일자:${orderlist.orderlist_date }	주문번호: ${orderlist.orderlist_no } 주문상태:${orderlist.orderlist_orderstatus}
<input type="button" value="상세보기" onclick="location.href='/todaylessonuser/user_myorderdetail/${orderlist.orderlist_no}'"><br>
<div class="no" id='${orderlist.orderlist_no}'>

</div>
<c:forEach var="orderdetail" items="${detailList }">
<img src="${orderdetail.product_thumb}" alt="thumb"><br>
[스토어>${orderdetail.product_category}]<br>
[상품명:${orderdetail.product_name}]<br>
가격:${orderdetail.orderlist_cost}<br>
${orderdetail.orderlist_no }
<br>
</c:forEach>
</c:forEach>
</body>
</html>
