<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--style-->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/ej_us_storemain.css?ver=3">
<!--style-->
</head>

<body>
<!--회원의 좋아요와 장바구니  -->
<%-- <span id="ej_like_cart">
 <c:set var="member_id" value="${pageContext.request.userPrincipal.name}"></c:set>
 ${member_id }회원님의
<a href="/todaylessonmypage/mycart/${pageContext.request.userPrincipal.name}" id="mycart">내장바구니</a>
<a href="/todaylessonmypage/mylike/${pageContext.request.userPrincipal.name}" id="mylike">내 좋아요</a><br>
<br>
</span> --%>

<!--메인 슬라이더  -->
<div id="hs_us_home_mainBanner" class="hs_us_home_mainBanner">
      <div class="hs_us_home_mainBannerbox">
	     <div class="hs_us_home_mainBannerslide">
		    <a><img src="${pageContext.request.contextPath }/resources/Banner/main_banner5.jpg" alt="s"></a>
		    <a><img src="${pageContext.request.contextPath }/resources/Banner/main_banner5.jpg" alt="s"></a>
			<a><img src="${pageContext.request.contextPath }/resources/Banner/main_banner5.jpg" alt="s"></a>
			<a><img src="${pageContext.request.contextPath }/resources/Banner/main_banner5.jpg" alt="s"></a>
	     </div>
	  </div>
   </div>
   <br>	
   <br>	
   <div class="" style="width: 80%; margin: auto;">
   <!-- 카테고리 선택 아이콘들 -->
   
 <%--   
    <div class="ej_grid all"><a href="${pageContext.request.contextPath }/todaylesson/ej_store_main/0"><img class="ej_category all" alt="all" src="${pageContext.request.contextPath }/resources/imgUpload/category_icon/ver2/check.png"><br><h4>전체</h4></a></div>
  <div class="ej_grid lang"><a href="${pageContext.request.contextPath }/todaylesson/ej_store_main/1"><img class="ej_category lang" alt="lang" src="${pageContext.request.contextPath }/resources/imgUpload/category_icon/ver2/translation.png"><br>외국어</a></div>
    <div class="ej_grid it"><a href="${pageContext.request.contextPath }/todaylesson/ej_store_main/2"><img class="ej_category it" alt="it" src="${pageContext.request.contextPath }/resources/imgUpload/category_icon/ver2/monitor.png"><br>IT</a></div>
     <div class="ej_grid cook"><a href="${pageContext.request.contextPath }/todaylesson/ej_store_main/3"><img class="ej_category cook" alt="cook" src="${pageContext.request.contextPath }/resources/imgUpload/category_icon/ver2/baker.png"><br>요리</a></div>
      <div class="ej_grid diy"><a href="${pageContext.request.contextPath }/todaylesson/ej_store_main/4"><img class="ej_category diy" alt="diy" src="${pageContext.request.contextPath }/resources/imgUpload/category_icon/ver2/sewing-machine.png"><br>DIY</a></div>
      <div class="ej_grid exercise"> <a href="${pageContext.request.contextPath }/todaylesson/ej_store_main/5"><img class="ej_category exercise" alt="exercise" src="${pageContext.request.contextPath }/resources/imgUpload/category_icon/ver2/bike.png"><br>운동</a></div>
        <div class="ej_grid ect"><a href="${pageContext.request.contextPath }/todaylesson/ej_store_main/6"><img class="ej_category etc" alt="etc" src="${pageContext.request.contextPath}/resources/imgUpload/category_icon/ver2/open-menu.png"><br>기타</a></div>
       <br> --%>
   <div id="ej_category_box">
    <div class="ej_category all"><a href="${pageContext.request.contextPath }/todaylesson/ej_store_main/0" ><div class="ej_category_border"><img class="ej_categoryimg all" alt="all" src="${pageContext.request.contextPath }/resources/imgUpload/category_icon/correct.png"/></div><br>전체</a></div>
  <div class="ej_category lang"><a href="${pageContext.request.contextPath }/todaylesson/ej_store_main/1" ><div class="ej_category_border"><img class="ej_categoryimg lang" alt="lang" src="${pageContext.request.contextPath }/resources/imgUpload/category_icon/lang.png"/></div><br>외국어</a></div>
    <div class="ej_category it"><a href="${pageContext.request.contextPath }/todaylesson/ej_store_main/2" ><div class="ej_category_border"><img class="ej_categoryimg it" alt="it" src="${pageContext.request.contextPath }/resources/imgUpload/category_icon/it.png"/></div><br>IT</a></div>
     <div class="ej_category cook"><a href="${pageContext.request.contextPath }/todaylesson/ej_store_main/3" ><div class="ej_category_border"><img class="ej_categoryimg cook" alt="cook" src="${pageContext.request.contextPath }/resources/imgUpload/category_icon/cook.png"/></div><br>요리</a></div>
      <div class="ej_category diy"><a href="${pageContext.request.contextPath }/todaylesson/ej_store_main/4" ><div class="ej_category_border"><img class="ej_categoryimg diy" alt="diy" src="${pageContext.request.contextPath }/resources/imgUpload/category_icon/diy.png"/></div><br>DIY</a></div>
      <div class="ej_category exercise"> <a href="${pageContext.request.contextPath }/todaylesson/ej_store_main/5"><div class="ej_category_border"><img class="ej_categoryimg exercise" alt="exercise" src="${pageContext.request.contextPath }/resources/imgUpload/category_icon/exercise.png"/></div><br>운동</a></div>
        <div class="ej_category ect"><a href="${pageContext.request.contextPath }/todaylesson/ej_store_main/6"><div class="ej_category_border"><img class="ej_categoryimg etc" alt="etc" src="${pageContext.request.contextPath}/resources/imgUpload/category_icon/etc.png"/></div><br>기타</a></div>
       <br> 
       </div>
        <!-- 스토어 상품 -->
      <b class="" style="font-size: 25px;"> </b>
      <div class="" style="margin-top: 30px;">
      <span id="ej_right">
      <a href="?order=like" ><button class="ej_btn order">좋아요순</button></a>
