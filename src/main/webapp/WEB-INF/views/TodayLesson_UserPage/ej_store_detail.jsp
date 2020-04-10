<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<!--    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script> -->
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
    
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/ej_us_storedetail.css?ver=4">  
<%--  <script src="${pageContext.request.contextPath}/resources/JS/ej_us_storedetail.js"></script> --%>

<script>
$(document).ready(function(){ 
	//스크롤 맨위로
	 $('html, body').animate({
	      scrollTop: $('html').offset().top
	   }, 'slow');
	
	   /*관련상품카르셀  */
	   var owl = $('.owl-carousel');
	   owl.owlCarousel({ /*  loop:true, */
	       items:5,
	       margin:70,
	       nav: true ,
	       autoplay:true,
	       autoplayTimeout:1000,
	       autoplayHoverPause:true  
	   });
	   
	    $('.owl-carousel').owlCarousel();
	    
//썸머노트
$('#summernote').summernote({
	placeholder : '후기를 남겨보세요!',
	minHeight : 370,
	maxHeight : null,
	lang : 'ko-KR'
});	
});

</script>



</head>
<body>


<div id="ej_container">


  <form role="form" method="post" id="form1" name="form" >
 
<!--썸네일 이미지 원본 맨위에 보여줌-->
<div class="ej_top imgbox">
<img src="${dto.product_img }" id="ej_sdetail_topimg" width="60%">
</div>

<div class="ej_top right">
<%-- <img alt="banner" src="${pageContext.request.contextPath}/resources/IMG/product_detail_banner.png" ><br><br> --%>
<a href="${pageContext.request.contextPath}/todaylesson/total_lesson_list"><img alt="banner" src="${pageContext.request.contextPath}/resources/IMG/ej_banner_blue_ver2.png" ></a>
<br><br>
<c:set var="category" value="${dto.product_category }"/>
 <c:choose>
 <c:when test = "${category==1}">외국어</c:when>
         <c:when test = "${category==2}">IT </c:when>
            <c:when test = "${category==3}">요리</c:when>
            <c:when test = "${category==4}">DIY</c:when>
            <c:when test = "${category==5}">운동</c:when>
            <c:when test = "${category==6}">기타</c:when>
          </c:choose><br>
          
<h2 style="font-weight:bold;"><c:out value="${dto.product_name}"></c:out></h2><br><div class="ej_line top_right"></div>
<span class="ej_top font">가격   </span><h4 class="beforecost" id="ej_cost"><fmt:formatNumber value="${dto.product_cost}" type="number" maxFractionDigits="3"/>원 </h4>
<div id="ej_cost"><c:out value="${dto.product_sale}"/>%</div> <div id="ej_cost"><h3> <fmt:formatNumber value="${dto.product_after_cost}" type="number" maxFractionDigits="3"/>원 </h3></div><br>

<span class="ej_top font middle logintxt" ></span><b style="color:rgb(224, 62, 82);">로그인 후, 적립혜택이 제공됩니다.</b><br>




<span class="ej_top font">배송</span>배송비 무료<br>
<span class="ej_top font middle"></span>오후3시 주문상품까지 당일출고<br>

<span class="ej_top font">수량</span> <input type=text size="1" name="pdcount" id="pdcount" placeholder="1" size="2" value=1 required="required"><br>
<br>
<c:set var="cost" value="${dto.product_after_cost }"/>
<div id="ej_point_box">적립금</div> <c:set var="pluspoint" value="${cost*0.01 }"/><fmt:parseNumber var="pluspoint" value="${(cost*0.1)}" integerOnly="true" /> <b>${pluspoint }포인트<br>
<br>
<div class="ej_line top_right"></div>
<!--아이콘 3개  -->
<div class="ej_grid fist">
<input type="submit" value="구매하기" id="to_orderform" class="ej_btn buy" ><br></div>
<div class="ej_grid second">
<a href="#"><div class="fas fa-heart" id="${dto.product_no}"></div></a></div>
<div class="ej_grid third">
<a href="#"><div class="fa fa-shopping-cart" id="${dto.product_no}"></div></a></div><br>
<!--아이콘 3개/  -->


<input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>
<input type="hidden" name="product_no" value="${dto.product_no }"/>
<input type="hidden" name="product_name" value="${dto.product_name }"/>
<input type="hidden" name="product_cost" value="${dto.product_cost }"/>
<input type="hidden" name="product_after_cost" value="${dto.product_after_cost }"/>
<input type="hidden" name="member_id" value="${pageContext.request.userPrincipal.name}" id="member_id">
 </div><!--id="ej_sdetail_right"-->
 </form>

 
 <script>
