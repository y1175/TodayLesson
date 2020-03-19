<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<title>글쓰기</title>


</head>
<body>
	<h2 style="text-align: center;">옵션 등록</h2>
	<br>
	<br>
	<br>

	<div style="width: 60%; margin: auto;">
				제품번호: ${dto.product_no }<br>
		제품명: ${dto.product_name }<br><hr>
		<table>
		<thead>
		<th>옵션명</th><th>추가가격</th></thead>
<c:forEach var="item" items="${optionlist}"> 

<tr>
<td>${item.option_name }</td>
<td>${item.option_cost }</td>
</tr>
</c:forEach>
</table>
<hr>
		<section class="replyForm">
<form role="form" method="post" autocomplete="off">

		<input type="hidden" name="product_no" id="product_no"style="width: 40%;" value="${dto.product_no }" />
		<label>옵션명</label>
	<input type="text" name="option_name" id="option_name" style="width: 40%;" placeholder="옵션명"  /> <br>
	 <label>추가가격 </label>
		<input type="text" name="option_cost" id="option_cost" style="width: 40%;" /> <br>
				 <button id="reply_btn">옵션 추가</button>
				
	
<input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>
</form>
</section>

		
	<section class="replyList">
<ol>
</ol>
</section> 

<a href="${pageContext.request.contextPath }/ej_ad_productlist">제품목록으로 이동</a>

			
	
	</div>
	<script>
 $("#reply_btn").click(function(){
/*   alert('replye_btn'); */
  var formObj = $(".replyForm form[role='form']");
  var gdsNum = $("#product_no").val();
  var repCon = $("#option_name").val();
  var memberid=$("#option_cost").val();
  
  var data = {
  
		 product_no : gdsNum,
		option_name : repCon,
		option_cost: memberid
    };

  
  $.ajax({/* "/shop/view/registReply" */
   url :"/ad_add_pdOption/insertOption_json",// 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
   //request mapping value랑 맞추면되는듯
   type : "post",
   data : data,
   success : function(){
    console.log('success');
    console.log(data);
    console.log('this'+this);

    console.log(data.product_no+" "+data.option_name+" "+data.option_cost);
    $("#repCon").val("");
	 
    
    var str = "";
	str+="<tr><td>"+data.option_name+"</td>"
	str+="<td>"+data.option_cost+"</td></tr>"
   

  
  $("section.replyList ol").append(str);
  
    } 
   ,error: function(){
	   console.log(data);
	   console.log('error');
	   }
  });
 });

</script>
</body>
</html>