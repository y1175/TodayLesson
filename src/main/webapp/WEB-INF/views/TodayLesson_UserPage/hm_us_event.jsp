

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hm_us_event.css?ver=2"> 
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/JS/hm_us_event.js"></script> 
</head>
<body>


<!-- bootstrap 오토 캐러셀 -->
<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
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



<!-- 여기에 이미지 직접넣어서 버튼으로 만드는거(주력 이벤트) -->

<h2>이벤트 모음</h2>


<div>
<h3>전체 이벤트</h3>
</div>

<div class="event_search_form">
 <form method ="get" action="hm_us_event?currPage=${page.startBlock }" style="text-align: center;  margin-top: 40px;">
 <select name="search">
 <option value="all">전체</option>
 <option value="event_title">제목</option>
 </select>
 <input type="text" name="searchtxt">
 <input type="submit" value="검색">
 </form>
 </div>

</div>
















<c:if test="${page.prev }">
<a href="hm_us_event?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt }"><c:out value="이전"/></a>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
</c:if>
<a href="hm_us_event?currPage=${index }&search=${search}&searchtxt=${searchtxt}">${index }</a>
</c:forEach>

<c:if test="${page.next }">
<a href="hm_us_event?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}"><c:out value="다음"/></a>
</c:if>


 
 <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>                                       
