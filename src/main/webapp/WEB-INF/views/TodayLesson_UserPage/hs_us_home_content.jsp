<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>TodayLesson</title>

<!--Main HOME style-->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hs_us_home_content.css?ver=5">
<!--Main HOME style-->

</head>
<body>
   <div id="hs_us_home_mainBanner" class="hs_us_home_mainBanner">
      <div class="hs_us_home_mainBannerbox">
	     <div class="hs_us_home_mainBannerslide">
		    <a><img src="resources/Banner/main_banner5.jpg" alt="s"></a>
		    <a><img src="resources/Banner/main_banner5.jpg" alt="s"></a>
			<a><img src="resources/Banner/main_banner5.jpg" alt="s"></a>
			<a><img src="resources/Banner/main_banner5.jpg" alt="s"></a>
	     </div>
	  </div>
   </div>	
	
   <div style="margin: 80px 0px 80px; text-align: center;">
      <a>
	     <img alt="" src="resources/IMG/Mainimg6.jpg">
	  </a>
   </div>
      <!-- 레슨 베스트 -->
   <div id="hs_us_bestLesson" style="width: 80%; margin: auto;">
      <b class="" style="font-size: 25px;"> 레슨베스트 </b>
      <div class="hs_us_bestLesson_container">
         <div class="hs_us_bestLesson_g-scrolling-carousel">
            <div class="hs_us_bestLesson_items">
               
                  <c:forEach var="newlessonlist" items="${newlessonlist}">
                     
                     <a href="${pageContext.request.contextPath }/todaylesson/lesson_detail/${newlessonlist.lesson_no}">
                        <img class="hs_us_bestLesson_img" src="${newlessonlist.lesson_thumb}" alt="">
                     <c:set var="category" value="${newlessonlist.lesson_category }"/>
                     <c:choose>
                        <c:when test = "${category==1}">
                           <p>
                              <c:out value="운동"/>
                              <span> ㆍ </span>
                              <c:out value="${newlessonlist.senior_nick}"/>
                           </p>   
                        </c:when>
                        <c:when test = "${category==2}">
                           <p>  
                              <c:out value="교육"/>
                              <span> ㆍ </span>
                              <c:out value="${newlessonlist.senior_nick}"/>
                           </p>
                        </c:when>
                        <c:when test = "${category==3}">
                           <p>
                              <c:out value="핸드메이드"/>
                              <span> ㆍ </span>
                              <c:out value="${newlessonlist.senior_nick}"/>
                           </p>   
                        </c:when>
                        <c:when test = "${category==4}">
                           <p>
                              <c:out value="IT"/>
                              <span> ㆍ </span>
                              <c:out value="${newlessonlist.senior_nick}"/>
                           </p>
                        </c:when>
                        <c:when test = "${category==5}">
                           <p>
                              <c:out value="요리"/>
                              <span> ㆍ </span>
                              <c:out value="${newlessonlist.senior_nick}"/>
                           </p>
                        </c:when>
                        <c:when test = "${category==6}">
                           <p> 
                              <c:out value="기타"/>
                              <span> ㆍ </span>
                              <c:out value="${newlessonlist.senior_nick}"/>
                           </p>   
                        </c:when>
                     </c:choose>
                     <p>
                        <c:out value="${newlessonlist.lesson_title}"/>
                     </p>
                     <hr style="margin: 0px 0px 5px;">
                     <p class="hs_us_bestLesson_ATcost">
                        <fmt:formatNumber value="${cal_lessonrevenuecost}" type="number" maxFractionDigits="3"/>원
                        <span class="hs_us_bestLesson_BFcost">
                           <fmt:formatNumber value="${cal_lessonrevenuecost}" type="number" maxFractionDigits="3"/>원
                        </span>
                     </p>
                     <p>
                        <i class="fas fa-heart" style="color: rgb(224, 62, 82);"></i>
                           111
                     </p>
                     </a>
                  </c:forEach>
   
            </div>
         </div>
      </div>
   </div>
   <!-- 레슨베스트 -->
   <!-- 레슨 신규 -->
   <div id="hs_us_newlesson" style="width: 80%; margin: auto;">
      <b class="" style="font-size: 25px;"> 레슨신규 </b>
      <div class="hs_us_newlesson_container">
         <div class="hs_us_newlesson_g-scrolling-carousel">
            <div class="hs_us_newlesson_items">
               
                  <c:forEach var="newlessonlist" items="${newlessonlist}">
                     
                     <a href="${pageContext.request.contextPath }/todaylesson/lesson_detail/${newlessonlist.lesson_no}">
                        <img class="hs_storecontent_cg_img" src="${newlessonlist.lesson_thumb}" alt="">
                     <c:set var="category" value="${newlessonlist.lesson_category }"/>
                     <c:choose>
                        <c:when test = "${category==1}">
                           <p>
                              <c:out value="운동"/>
                              <span> ㆍ </span>
                              <c:out value="${newlessonlist.senior_nick}"/>
                           </p>   
                        </c:when>
                        <c:when test = "${category==2}">
                           <p>  
                              <c:out value="교육"/>
                              <span> ㆍ </span>
                              <c:out value="${newlessonlist.senior_nick}"/>
                           </p>
                        </c:when>
                        <c:when test = "${category==3}">
                           <p>
                              <c:out value="핸드메이드"/>
                              <span> ㆍ </span>
                              <c:out value="${newlessonlist.senior_nick}"/>
                           </p>   
                        </c:when>
                        <c:when test = "${category==4}">
                           <p>
                              <c:out value="IT"/>
                              <span> ㆍ </span>
                              <c:out value="${newlessonlist.senior_nick}"/>
                           </p>
                        </c:when>
                        <c:when test = "${category==5}">
                           <p>
                              <c:out value="요리"/>
                              <span> ㆍ </span>
                              <c:out value="${newlessonlist.senior_nick}"/>
                           </p>
                        </c:when>
                        <c:when test = "${category==6}">
                           <p> 
                              <c:out value="기타"/>
                              <span> ㆍ </span>
                              <c:out value="${newlessonlist.senior_nick}"/>
                           </p>   
                        </c:when>
                     </c:choose>
                     <p>
                        <c:out value="${newlessonlist.lesson_title}"/>
                     </p>
                     <hr style="margin: 0px 0px 5px;">
                     <p class="hs_us_newlesson_ATcost">
                        <fmt:formatNumber value="${cal_lessonrevenuecost}" type="number" maxFractionDigits="3"/>원
                        <span class="hs_us_newlesson_BFcost">
                           <fmt:formatNumber value="${cal_lessonrevenuecost}" type="number" maxFractionDigits="3"/>원
                        </span>
                     </p>
                     <p>
                        <i class="fas fa-heart" style="color: rgb(224, 62, 82);"></i>
                           111
                     </p>
                     </a>
                  </c:forEach>
   
            </div>
         </div>
      </div>
   </div>
   <!-- 레슨 신규ㅜ -->
   <!-- 레슨 추천 -->
   <div id="hs_us_recommendationLesson" style="width: 80%; margin: auto;">
      <b class="" style="font-size: 25px;"> 레슨추천 </b>
      <div class="hs_us_recommendationLesson_container">
         <div class="hs_us_recommendationLesson_g-scrolling-carousel">
            <div class="hs_us_recommendationLesson_items">
               
                  <c:forEach var="newlessonlist" items="${newlessonlist}">
                     
                     <a href="${pageContext.request.contextPath }/todaylesson/lesson_detail/${newlessonlist.lesson_no}">
                        <img class="hs_us_recommendationLesson_img" src="${newlessonlist.lesson_thumb}" alt="">
                     <c:set var="category" value="${newlessonlist.lesson_category }"/>
                     <c:choose>
                        <c:when test = "${category==1}">
                           <p>
                              <c:out value="운동"/>
                              <span> ㆍ </span>
                              <c:out value="${newlessonlist.senior_nick}"/>
                           </p>   
                        </c:when>
                        <c:when test = "${category==2}">
                           <p>  
                              <c:out value="교육"/>
                              <span> ㆍ </span>
                              <c:out value="${newlessonlist.senior_nick}"/>
                           </p>
                        </c:when>
                        <c:when test = "${category==3}">
                           <p>
                              <c:out value="핸드메이드"/>
                              <span> ㆍ </span>
                              <c:out value="${newlessonlist.senior_nick}"/>
                           </p>   
                        </c:when>
                        <c:when test = "${category==4}">
                           <p>
                              <c:out value="IT"/>
                              <span> ㆍ </span>
                              <c:out value="${newlessonlist.senior_nick}"/>
                           </p>
                        </c:when>
                        <c:when test = "${category==5}">
                           <p>
                              <c:out value="요리"/>
                              <span> ㆍ </span>
                              <c:out value="${newlessonlist.senior_nick}"/>
                           </p>
                        </c:when>
                        <c:when test = "${category==6}">
                           <p> 
                              <c:out value="기타"/>
                              <span> ㆍ </span>
                              <c:out value="${newlessonlist.senior_nick}"/>
                           </p>   
                        </c:when>
                     </c:choose>
                     <p>
                        <c:out value="${newlessonlist.lesson_title}"/>
                     </p>
                     <hr style="margin: 0px 0px 5px;">
                     <p class="hs_us_recommendationLesson_ATcost">
                        <fmt:formatNumber value="${cal_lessonrevenuecost}" type="number" maxFractionDigits="3"/>원
                        <span class="hs_us_recommendationLesson_BFcost">
                           <fmt:formatNumber value="${cal_lessonrevenuecost}" type="number" maxFractionDigits="3"/>원
                        </span>
                     </p>
                     <p>
                        <i class="fas fa-heart" style="color: rgb(224, 62, 82);"></i>
                           111
                     </p>
                     </a>
                  </c:forEach>
   
            </div>
         </div>
      </div>
   </div>
   <!-- 레슨 추천 -->
   <!-- 이벤트 슬라이더 -->
   <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="margin-top: 100px;">
      <div class="carousel-inner">
         <c:forEach var="mainEventBannerSlider" items="${mainEventBannerSlider}">
            <c:choose>
               <c:when test="${mainEventBannerSlider.banner_no == 1 }">
                  <div class="carousel-item active">
                     <img src="${mainEventBannerSlider.banner_filepath}" class="w-100"  alt="...">
                  </div>
               </c:when>
               <c:otherwise>
                  <div class="carousel-item">
                     <img src="${mainEventBannerSlider.banner_filepath}" class="w-100" alt="...">
                  </div>
               </c:otherwise>
            </c:choose>
         </c:forEach>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
         <span class="carousel-control-prev-icon" aria-hidden="true"></span>
         <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
         <span class="carousel-control-next-icon" aria-hidden="true"></span>
         <span class="sr-only">Next</span>
      </a>
   </div>
   <!-- 이벤트 슬라이더 -->
   
   <!-- 스토어 베스트  -->
   <div class="row" style="width: 80%; margin: auto; margin-top: 100px;">
      <b class="" style="font-size: 25px;"> 스토어베스트 </b>
      <div class="" style="margin-top: 30px;">
         <c:forEach var="storenewproductlist" items="${storenewproductlist}">
            <div class="col-md-3 col-sm-6">
               <div class="hs_user_store_product">
                  <div class="hs_user_store_product_img">
                                    <div class="hs_user_store_product_img2" style="height:285px;display:block;">
                     <a href="${pageContext.request.contextPath }/todaylesson/ej_store_detail/${storenewproductlist.product_no}">
                        <img src="${storenewproductlist.product_thumb}"/>
                     </a></div>
                     <ul class="hs_user_store_product_social" >
                        <li>
                           <a href="#" ><div class="fas fa-heart" id="${storenewproductlist.product_no}"></div></a>
                        </li>
                        <li>
                              <a href="#" ><div class="fa fa-shopping-cart" id="${storenewproductlist.product_no}"></div></a>
                        </li>
                     </ul>
                     <span class="hs_user_store_product_label">
                        <c:out value="${storenewproductlist.product_sale}%"/>
                     </span> 
                  </div>
                  <div class="hs_user_store_product_content">
                     <c:set var="category" value="${storenewproductlist.product_category }"/>
                     <c:choose>
                        <c:when test = "${category==1}">
                           <b class="hs_user_store_product_category">
                              <c:out value="외국어"/>
                           </b>   
                        </c:when>
                        <c:when test = "${category==2}">
                           <b class="hs_user_store_product_category">  
                              <c:out value="IT"/>
                           </b>
                        </c:when>
                        <c:when test = "${category==3}">
                           <b class="hs_user_store_product_category">
                              <c:out value="요리"/>
                           </b>   
                        </c:when>
                        <c:when test = "${category==4}">
                           <b class="hs_user_store_product_category">
                              <c:out value="DIY"/>
                           </b>
                        </c:when>
                        <c:when test = "${category==5}">
                           <b class="hs_user_store_product_category">
                              <c:out value="운동"/>
                           </b>
                        </c:when>
                        <c:when test = "${category==6}">
                           <b class="hs_user_store_product_category"> 
                              <c:out value="기타"/>
                           </b>   
                        </c:when>
                     </c:choose>
                     <h6 class="hs_user_store_prodct_title">
                        <a href="${pageContext.request.contextPath }/todaylesson/ej_store_detail/${storenewproductlist.product_no}">${storenewproductlist.product_name}</a>
                     </h6>
                     <div class="hs_user_store_product_line"></div>
                     <div class="hs_user_store_prodct_cost">
                        <fmt:formatNumber value="${storenewproductlist.product_after_cost}" type="number" maxFractionDigits="3"/>원
                        <span class="hs_user_store_prodct_BFcost">
                           <fmt:formatNumber value="${storenewproductlist.product_cost}" type="number" maxFractionDigits="3"/>원
                        </span>
                     </div>
                     <div class="hs_user_store_prodct_likenum_box">                
                        <span class="hs_user_store_prodct_likenum">
                           <i class="fas fa-heart"></i>
                           <fmt:formatNumber value="${storenewproductlist.product_like}" type="number" maxFractionDigits="3"/>
                        </span>
                     </div>     
                  </div>
               </div>
            </div>
         </c:forEach>
      </div>
   </div>   	 
   <!-- 스토어 베스트  -->
   <!-- 스토어 신규 상품 -->
   <div class="row" style="width: 80%; margin: auto; margin-top: 50px;">
      <b class="" style=" font-size: 25px;"> 스토어신규 </b>
      <div class="" style="margin-top: 30px;">
         <c:forEach var="storenewproductlist" items="${storenewproductlist}">
            <div class="col-md-3 col-sm-6">
               <div class="hs_user_store_product">
                  <div class="hs_user_store_product_img">
                  <div class="hs_user_store_product_img2" style="height:285px;">
                     <a href="${pageContext.request.contextPath }/todaylesson/ej_store_detail/${storenewproductlist.product_no}">
                        <img src="${storenewproductlist.product_thumb}"/>
                     </a>
                     </div>
                     <ul class="hs_user_store_product_social" >
                        <li>
                           <a href="#" ><div class="fas fa-heart" id="${storenewproductlist.product_no}"></div></a>
                        </li>
                        <li>
                        <a href="#" ><div class="fa fa-shopping-cart" id="${storenewproductlist.product_no}"></div></a>
                        </li>
                     </ul>
                     <span class="hs_user_store_product_label">
                        <c:out value="${storenewproductlist.product_sale}%"/>
                     </span> 
                  </div>
                  <div class="hs_user_store_product_content">
                     <c:set var="category" value="${storenewproductlist.product_category }"/>
                     <c:choose>
                        <c:when test = "${category==1}">
                           <b class="hs_user_store_product_category">
                              <c:out value="외국어"/>
                           </b>   
                        </c:when>
                        <c:when test = "${category==2}">
                           <b class="hs_user_store_product_category">  
                              <c:out value="IT"/>
                           </b>
                        </c:when>
                        <c:when test = "${category==3}">
                           <b class="hs_user_store_product_category">
                              <c:out value="요리"/>
                           </b>   
                        </c:when>
                        <c:when test = "${category==4}">
                           <b class="hs_user_store_product_category">
                              <c:out value="DIY"/>
                           </b>
                        </c:when>
                        <c:when test = "${category==5}">
                           <b class="hs_user_store_product_category">
                              <c:out value="운동"/>
                           </b>
                        </c:when>
                        <c:when test = "${category==6}">
                           <b class="hs_user_store_product_category"> 
                              <c:out value="기타"/>
                           </b>   
                        </c:when>
                     </c:choose>
                     <h6 class="hs_user_store_prodct_title">
                        <a href="${pageContext.request.contextPath }/todaylesson/ej_store_detail/${storenewproductlist.product_no}">${storenewproductlist.product_name}</a>
                     </h6>
                     <div class="hs_user_store_prodct_cost">
                        <fmt:formatNumber value="${storenewproductlist.product_after_cost}" type="number" maxFractionDigits="3"/>원
                        <span class="hs_user_store_prodct_BFcost">
                           <fmt:formatNumber value="${storenewproductlist.product_cost}" type="number" maxFractionDigits="3"/>원
                        </span>
                     </div>
                     <div class="hs_user_store_prodct_likenum_box">                
                        <span class="hs_user_store_prodct_likenum">
                           <i class="fas fa-heart"></i>
                           <fmt:formatNumber value="${storenewproductlist.product_like}" type="number" maxFractionDigits="3"/>
                        </span>
                     </div>     
                  </div>
               </div>
            </div>
         </c:forEach>
      </div>
   </div>  
   <!-- 스토어 신규 상품 -->
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
   
   <!--Main HOME JS-->
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/JS/hs_us_home_content_newlessonslider.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/JS/hs_us_home_content_bestlessonslider.js?ver=1"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/JS/hs_us_home_content_recommendationlessonslider.js"></script>
   <!--Main HOME JS-->  
   <!-- 베스트레슨슬라이더 -->
   <script>
        $(document).ready(function() {
            $(".hs_us_bestLesson_g-scrolling-carousel .hs_us_bestLesson_items").BLgScrollingCarousel();
        });
   </script>
   <script type="text/javascript">
        var BL_gaq = BL_gaq || [];
        BL_gaq.push(['_setAccount', 'UA-36251023-1']);
        BL_gaq.push(['_setDomainName', 'jqueryscript.net']);
        BL_gaq.push(['_trackPageview']);

        (function() {
            var BLga = document.createElement('script');
            BLga.type = 'text/javascript';
            BLga.async = true;
            BLga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var BLs = document.getElementsByTagName('script')[0];
            BLs.parentNode.insertBefore(BLga, BLs);
        })();
   </script>
   <!-- 베스트레슨슬라이더 -->
   <!-- 신규레슨슬라이더 -->
   <script>
        $(document).ready(function() {
            $(".hs_us_newlesson_g-scrolling-carousel .hs_us_newlesson_items").gScrollingCarousel();
        });
   </script>
   <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-36251023-1']);
        _gaq.push(['_setDomainName', 'jqueryscript.net']);
        _gaq.push(['_trackPageview']);

        (function() {
            var ga = document.createElement('script');
            ga.type = 'text/javascript';
            ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(ga, s);
        })();
   </script>
   <!-- 신규레슨슬라이더 -->
   <!-- 추천레슨슬라이더 -->
   <script>
        $(document).ready(function() {
            $(".hs_us_recommendationLesson_g-scrolling-carousel .hs_us_recommendationLesson_items").REgScrollingCarousel();
        });
   </script>
   <script type="text/javascript">
        var RE_gaq = RE_gaq || [];
        RE_gaq.push(['_setAccount', 'UA-36251023-1']);
        RE_gaq.push(['_setDomainName', 'jqueryscript.net']);
        RE_gaq.push(['_trackPageview']);

        (function() {
            var REga = document.createElement('script');
            REga.type = 'text/javascript';
            REga.async = true;
            REga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var REs = document.getElementsByTagName('script')[0];
            REs.parentNode.insertBefore(REga, REs);  //버튼이 널일때 조건삽인인듯??
        })();
   </script>
   <!-- 추천레슨슬라이더 -->
   <!--상품 좋아요와 장바구니  -->
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