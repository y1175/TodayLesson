<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- <script src="resources/JS/summernote-lite.js"></script> -->
<!-- <script src="/JS/summernote-lite.js"></script> -->
<!-- <script src="resources/JS/summernote-ko-KR.js"></script> -->
<!-- <script src="/JS/summernote-ko-KR.js"></script> -->
<!-- <link rel="stylesheet" href="resources/CSS/summernote-lite.css"> -->
<!--  <link rel="stylesheet" href="/CSS/summernote-lite.css"> -->
<style>
#thumb{
display:inline-block;
width:30%}
h4.beforecost{
text-decoration: line-through;}
#ej_cost{
display: inline-block;} 
</style>
</head>

<body>
 <c:set var="member_id" value="${pageContext.request.userPrincipal.name}"></c:set>
 ${member_id }회원님의
<a href="mycart/${member_id}" id="mycart">내장바구니</a>
<a href="mylike/${member_id}" id="mylike">내 좋아요</a><br>
<script>
$("#mycart").click(function(){
	if(${member_id}==null)
		{
		alert('로그인이 필요한 페이지입니다.');
		}
	alert('안녕');
});
</script>
 <form role="form" method="post" autocomplete="off">  
<c:forEach var="item" items="${list}"> 

<div id="thumb">
<a href="ej_store_detail/${item.product_no}"><img src="${item.product_thumb}" alt="thumb"></a><br>

<c:set var="category" value="${item.product_category }"/>
 <c:choose>
         <c:when test = "${category==1}">
            외국어
         </c:when>
            <c:when test = "${category==2}">
            IT
         </c:when>
            <c:when test = "${category==3}">
            요리
         </c:when>
            <c:when test = "${category==4}">
            DIY
         </c:when>
            <c:when test = "${category==5}">
            운동
         </c:when>
            <c:when test = "${category==6}">
            기타
         </c:when>
          <c:otherwise>
        기타
         </c:otherwise> 
      </c:choose><br>
<a href="ej_store_detail/${item.product_no}">${item.product_name}</a>
<input type="image" src="" name="" class="ej_cart_btn"  id="${item.product_no}" value="장바구니">
<input type="image" src="" class="ej_like_btn" id="${item.product_no}" value="좋아요">
  

<hr>
<h4 class="beforecost" id="ej_cost">
${item.product_cost}원</h4>

<div id="ej_cost"><c:out value="${item.product_sale}"/>%</div> <div id="ej_cost"><h3><c:out value="${item.product_after_cost}"></c:out>원 </h3></div><br>
</div>
</c:forEach>
 </form> 
<script>

 $(".ej_like_btn").click(function(){


 var productno=$(this).prop("id");
 console.log(productno);

  
  var memberid='${pageContext.request.userPrincipal.name}';
  
  var data = {
       product_no : productno,
       member_id: memberid
    };
  console.log(memberid);
  if(memberid=='')
  {
  alert('로그인이 필요합니다.');
  }else{
 
  $.ajax({
   url :"/likejson",// 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
   //request mapping value랑 맞추면되는듯
   type : "post",
   data : data,
   success : function(){
    console.log('success');
    console.log(data);
    console.log('this'+this);
    console.log(data.product_no+" "+data.member_id);
   
    
    if(data.member_id==null)
       {
       alert('로그인이 필요합니다.');
       } 
   
    } 
   ,error: function(){
      console.log(data);
      console.log('error');
     // alert('로그인이 필요합니다.');
      }
  }); 
  }
 });

</script>
<script>

 $(".ej_cart_btn").click(function(){
 //alert('replye_btn'); 

 var productno=$(this).prop("id");
 console.log(productno);
  //var formObj = $(".replyForm form[role='form']");
  
  var memberid='${pageContext.request.userPrincipal.name}';
  
  var data = {
       product_no : productno,
       member_id: memberid
    };
  console.log(memberid);
  if(memberid=='')
  {
  alert('로그인이 필요합니다.');
  }else{
 
  $.ajax({
   url :"/cartjson",// 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
   //request mapping value랑 맞추면되는듯
   type : "post",
   data : data,
   success : function(){
    console.log('success');
    console.log(data);
    console.log('this'+this);
    console.log(data.product_no+" "+data.member_id);
   
    
    if(data.member_id==null)
       {
       alert('로그인이 필요합니다.');
       } 
   
    } 
   ,error: function(){
      console.log(data);
      console.log('error');
     // alert('로그인이 필요합니다.');
      }
  }); 
  }
 });

</script>





<input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>
</body>
</html>