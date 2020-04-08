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
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hm_us_event.css?ver=1"> 
<!-- CSSstyle -->
<!-- JS -->
   <%-- <script src="${pageContext.request.contextPath}/resources/JS/hm_us_event.js"></script> 파일이 없어서 주석처리함-용인-  --%>
   <script>
   $(document).ready(function() {
	    $('body').bootstrapMaterialDesign();
	});
   </script>
<!-- JS -->
</head>
<body>


<!-- bootstrap 오토 캐러셀 -->
<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel" style="margin-top:-10px;">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active" style="width:100%; height:550px;">
      <img src="/resources/IMG/eventmain1.jpg" class="d-block w-100" alt="..." style="height:550px;">
     <div class="carousel-caption d-none d-md-block" >
      <!-- 버튼 만들 시 여기 사이에 만들기 -->
      </div> 
    </div>
    <div class="carousel-item" style="width:100%; height:550px; ">	
      <img src="/resources/IMG/eventmain2.jpg" class="d-block w-100" alt="..." style="height:550px;">
       <div class="carousel-caption d-none d-md-block">
      </div> 
    </div>
    <div class="carousel-item" style="width:100%; height:550px; ">
      <img src="/resources/IMG/eventmain3.jpg" class="d-block w-100" alt="..." style="height:550px";>
       <div class="carousel-caption d-none d-md-block">
      </div> 
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>



<div class = "hm_event_header">
<h2>이벤트 모음</h2>
</div>

<div class="hm_event_total">
 <!-- 이벤트 네비바 -->
 
 <nav class="navbar navbar-expand-lg navbar-light bg-light" style="width:420px; margin:0 auto 40;">
 
  <div class="collapse navbar-collapse" id="navbarSupportedContent" style="text-align: center;">
 <form class="form-inline my-2 my-lg-0" method ="get" action="hm_us_event?currPage=${page.startBlock }">
 <select name="search"  class="form-control" id="inlineFormCustomSelect" style="margin-right: 20px;">
     <option value="all">전체</option>
     <option value="event_title">제목</option>
 </select>
 <input class="form-control mr-sm-2" name="searchtxt" type="search" placeholder="Search" aria-label="Search">
 <button class="hmeventbtn" type="submit">검색</button>
 </form>
  </div>
  
</nav>
 
 
<%--  <nav class="navbar navbar-expand-lg navbar-light bg-light" style=" width: 80%; margin :0 auto 40px;">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#" style="font-size:20px; margin-right:30px; ">전체 이벤트</a><span class="sr-only">(current)</span>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" style="font-size:20px; margin-right:30px; ">레슨 이벤트</a>
      </li>     
      <li class="nav-item">
        <a class="nav-link" href="#" style="font-size:20px; margin-right:30px; ">스토어 이벤트</a>
      </li>    
      <li class="nav-item">
        <a class="nav-link" href="#" style="font-size:20px;margin-right:30px;">기  타</a>
      </li>                                     
      
    </ul>
    <form class="form-inline my-2 my-lg-3" method="get" action="hm_us_event?currPage=${page.startBlock }">
         <select name="search"  class="custom-select mr-sm-4" id="inlineFormCustomSelect" style="width: 80px;">
            <option value="all">전체</option>
             <option value="event_title">제목</option>
         </select>
         <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="searchtxt">
         <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
      </form>
  </div>
</nav>
 --%>


  <span id="hm_right" >
      <a href="?event=start" ><button class="btn btn-default" style=" width:100px; margin:-10px 0px 10px 30px;">최신순</button></a>
<a href="?event=end"><button class="btn btn-default" style="width:100px; margin:-10px 0px 10px 0px;">마감순</button></a>
</span>



		<div class="hm_event_thumbnailmain">
			<c:forEach var="item" items="${list}">
				<div class="row" style="display: inline-block; margin: 0px 5px;"
					onclick="location.href='${pageContext.request.contextPath}/todaylesson/hm_us_event_detail/'+${item.event_no}">
					<div class="hm_event_thumbnail">
						<img alt="이벤트 이미지" src="${item.event_thumbnail}"
							style="width: 360px;">
						<p>${item.event_startperiod}~${item.event_endperiod}</p>
						<h5>${item.event_title}</h5>
						<h6>${item.event_thumbexplain}</h6>
						<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
						<c:if test="${today <= item.event_endperiod}">(진행중)</c:if>
						<c:if test="${today > item.event_endperiod}">종료된 이벤트 입니다</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>





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

 
 <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>                                       
