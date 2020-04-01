<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

   <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
   <script src="https://www.amcharts.com/lib/3/serial.js"></script>
   <script src="https://www.amcharts.com/lib/3/pie.js"></script>
   <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
   <script src="https://www.amcharts.com/lib/3/themes/light.js"></script>  
<!-- CSSstyle --> 
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
<script>


$(document).ready(function(){
 
	/*접속자 차트 */
	$.ajax({

		type : "POST",
	    url: "/todaylessonadmin/member_statistics",
	    success: function(data) {
			console.log(data)
			var chart = AmCharts.makeChart("chartOutput", {
			    "type": "serial",
			    "theme": "light",
			    "marginRight": 40,
			    "marginLeft": 40,
			    "autoMarginOffset": 20,
			    "mouseWheelZoomEnabled":true,
			    "valueAxes": [{
			        "id": "v1",
			        "axisAlpha": 0,
			        "position": "left",
			        "ignoreAxisWidth":true
			    }],
			    "balloon": {
			        "borderThickness": 1,
			        "shadowAlpha": 0
			    },
			    "graphs": [{
			        "id": "g1",
			        "balloon":{
			          "drop":true,
			          "adjustBorderColor":false,
			          "color":"#ffffff"
			        },
			        "bullet": "round",
			        "bulletBorderAlpha": 1,
			        "bulletColor": "#FFFFFF",
			        "bulletSize": 5,
			        "hideBulletsCount": 50,
			        "lineThickness": 2,
			        "title": "red line",
			        "useLineColorForBulletBorder": true,
			        "valueField": "output",
			        "balloonText": "<span style='font-size:18px;'>[[value]]</span>"
			    }],
			    "chartScrollbar": {
			        "graph": "g1",
			        "oppositeAxis":false,
			        "offset":30,
			        "scrollbarHeight": 80,
			        "backgroundAlpha": 0,
			        "selectedBackgroundAlpha": 0.1,
			        "selectedBackgroundColor": "#888888",
			        "graphFillAlpha": 0,
			        "graphLineAlpha": 0.5,
			        "selectedGraphFillAlpha": 0,
			        "selectedGraphLineAlpha": 1,
			        "autoGridCount":true,
			        "color":"#AAAAAA"
			    },
			    "chartCursor": {
			        "pan": true,
			        "valueLineEnabled": true,
			        "valueLineBalloonEnabled": true,
			        "cursorAlpha":1,
			        "cursorColor":"#258cbb",
			        "limitToGraph":"g1",
			        "valueLineAlpha":0.2,
			        "valueZoomable":true
			    },
			    "valueScrollbar":{
			      "oppositeAxis":false,
			      "offset":50,
			      "scrollbarHeight":10
			    },
			    "categoryField": "date",
			    "categoryAxis": {
			        "parseDates": true,
			        "dashLength": 1,
			        "minorGridEnabled": true
			    },
			    "export": {
			        "enabled": true
			    },
			    "dataProvider": data
			});

			chart.addListener("rendered", zoomChart);

			zoomChart();

			function zoomChart() {
			    chart.zoomToIndexes(chart.dataProvider.length - 40, chart.dataProvider.length - 1);
			}
	    }
	});
	
	/*가입자 차트*/
	  $.ajax({

			type : "POST",
		    url: "/todaylessonadmin/join_statistics",
		    success: function(data) {
				console.log(data)
				var chart = AmCharts.makeChart("chartOutput2", {
				    "type": "serial",
				    "theme": "light",
				    "marginRight": 40,
				    "marginLeft": 40,
				    "autoMarginOffset": 20,
				    "mouseWheelZoomEnabled":true,
				    "valueAxes": [{
				        "id": "v1",
				        "axisAlpha": 0,
				        "position": "left",
				        "ignoreAxisWidth":true
				    }],
				    "balloon": {
				        "borderThickness": 1,
				        "shadowAlpha": 0
				    },
				    "graphs": [{
				        "id": "g1",
				        "balloon":{
				          "drop":true,
				          "adjustBorderColor":false,
				          "color":"#ffffff"
				        },
				        "bullet": "round",
				        "bulletBorderAlpha": 1,
				        "bulletColor": "#FFFFFF",
				        "bulletSize": 5,
				        "hideBulletsCount": 50,
				        "lineThickness": 2,
				        "title": "red line",
				        "useLineColorForBulletBorder": true,
				        "valueField": "output",
				        "balloonText": "<span style='font-size:18px;'>[[value]]</span>"
				    }],
				    "chartScrollbar": {
				        "graph": "g1",
				        "oppositeAxis":false,
				        "offset":30,
				        "scrollbarHeight": 80,
				        "backgroundAlpha": 0,
				        "selectedBackgroundAlpha": 0.1,
				        "selectedBackgroundColor": "#888888",
				        "graphFillAlpha": 0,
				        "graphLineAlpha": 0.5,
				        "selectedGraphFillAlpha": 0,
				        "selectedGraphLineAlpha": 1,
				        "autoGridCount":true,
				        "color":"#AAAAAA"
				    },
				    "chartCursor": {
				        "pan": true,
				        "valueLineEnabled": true,
				        "valueLineBalloonEnabled": true,
				        "cursorAlpha":1,
				        "cursorColor":"#258cbb",
				        "limitToGraph":"g1",
				        "valueLineAlpha":0.2,
				        "valueZoomable":true
				    },
				    "valueScrollbar":{
				      "oppositeAxis":false,
				      "offset":50,
				      "scrollbarHeight":10
				    },
				    "categoryField": "date",
				    "categoryAxis": {
				        "parseDates": true,
				        "dashLength": 1,
				        "minorGridEnabled": true
				    },
				    "export": {
				        "enabled": true
				    },
				    "dataProvider": data
				});

				chart.addListener("rendered", zoomChart);

				zoomChart();

				function zoomChart() {
				    chart.zoomToIndexes(chart.dataProvider.length - 40, chart.dataProvider.length - 1);
				}
		    }
		});

})