//구매하기
 $("#to_orderform").click(function(){
	 $("form").attr("action", "${pageContext.request.contextPath}/todaylesson/ej_us_orderform");
		$("form").submit();  
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

//좋아요 아이콘
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
<span class="ej_font bold"><h3>관련상품</h3></span>
<div id="ej_line_narrow"></div>
 <!--관련상품 슬라이더  -->

<!--  <div id="wrapper"> -->
	<div class="owl-carousel owl-theme">  	 <c:set var="nowno" value="${dto.product_no }"/>
  	 <c:forEach var="prolist" items="${list}"  begin="1"><%-- begin="1" end="10" --%>
  	 <c:set var="listno" value="${prolist.product_no }"/>
  	<%--  <c:if test="${ nowno!=listno}"> --%>
  		<div class="item">
  		 	<a href="${pageContext.request.contextPath }/todaylesson/ej_store_detail/${prolist.product_no}"><img src="${prolist.product_thumb }" alt="thumb"></a><br>
  			<h4>${prolist.product_name }</h4><br>
  			<fmt:formatNumber value="${prolist.product_cost}" type="number" maxFractionDigits="3"/>원 
  		</div>
  		 <%-- </c:if> --%>
  	</c:forEach>
  	</div> <br><br>

 <div id='cssmenu'>
	<ul>
   		<li><a href="#ej_box_first">상품소개</a></li>
   		<li><a href="#ej_box_second">후기</a></li>
   		<li><a href="#ej_box_third">배송/교환/환불</a></li>
 
	</ul>
</div>
<br>

<div id="ej_container_content">
<div class="ej_box first" id="ej_box_first">
<span class="ej_left"><span class="ej_font bold"><h3>상품소개</h3></span></span>
</div>

<img alt="topimg" src="${pageContext.request.contextPath}/resources/IMG/lesson_product_topimg.png" >
<div id="ej_content" style="text-align: center;">
${dto.product_content}
</div>
<br>
<!-- 후기 -->
<div class="ej_box second"  id="ej_box_second">
<span class="ej_left"><span class="ej_font bold"><h3>후기</h3></span></span>
</div>
<!-- 댓글리스트 -->
<table class="table"> 
<c:forEach var="item" items="${reply}"> 
<tr>
<td class="reviewTitle" style="font-weight: bold;">${item.pdreview_title }  </td>
<td>${item.member_id } </td>
<td>${item.pdreview_date }  </td>
</tr>
<tr>
<td class="reviewCon" colspan="3">${item.pdreview_content }</td>
</tr>
</c:forEach>
</table>
<!-- 댓글리스트/ -->

<!-- 방금쓴 댓글(새로고침전) -->
 <section class="replyList">
<ol>
</ol>
</section> 
<!-- 방금쓴 댓글(새로고침전)/ -->
<button type="button" id="openReplyFormbtn" class="ej_btn">후기남기기</button>
<!--후기작성폼  -->
<section class="replyForm">
<form role="form" method="post" autocomplete="off">
<input type="hidden" name="gdsNum" id="gdsNum" value="${dto.product_no }">
 <div class="ej_left"><label>제목</label>
      <input type="text" id="pdreview_title" class="pdreview_title"name="pdreview_title"></div><br>
      <br>
      
<div class="input_area">
	<textarea name="pdreview_content" class="repCon" id="summernote" ></textarea>
</div>
<button type="button" id="reply_btn" class="ej_btn">작성</button>

</form><br>		
</section>
                                                 <!--후기작성폼/ -->

   
<div class="ej_box third"  id="ej_box_third">
<span class="ej_left"><span class="ej_font bold"><h3>배송/교환/환불</h3></span></span>
</div>
<hr>
<img alt="delivery_rule" src="${pageContext.request.contextPath}/resources/IMG/delivery_rule.png">
</div>
<!--container_content/  -->

</div>
<!--container/  -->
    <script>
	//후기
$(".replyForm").slideUp();
$("#openReplyFormbtn").click(function(){
	$(".replyForm").toggle();
	
});

$(".reviewCon").slideUp();$(".reviewTitle").click(function(){
	 	$(this).parent().next().find('td').eq(0).toggle();
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
    

</body>

</html>