<a href="?order=recent"><button class="ej_btn order">최신순</button></a>
</span>
<br>
<br>
         <c:forEach var="storenewproductlist" items="${list}">
            <div class="col-md-3 col-sm-6">
               <div class="hs_user_store_newproduct">
                  <div class="hs_user_store_newproduct_img">
                  <div class="hs_user_store_newproduct_img2">
                     <a href="${pageContext.request.contextPath }/todaylesson/ej_store_detail/${storenewproductlist.product_no}">
                        <img src="${storenewproductlist.product_thumb}"/>
                     </a></div>
                     <ul class="hs_user_store_newproduct_social" >
                        <li>
                           <a href="#" ><div class="fas fa-heart" id="${storenewproductlist.product_no}"></div></a>
                        </li>
                        <li>
                         <a href="#" ><div class="fa fa-shopping-cart"" id="${storenewproductlist.product_no}"></div></a>
                        </li>
                     </ul>
                     <span class="hs_user_store_newproduct_label">
                        <c:out value="${storenewproductlist.product_sale}%"/>
                     </span> 
                  </div>
                  <div class="hs_user_store_newproduct_content">
                     <c:set var="category" value="${storenewproductlist.product_category }"/>
                     <c:choose>
                        <c:when test = "${category==1}">
                           <b class="hs_user_store_newproduct_category">
                              <c:out value="외국어"/>
                           </b>   
                        </c:when>
                        <c:when test = "${category==2}">
                           <b class="hs_user_store_newproduct_category">  
                              <c:out value="IT"/>
                           </b>
                        </c:when>
                        <c:when test = "${category==3}">
                           <b class="hs_user_store_newproduct_category">
                              <c:out value="요리"/>
                           </b>   
                        </c:when>
                        <c:when test = "${category==4}">
                           <b class="hs_user_store_newproduct_category">
                              <c:out value="DIY"/>
                           </b>
                        </c:when>
                        <c:when test = "${category==5}">
                           <b class="hs_user_store_newproduct_category">
                              <c:out value="운동"/>
                           </b>
                        </c:when>
                        <c:when test = "${category==6}">
                           <b class="hs_user_store_newproduct_category"> 
                              <c:out value="기타"/>
                           </b>   
                        </c:when>
                     </c:choose>
                     <h6 class="hs_user_store_newprodct_title">
                        <a href="${pageContext.request.contextPath }/todaylesson/ej_store_detail/${storenewproductlist.product_no}">${storenewproductlist.product_name}</a>
                     </h6>
                     <div class="hs_user_store_newproduct_line"></div>
                      <c:set var="stock" value="${storenewproductlist.product_stock}"/>
                           <c:if test="${stock<=0}">
                           <div class="ej_soldout">soldout</div>
                           </c:if>
                     <div class="hs_user_store_newprodct_cost">
                      <fmt:formatNumber value="${storenewproductlist.product_after_cost}" type="number" maxFractionDigits="3"/>원
                        <span class="hs_user_store_newprodct_BFcost">
                       
                           <c:out value="${storenewproductlist.product_cost}원"/>
                           
                        </span>
                        
                     </div>
                     <div class="hs_user_store_newprodct_likenum_box">                
                        <span class="hs_user_store_newprodct_likenum">
                           <i class="fas fa-heart"></i>
                           ${storenewproductlist.product_like}
                          
                        </span>
                     </div>     
                  </div>
               </div>
            </div>
         </c:forEach>
      </div>
   </div>   
 <input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>

   <!-- 스토어 -->
   <script type="text/javascript">
   /* Main Banner Slider */
	var idx = 0; // 함수 호출 횟수
	var i=0; // 이미지 인덱스
	var imgNum=3; // 이미지 개수
	var imgSize=100; // 이미지 크기
	function imgSlide() {
	   idx = idx + 1; // 함수 호출 회수 증가
		i=(idx-1)%imgNum; // 이미지는 3개를 돌려 쓸거라서
	  // idx-1을 해주는 이유 : idx>1 일 때부터 리스트 삭제, 추가가 이루어짐(1초 뒤부터 리스트 추가)
		if(i==0){
			i=imgNum; // 1,2,3,1,2,3 이 반복되어야 함
		}
		
		$('.hs_us_home_mainBannerslide').css({"left":"0px"}); // 0 -> -imgSize을 반복하기 위해
		
	   	$('.hs_us_home_mainBannerslide').stop().animate({'left' : -imgSize+"%"}, "slow");
		if(idx>1){ //idx>0으로 하면 첫 번째 리스트가 슬라이스되기전에 삭제가 된다.
			$('.hs_us_home_mainBannerslide>a:first').remove(); // 제일 첫 <a> 삭제
			$('.hs_us_home_mainBannerslide').append('<a><img src="/resources/Banner/main_banner'+i+'.jpg" alt="s">');
	    //마지막에 <a> 추가
		}
		
	}
	// 3초에 한번 함수를 실행
	setInterval(function() { imgSlide() }, 3000);
	/* Main Banner Slider */ 

   </script>
 <script>
$("#mycart").click(function(){
	if(${member_id}==null)
		{
		alert('로그인이 필요한 페이지입니다.');
		}

});
</script>
<script>

 $(".fas.fa-heart").click(function(){
 var productno=$(this).prop("id");
 var memberid='${pageContext.request.userPrincipal.name}';

  
  var data = {
       product_no : productno,
       member_id: memberid
    };
  if(memberid=='')
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
    	    location.href = "/todaylesson/ej_store_main/0";

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
<script>
$(".fa.fa-shopping-cart").click(function(){ 

 var productno=$(this).prop("id");
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
   url :"/todaylesson/cartjson",
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
    		alert('장바구니에 추가되었습니다.');
    	    location.href = "/todaylesson/ej_store_main/0";

    		}
    	else{
    		alert('이미 장바구니에 추가된 상품입니다.');
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






</body>
</html>