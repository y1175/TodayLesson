<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap4 summernote -->
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<!-- Bootstrap4 summernote -->

<!--summernote css/js/ko-kr-->
   <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
   <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
   <script src="/resources/JS/summernote-ko-KR.js"></script>
<!--summernote css/js/ko-kr-->

<!--owl carousel css, js-->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/owl.carousel.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/owl.theme.default.css">
   <script src="${pageContext.request.contextPath}/resources/JS/owl.carousel.js"></script>
   <script src="${pageContext.request.contextPath}/resources/JS/owl.carousel.min.js"></script>
<!--owl carousel css, js-->
    
<!--style-->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/ej_us_storedetail.css"> 
<!--style-->

<script>
$('document').ready(function() { 
	$('html, body').animate({
		scrollTop: $('html').offset().top
	}, 'slow');
	/*관련상품카르셀  */
	var owl = $('.owl-carousel');
	owl.owlCarousel({
	    items:4,
	    loop:true,
	    margin:10,
	    nav: true,/* 
	    autoplay:true,
	    autoplayTimeout:1000,
	    autoplayHoverPause:true */
	});
	
	 $('.owl-carousel').owlCarousel();
	 
	$('#summernote').summernote({
		placeholder : '후기를 남겨보세요!',
		minHeight : 370,
		maxHeight : null,
		/* focus : true, */
		lang : 'ko-KR'
	});	
});
</script>

</head>
<body>


<div id="ej_container">


  <form role="form" method="post" id="form1" name="form" >
 
<!--썸네일 이미지 원본 맨위에 보여줌-->
<div class="ej_top img">
<img src="${dto.product_img }" id="ej_sdetail_topimg" width="60%">
</div>

<div class="ej_top right">
<c:set var="category" value="${dto.product_category }"/>
 <c:choose>
 <c:when test = "${category==1}">외국어</c:when>
         <c:when test = "${category==2}">IT </c:when>
            <c:when test = "${category==3}">요리</c:when>
            <c:when test = "${category==4}">DIY</c:when>
            <c:when test = "${category==5}">운동</c:when>
            <c:when test = "${category==6}">기타</c:when>
          <c:otherwise>기타</c:otherwise>
          </c:choose><br>
          
<h3><c:out value="${dto.product_name}"></c:out><br></h3>
<h4 class="beforecost" id="ej_cost"><fmt:formatNumber value="${dto.product_cost}" type="number" maxFractionDigits="3"/>원 </h4>
<div id="ej_cost"><c:out value="${dto.product_sale}"/>%</div> <div id="ej_cost"><h3> <fmt:formatNumber value="${dto.product_after_cost}" type="number" maxFractionDigits="3"/>원 </h3></div><br>




수량 <input type=text size="1" name="pdcount" id="pdcount" placeholder="1" size="2" value=1 required="required"><br>
배송비 무료<br>


<div class="ej_grid fist">
<input type="submit" value="구매하기" id="to_orderform" class='btn btn-primary' ><br></div>
<div class="ej_grid second">
<a href="#"><div class="fas fa-heart" id="${dto.product_no}"></div></a></div>
<div class="ej_grid third">
<a href="#"><div class="fa fa-shopping-cart" id="${dto.product_no}"></div></a></div>


<input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>
<input type="hidden" name="product_no" value="${dto.product_no }"/>
<input type="hidden" name="product_name" value="${dto.product_name }"/>
<input type="hidden" name="product_cost" value="${dto.product_cost }"/>
<input type="hidden" name="product_after_cost" value="${dto.product_after_cost }"/>
<input type="hidden" name="member_id" value="${pageContext.request.userPrincipal.name}" id="member_id">
 </div><!--id="ej_sdetail_right"-->
 </form>

 
 <script>

	$("#to_orderform").click(function(){
		if(${dto.product_stock }<=0)
			{
			alert('일시품절된 상품입니다.');
			}
		else{
		 $("form").attr("action", "${pageContext.request.contextPath}/todaylesson/ej_us_orderform");
			$("form").submit();  
		}
		
	});
	
	
/* 장바구니 아이콘 */
 $(".fa.fa-shopping-cart").click(function(){ 
	 
  var productno=$(this).prop("id");
  var member_id='${pageContext.request.userPrincipal.name}';
  var pdcount=$("#pdcount").val();
  
  console.log(pdcount);
  var data = {
       product_no : productno,
       member_id: member_id,
       cart_amount: pdcount
    };
  console.log(member_id);
  if(member_id=='')
  {
  alert('로그인이 필요합니다.');
  }else{
 
  $.ajax({
   url :"/todaylesson/cartwith_amount_json",// 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
   //request mapping value랑 맞추면되는듯
   type : "post",
   data : data,
   success : function(result){
	   console.log('result:',result);
    if(data.member_id==null)
       {
       alert('로그인이 필요합니다.');
       }
    else{
    	if(result=="success")
    		{
    		alert('장바구니에'+data.cart_amount+'개 담겼습니다');
    		}
    	else{
    		alert('이미 장바구니에 추가된 상품입니다.');
    	}
    		
    }
   
    } 
   ,error: function(){
      console.log('error');
      }
  }); 
  }
 });