</script>


<h2>회원통계</h2>
<p id="date"></p>
<script>
document.getElementById("date").innerHTML = Date();
</script>

<h3>접속자 통계</h3>
<form action="/todaylessonadmin/member_statistics">


<label>기간선택</label><br>
<input type="date" name="start_date">~<input type="date" name="end_date"><br>
<input type="radio" name="ymd" value="date"><label>일별</label>
<input type="radio" name="ymd" value="month"><label>월별</label>
<input type="radio" name="ymd" value="year"><label>연별</label><br>
<input type="submit" value="조회">
</form>
<table>
<thead>
<tr>
<th>접속일(년/월/일)</th><th>접속건수</th><th>접속자수</th><th>누적접속건수</th><th>누적접속자수</th>
</tr>
</thead>
<tbody>

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

<h4>차트1</h4>
<div id = "chartOutput" style = "margin-top : 20px"></div>


<h3>신규회원 통계</h3>
<form action="/todaylessonadmin/member_statistics">


<label>선택</label><br>
<input type="date" name="countdate">
<input type="submit" value="조회">
</form>



 <c:if test="${countdate.equals('')!=true }">
선택날짜 : ${countdate } 
</c:if>


<table>
<thead>
<tr><th>당일 가입자 수</th><th>이번주 가입자 수</th><th>이번달 가입자 수</th><th>올해 가입자 수</th>
</tr>
</thead>
<tbody>

<tr>
<td>${today_joinCount}</td>
<td>${week_joinCount}</td>
<td>${month_joinCount}</td>
<td>${year_joinCount}</td>
</tr>

</tbody>
</table>

<h4>차트2</h4>
<div id = "chartOutput2" style = "margin-top : 20px"></div>

</body>
</html>