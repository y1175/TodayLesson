<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TodayLesson</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/yi_us_orderlist.css?ver=3">
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	$.ajax({
		url:'/todaylessonmypage/myorderlist_detail/'
		,dataType:'json'
		,success:function(item){
			
			for(var i=0;i<item.length;i++)
				{
				let orderdetail1="";
				let orderdetail2="";
				let orderdetail3="";
				let product_category="";
				if(item[i].product_category==1)
				{
				product_category="외국어";
				}
				else if(item[i].product_category==2)
				{
				product_category="IT";
				}
				else if(item[i].product_category==3)
				{
				product_category="요리";
				}
				else if(item[i].product_category==4)
				{
				product_category="DIY";
				}
				else if(item[i].product_category==5)
				{
				product_category="운동";
				}
				else if(item[i].product_category==6)
				{
				product_category="기타";
				}
				
			orderdetail1+="<img src="+"'"+item[i].product_thumb+"'"+" alt='thumb'><br>";
			orderdetail2+="[스토어>"+product_category+"]<br>";
			orderdetail2+="상품명:"+item[i].product_name+"<br>";
			orderdetail3+="가격:"+item[i].orderlist_cost+"원"+"<br>";
				$("#a"+item[i].orderlist_no).append(orderdetail1);
				$("#b"+item[i].orderlist_no).append(orderdetail2);
				$("#c"+item[i].orderlist_no).append(orderdetail3);
				}
			
			
		}
		
	});
	
})

</script>
<body>
<div id="yi_container">
<h3><span class="memberid">${member_id }</span>님의 주문내역</h3>
<form action="/todaylessonmypage/user_myorderlist">
<div class="row order_period">
<div class="col-sm-5">
<input class="form-control" type="date" name="start_date">
</div> ~ 
<div class="col-sm-5">
<input class="form-control" type="date" name="end_date">
</div>
 <input type="submit" class="order_search_btn" value="조회">
</div>
</form>

<c:forEach var="orderlist" items="${list}">
<div class="container"></div>
주문일자:<span class="data_info">${orderlist.orderlist_date }</span>	
주문번호:<span class="data_info"> ${orderlist.orderlist_no }</span> 
주문상태:<c:choose>
<c:when test='${orderlist.orderlist_orderstatus==1}'>
<span class="data_info">주문완료</span>
</c:when>
<c:when test='${orderlist.orderlist_orderstatus==2}'>
<span class="data_info">배송중</span>
</c:when>
<c:when test='${orderlist.orderlist_orderstatus==3}'>
<span class="data_info">배송완료</span>
</c:when>
<c:when test='${orderlist.orderlist_orderstatus==4}'>
<span class="data_info">배송취소</span>
</c:when>
</c:choose>
<input type="button" class="order_detail_btn" value="상세보기" onclick="location.href='/todaylessonmypage/myorderlist_orderinfo/${orderlist.orderlist_no}'"><br>
 <div class="detailline"></div>
<div class="no" >
<div class="container">
<div class="row">
<div class="col order_thumb" id='a${orderlist.orderlist_no}'></div>
<div class="col myproduct" id='b${orderlist.orderlist_no}'></div>
<div class="col ordercost" id='c${orderlist.orderlist_no}'></div>
</div>
</div>
 <div class="detailline"></div>
</div>
</c:forEach>
<div class="paging">
<ul class="pagination pagination-danger">
<c:if test="${page.prev }">
<li class="page-item">
<a class="page-link" href="user_myorderlist?currPage=${page.startBlock-1}&start_date=${start_date}&end_date=${end_date}">PREV
</a></li>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
<li class="page-item">
<a class="page-link" href="user_myorderlist?currPage=${index }&start_date=${start_date}&end_date=${end_date}">${index }
</a></li>
</c:if>

<c:if test="${index==page.currPage }">
<li class="active page-item"><a href="javascript:void(0);" class="page-link">${index }</a></li>
</c:if>

</c:forEach>

<c:if test="${page.next }">
<li class="page-item">
<a class="page-link" href="user_myorderlist?currPage=${page.endBlock+1 }&start_date=${start_date}&end_date=${end_date}">NEXT
</a></li>
</c:if>
</ul>
</div>

</div>
</body>
</html>