</script>
 <script>

 $(".fas.fa-heart").click(function(){
	 
	 var productno=$(this).prop("id");
	 
  var member_id='${pageContext.request.userPrincipal.name}';
  
  var data = {
       product_no : productno,
       member_id: member_id
    };
  
  if(member_id=='')
  {
  alert('로그인이 필요합니다.');
  }else{
 
  $.ajax({
   url :"/todaylesson/likejson",// 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
   //request mapping value랑 맞추면되는듯
   type : "post",
   data : data,
   success : function(result){
	   console.log('result:',result);
    if(data.member_id==null)
       {
       alert('로그인이 필요합니다.');
       }
    else{
    	if(result=="success")
    		{
    		alert('♥');
    		}
    	else{
    		alert('이미 좋아요에 추가된 상품입니다.');
    	}
    		
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
<h3>관련상품</h3>
<hr>
 <!--관련상품 슬라이더  -->

<!--  <div id="wrapper"> -->
	<div class="owl-carousel owl-theme">
  	 <c:forEach var="prolist" items="${list}" begin="1" end="12">
  		<div class="item">
  			<a href="${pageContext.request.contextPath }/todaylesson/ej_store_detail/${prolist.product_no}"><img src="${prolist.product_thumb }" alt="thumb"><br>
  			<h4>${prolist.product_name }</h4></a><br>
  			<fmt:formatNumber value="${prolist.product_cost}" type="number" maxFractionDigits="3"/>원
  		</div>
  	</c:forEach> 
  	</div> 

 
 
<!--상품소개/후기/배송   -->
<a href="#ej_first"><div class="btn-group" role="group">
    <button type="button" class="btn btn-default">상품소개</button></div></a>
  <a href="#ej_second"><div class="btn-group" role="group">
    <button type="button" class="btn btn-default">후기</button></div></a>
  <a href="#ej_third"><div class="btn-group" role="group">
    <button type="button" class="btn btn-default">배송/교환/환불</button></div></a>
<!--상품소개/후기/배송   -->





<br>
<div id="ej_first">
상품소개
</div>
<hr>

<div id="ej_content">
<img alt="topimg" src="${pageContext.request.contextPath}/resources/IMG/lesson_product_topimg.png" >
${dto.product_content}

</div>

<!-- 후기 -->
<br>
<div id="ej_second">
후기
</div>
<hr>
<table>
<c:forEach var="item" items="${reply}"> 

<tr>
<td>${item.member_id }</td>
<td class="reviewTitle">${item.pdreview_title }</td>
<td class="reviewCon">${item.pdreview_content }</td>
<td>${item.pdreview_date }</td>
</tr>
</c:forEach>
</table>

 <section class="replyList">
<ol>
</ol>
</section> 

<section class="replyForm">
<form role="form" method="post" autocomplete="off">
<input type="hidden" name="gdsNum" id="gdsNum" value="${dto.product_no }">
 <td><label>제목</label>
      <input type="text" id="pdreview_title" class="pdreview_title"name="pdreview_title">
<div class="input_area">
	<textarea name="pdreview_content" class="repCon" id="summernote" ></textarea>
</div>

<div class="input_area">
<button type="button" id="reply_btn" class="btn btn-primary">후기 남기기</button>

</form>

</section>

<script>
/* $(".reviewCon").hide(); */
 $(".reviewCon").slideUp();

$(".reviewTitle").click(function(){
	console.log(this);
	//전체 댓글내용 다보이니까
	//this 의 내용만 보이도록 수정하기
	/* $(".reviewCon").toggle(); */
	$(this).next(".reviewCon").slideToggle(100);
}); 

 $("#reply_btn").click(function(){

  var formObj = $(".replyForm form[role='form']");
  var gdsNum = $("#gdsNum").val();
  var pdreview_title= $(".pdreview_title").val();
  var repCon = $(".repCon").val();
  var member_id=$("#member_id").val();
  
  var data = {
		 product_no : gdsNum,
		 pdreview_content : repCon,
		 pdreview_title: pdreview_title,
		 member_id: member_id
    };

  
  $.ajax({
   url :"/todaylesson/ej_store_detail/registReply",// 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
   //request mapping value랑 맞추면되는듯
   type : "post",
   data : data,
   success : function(){
	   
    console.log(data.product_no+" "+data.pdreview_content+" "+data.member_id);
    $(".repCon").val("");
    $(".pdreview_title").val("");
	 /* 
    if(data.member_id!=null)
    	{
    	alert('hello');
    	} */
    var str = "";
	str+="<tr><td>"+data.member_id+"</td>"
	str+="<td>"+data.pdreview_title+"</tr>"
	/* str+="<td>"+data.pdreview_content+"</td></tr>" */
   

  
  $("section.replyList ol").append(str);
  
    } 
   ,error: function(){
	   console.log(data);
	   console.log('error');
	   alert('구매한 고객만 후기를 작성 할 수 있습니다.');
	   }
  });
 });

</script>

   
<div id="ej_third">
배송/교환/환불
</div>
<hr>
<img alt="delivery_rule" src="${pageContext.request.contextPath}/resources/IMG/delivery_rule.png">
</div>
</div>
<!--container  -->
    

</body>

</html>