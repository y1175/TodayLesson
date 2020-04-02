<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>얼리버드</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hm_us_bird.css?ver=1"> 
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/JS/hm_us_bird.js"></script> 
</head>
<body>

<img src="/resources/IMG/earlybird.png" alt="얼리버드 메인 이미지" class="birdmainimg">





<div class="earlybirdtotal"><!-- 전체를 감싸는 div(위 img 제외) -->

<img src="/resources/IMG/earlybirdmini.png" alt="얼리버드 미니 배너" class="birdminiimg">


<!-- 실시간 베스트 얼리버드 -->
<div class="row" style="width: 100%; margin: auto; margin-top: 100px;">
      <b class="" style="font-size: 25px;"> 실시간 베스트 얼리버드 </b>
      <div class="" style="margin-top: 30px;">
         <c:forEach begin="0" end="3" step="1"  var="bestlist" items="${list}">
            <div class="col-md-3 col-sm-6">
               <div class="hs_user_store_product">
                  <div class="hs_user_store_product_img">
                     <a href="#">
                        <img src="${bestlist.lesson_thumb}"/>
                     </a>
                    <ul class="hs_user_store_product_social" >
                        <li>
                           <a href="" class="fas fa-heart"></a>
                        </li>
                        <li>
                           <a href="" class="fa fa-shopping-cart"></a>
                        </li>
                     </ul> 
                     <span class="hs_user_store_product_label">
                        <c:out value="27%"/>
                     </span> 
                  </div>
                  <div class="hs_user_store_product_content">
                     <c:set var="category" value="${bestlist.lesson_category }"/>
								<c:choose>
									<c:when test="${bestlist.lesson_category == 1}">
										<c:out value="운동" />
									</c:when>

									<c:when test="${bestlist.lesson_category == 2}">
										<c:out value="교육" />
									</c:when>

									<c:when test="${bestlist.lesson_category == 3}">
										<c:out value="핸드메이드" />
									</c:when>

									<c:when test="${bestlist.lesson_category == 4}">
										<c:out value="it" />
									</c:when>

									<c:when test="${bestlist.lesson_category == 5}">
										<c:out value="요리" />
									</c:when>

									<c:otherwise>
										<c:out value="기타" />
									</c:otherwise>
								</c:choose>
								<h6 class="hs_user_store_prodct_title">
                        <a href="#">${bestlist.lesson_title}</a>
                     </h6>
                     <div class="hs_user_store_product_line"></div>
                     <div class="hs_user_store_prodct_cost">'${bestlist.senior_nick}' 시니어
                       <%--  <span class="hs_user_store_prodct_BFcost">
                           <c:out value="${storenewproductlist.product_cost}원"/>
                        </span> --%>
                     </div>
                     <div class="hs_user_store_prodct_likenum_box">                
                        <span class="hs_user_store_prodct_likenum">
                           <i class="fas fa-heart"></i>
                           <p>${bestlist.lesson_like}</p>
                        </span>
                     </div>     
                  </div>
               </div>
            </div>
         </c:forEach>
      </div>
   </div>   	 
   <!-- 실시간 베스트 얼리버드  -->







<%-- 
<div class="birdbestmain">
<c:forEach begin="0"  end="3" step="1" var="bestlesson" items="${list}">
<div class="row" style="display: inline-block; margin: 0px;"
					onclick="location.href='${pageContext.request.contextPath}/todaylesson/hm_us_event_detail/'+${item.event_no}">
<div class="hm_bird_thumbnail">
<img alt="test" src="${bestlesson.lesson_thumb}">


<p>
<c:choose>

<c:when test="${bestlesson.lesson_type == 1}">
<c:out value="원데이 클래스"/>
</c:when>

<c:when test="${bestlesson.lesson_type == 2}">
<c:out value="다회성 클래스"/>
</c:when>

<c:otherwise>
<td><c:out value="온라인 클래스"/></td>
</c:otherwise>

</c:choose>
</p>



<p>
<c:choose>
<c:when test="${bestlesson.lesson_category == 1}">
<c:out value="운동"/>
</c:when>

<c:when test="${bestlesson.lesson_category == 2}">
<c:out value="교육"/>
</c:when>

<c:when test="${bestlesson.lesson_category == 3}">
<c:out value="핸드메이드"/>
</c:when>

<c:when test="${bestlesson.lesson_category == 4}">
<c:out value="it"/>
</c:when>

<c:when test="${bestlesson.lesson_category == 5}">
<c:out value="요리"/>
</c:when>

<c:otherwise>
<c:out value="기타"/>
</c:otherwise>
</c:choose>
</p>




<h5>${bestlesson.lesson_title}</h5>


<h6>${bestlesson.senior_nick} 시니어</h6>
</div>
</div>
</c:forEach>
</div> --%>




</div><!-- 전체 width:80% / margin 0 auto div-->
</body>
</html>