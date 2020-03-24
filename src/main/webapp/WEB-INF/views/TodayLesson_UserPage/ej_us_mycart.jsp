<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<form method="post" action="">
mycart페이지<br>
<table>
<thead>
<tr>
<th></th><th>상품번호</th><th></th><th>상품명</th><th>레슨명</th><th>가격</th><th>수량</th>
</tr>
</thead>
<tbody>
<c:forEach var="item" items="${list}">
<tr>
<td><input type="checkbox" value="${item.product_name }" id=${item.product_after_cost }></td>
<td>${item.product_no }</td>
<td><a href="${pageContext.request.contextPath}/ej_store_detail/${item.product_no}"><img src="${item.product_thumb}" alt="thumb"></a></td>
<td><a href="${pageContext.request.contextPath}/ej_store_detail/${item.product_no}">${item.product_name }</a></td>
<td>${item.lesson_no }</td>
<td>${item.product_after_cost }</td>
<td>${item.cart_amount }</td>
</tr>
</c:forEach> 
</tbody>
</table>
<hr>
<section id="checkedlist">
<th>상품명</th><th>가격</th><th>수량</th>
</section>
<hr>
<input type="submit" value="주문하기">
</form>
<script>
$("input:checkbox").on('click', function() {
	
	var product_name= $(this).val();
	var cart_amount= $(this).prop('id');
	console.log("product_name",product_name);
	console.log("cart_amount",cart_amount);
	var data={
			product_name: product_name,
			cart_amount: cart_amount
			
	}
 /*    var str = "";
	str+="<tr><td>"+data.member_id+"</td>"
	str+="<td>"+data.pdreview_content+"</td></tr>"
   

  
  $("section.replyList ol").append(str); */
	$.ajax({
		url:"/showcheckedlist_json",
		type:"post",
		data: data,
		success: function(){
			
			var cartlist="";
				cartlist+="<tr><td>"+data.product_name+"</td>"
				cartlist+="<td><input type='text' value="+data.cart_amount+"></td></tr>"
			console.log(cartlist);
				$('#checkedlist').append(cartlist);
		},error: function(){
			console.log('error');
	}	
	});

});
</script>
</body>
</html>