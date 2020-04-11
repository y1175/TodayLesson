<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TodayLessonAdmin</title>

   <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
   <script src="https://www.amcharts.com/lib/3/serial.js"></script>
   <script src="https://www.amcharts.com/lib/3/pie.js"></script>
   <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
   <script src="https://www.amcharts.com/lib/3/themes/light.js"></script> 
   <script src="https://code.jquery.com/jquery-3.4.1.min.js" ></script>
   <script src="${pageContext.request.contextPath}/resources/JS/yi_member_statistics.js?ver=4" type="text/javascript"></script>
<!-- CSSstyle --> 
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/yi_ad_member_statistics.css?ver=1">
   <style type="text/css">
   .hs_ad_main_asidenav_nav_StatMember_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle -->   
   <style>
     #chartOutput{
       width		: 100%;
	   height		: 465px;
	   font-size	: 16px;
	   font-weight : bold;
    }

    #chartOutput2{
       width		: 100%;
       height		: 465px;
	   font-size	: 16px;
	   font-weight : bold;
    }
   </style>

</head>
<body>



<div id="yi_container">
<section id="digital_clock">

<div class="days">
  <div class="day">
    <p class="monday">monday</p>
  </div>

  <div class="day">
    <p class="tuesday">tuesday</p>
  </div>

  <div class="day">
    <p class="wednesday">wednesday</p>
  </div>

  <div class="day">
    <p class="thursday">thursday</p>
  </div>

  <div class="day">
    <p class="friday">friday</p>
  </div>

  <div class="day">
    <p class="saturday">saturday</p>
  </div>

  <div class="day">
    <p class="sunday">sunday</p>
  </div>
</div>

<div class="clock">
  <!-- HOUR -->
  <div class="numbers">
    <p class="hours"></p>
    <p class="placeholder">88</p>
  </div>

  <div class="colon">
    <p>:</p>
  </div>

  <!-- MINUTE -->
  <div class="numbers">
    <p class="minutes"></p>
    <p class="placeholder">88</p>
  </div>

  <div class="colon">
    <p>:</p>
  </div>

  <!-- SECOND -->
  <div class="numbers">
    <p class="seconds"></p>
    <p class="placeholder">88</p>
  </div>
  
  <!-- AM / PM -->
  <div class="am-pm">

    <!-- AM -->
    <div>
      <p class="am">am</p>
    </div>

    <!-- PM -->
    <div>
      <p class="pm">pm</p>
    </div>
  </div>

</div>

</section>
<h2>접속자 통계</h2>
<div class="detailline"></div>
<form action="${pageContext.request.contextPath}/todaylessonadmin/member_statistics">

<div class="form-group row">
<label for="start_date end_date" class="col-sm-1 col-form-label">기간선택</label>
<div class="col-sm-2">
<input type="date" id="start_date" class="form-control" name="start_date">
</div>
<div class="col">
~
</div>
<div class="col-sm-2">
<input type="date" id="end_date" name="end_date" class="form-control">
</div>
</div>

<div class="form-group">
<input type="radio" name="ymd" value="date" checked="checked"><label>일별</label>
<input type="radio" name="ymd" value="month"><label>월별</label>
<input type="radio" name="ymd" value="year"><label>연별</label>
</div>

<input type="submit" class="statistics-btn" value="조회">
</form>
<table class="table table-hover">
<thead class="thead-admin-statistics">
<tr>
<th>접속일(년/월/일)</th><th>접속건수</th><th>접속자수</th><th>누적접속건수</th><th>누적접속자수</th>
</tr>
</thead>
<tbody class="statistics_tbody">

<c:forEach var="item" items="${list }" varStatus="status">
<tr>
<td>${item.stat_logdate }</td>
<td>${item.total }</td>
<td>${distinctMember[status.index].member_total }</td>
<td>${cumlist[status.index]}</td>
<td>${distinctList[status.index] }</td>

</tr>
</c:forEach>
</tbody>
</table>

<h3>접속자 차트</h3>
<div id = "chartOutput" style = "margin-top : 20px"></div>


<h2>신규회원 통계</h2>
<div class="detailline"></div>
<form action="${pageContext.request.contextPath}/todaylessonadmin/member_statistics">

<div class="form-group row">
<label for="countdate" class="col-sm-1 col-form-label">날짜선택</label>
<div class="col-sm-2">
<input type="date" name="countdate" id="countdate" class="form-control">
</div>
</div>
<input type="submit" class="statistics-btn" value="조회">
</form>



 <c:if test="${countdate.equals('')!=true }">
선택날짜 : ${countdate } 
</c:if>


<table class="table table:hover">
<thead class="thead-admin-statistics">
<tr><th>당일 가입자 수</th><th>이번주 가입자 수</th><th>이번달 가입자 수</th><th>올해 가입자 수</th>
</tr>
</thead>
<tbody class="statistics_tbody">

<tr style="font-size:20px;font-weight:500;">
<td>${today_joinCount}</td>
<td>${week_joinCount}</td>
<td>${month_joinCount}</td>
<td>${year_joinCount}</td>
</tr>

</tbody>
</table>

<h3>가입자 차트</h3>
<div id = "chartOutput2" style = "margin-top : 20px"></div>

</div>
</body>
</html>