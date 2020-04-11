<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSSstyle -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hm_us_event.css?ver=2"> 
<!-- CSSstyle -->
<!-- JS -->
   <%-- <script src="${pageContext.request.contextPath}/resources/JS/hm_us_event.js"></script> 파일이 없어서 주석처리함-용인-  --%>
 <!--   <script>
   $(document).ready(function() {
	    $('body').bootstrapMaterialDesign();
	});
   </script> -->
<!-- JS -->
</head>
<body>


<!-- 이벤트 슬라이더 -->
   <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="margin-top:-10px;">
      <div class="carousel-inner">
         <c:forEach var="mainEventBannerSlider" items="${banner}" varStatus="status">
            <c:choose>
               <c:when test="${status.count == 1}">
                  <div class="carousel-item active">
                     <img src="${mainEventBannerSlider.banner_filepath}" class="w-100"  alt="..." style="height:550px;">
                  </div>
               </c:when>
               <c:otherwise>
                  <div class="carousel-item">
                     <img src="${mainEventBannerSlider.banner_filepath}" class="w-100" alt="..." style="height:550px;">
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










<div class = "hm_event_header">
<h2>오늘의 레슨 <b>EVENT</b></h2>
</div>

<div class="hm_event_total">
 <!-- 이벤트 네비바 -->
 
 <nav class="navbar navbar-expand-lg navbar-light bg-light" style="width:420px; margin:0 auto 40; ">
 
  <div class="collapse navbar-collapse" id="navbarSupportedContent" style="text-align: center; background-color: #fff2f2; padding: 10px;">
 <form class="form-inline my-2 my-lg-0" method ="get" action="${pageContext.request.contextPath}/todaylesson/hm_us_event?currPage=${page.startBlock }">
 <select name="search"  class="form-control" id="inlineFormCustomSelect" style="margin-right: 20px;">
     <option value="all">전체</option>
     <option value="event_title">제목</option>
 </select>
 <input class="form-control mr-sm-2" name="searchtxt" type="search" placeholder="Search" aria-label="Search">
 <button class="hmeventbtn" type="submit" style="background-color: rgb(224, 62, 82);">검색</button>
 </form>
  </div>
  
</nav>
 


  <span id="hm_right" >
      <a href="?event=start" ><button class="btn btn-default" style=" width:100px; margin:-10px 0px 10px 30px;">최신순</button></a>
<a href="?event=end"><button class="btn btn-default" style="width:100px; margin:-10px 0px 10px 0px;">마감순</button></a>
</span>



		<div class="hm_event_thumbnailmain">
			<c:forEach var="item" items="${list}">
				<div class="row" style="display: inline-block; margin: 0px 5px;"
					onclick="location.href='${pageContext.request.contextPath}/todaylesson/hm_us_event_detail/'+${item.event_no}">
					<div class="hm_event_thumbnail">
						<img alt="이벤트 이미지" src="${item.event_thumbnail}" style="width: 360px;">
						<p style="margin-top:10px;">${item.event_startperiod}~${item.event_endperiod}</p>
						<h4><b>${item.event_title}</b></h4>
						<h6>${item.event_thumbexplain}</h6>
						<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
						<c:if test="${today <= item.event_endperiod}"><p><b>(진행중)</b></p></c:if>
						<c:if test="${today > item.event_endperiod}"><p style="color:rgb(224, 62, 82);"><b>종료된 이벤트 입니다</b></p></c:if>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>




<div style="width:80%; margin:0px auto; text-align: center;">
<!-- 페이징 처리  -->
<br>
<ul class="pagination pagination-danger">
<c:if test="${page.prev }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath}/todaylesson/hm_us_event?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt }">PREV
</a></li>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath}/todaylesson/hm_us_event?currPage=${index }&search=${search}&searchtxt=${searchtxt}">${index }
</a></li>
</c:if>

<c:if test="${index==page.currPage }">
<li class="active page-item"><a href="javascript:void(0);" class="page-link">${index }</a></li>
</c:if>

</c:forEach>

<c:if test="${page.next }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath}/todaylesson/hm_us_event?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}">NEXT
</a></li>
</c:if>
</ul>

</div>





 
 <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>                                       
