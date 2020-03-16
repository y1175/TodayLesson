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
		
		<%-- <form role="form" method="post" action="${pageContext.request.contextPath }/ej_ad_pdOption_insertresult">  --%>
		<section class="replyForm">
<form role="form" method="post" autocomplete="off">
		제품번호: ${dto.product_no }<br>
		제품명: ${dto.product_name }<br>
		<input type="hidden" name="product_no" id="product_no"style="width: 40%;" value="${dto.product_no }" />
	<%-- 	<c:forEach var="i" begin="1" end="4"> --%>

    

		<label>옵션번호: </label>
		<input type="text" name="pd_option_no" id="pd_option_no" style="width: 40%;" value="${i}" /> <br>
				 <input type="text" name="pd_option_name" id="pd_option_name" style="width: 40%;" placeholder="옵션명"  /> <br>
				 <button id="reply_btn">옵션 추가</button>
		<%-- 	</c:forEach> --%>

</form>
</section>

		
	<section class="replyList">
<ol>
</ol>
</section> 
 <input type="submit" value="옵션 등록"/>

			
		</form>
	</div>
	<script>
 $("#reply_btn").click(function(){
/*   alert('replye_btn'); */
  var formObj = $(".replyForm form[role='form']");
  var gdsNum = $("#product_no").val();
  var repCon = $("#pd_option_name").val();
  var memberid=$("#pd_option_no").val();
  
  var data = {
    /* gdsNum : gdsNum,
    repCon : repCon */
		 product_no : gdsNum,
		 pd_option_name : repCon,
		 pd_option_no: memberid
    };

  
  $.ajax({/* "/shop/view/registReply" */
   url :"/ej_ad_insertOption_json",// 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
   //request mapping value랑 맞추면되는듯
   type : "post",
   data : data,
   success : function(){
    console.log('success');
    console.log(data);
    console.log('this'+this);
    console.log(data.product_no+" "+data.pd_option_no+" "+data.pd_option_name+"kl");
    $("#repCon").val("");
	 
    if(data.member_id!=null)
    	{
    	alert('hello');
    	}
    var str = "";
	str+="<tr><td>"+data.member_id+"</td>"
	str+="<td>"+data.pdreview_content+"</td></tr>"
   

  
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