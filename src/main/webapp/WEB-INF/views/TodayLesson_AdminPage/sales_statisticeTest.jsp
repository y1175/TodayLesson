<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#chartdiv {
  width: 70%;
  height: 400px;
}
#chartOutPut{
width		: 100%;
	height		: 465px;
	font-size	: 16px;
	font-weight : bold;
}

</style>
 <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
  <script src="https://www.amcharts.com/lib/3/serial.js"></script>
  <script src="https://www.amcharts.com/lib/3/pie.js"></script>
  <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
  <script src="https://www.amcharts.com/lib/3/themes/light.js"></script>  
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script>

 $(document).ready(function(){
	  $.ajax({

			type : "POST",
		    url: "/todaylessonadmin/sales_statistics",
		    success: function(data) {
				console.log(data)
				var chart = AmCharts.makeChart("chartOutPut", {
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
				          "type": "smoothedLine",
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
		})

	})
 

</script>

</head>
<body>
<!-- 차트 -->
   <div id="chartdiv"></div>
   <div id="chartOutPut"></div>
<!-- 차트 -->
   <form action="/todaylessonadmin/sales_statistics">
      <div class="form-group row">
         <label for="start_date end_date" class="col-sm-1 col-form-label">기간선택</label>
         <div class="col-sm-2">
            <input type="date" id="start_date" class="form-control" name="start_date">
         </div>
         <div class="col">
          -
         </div>
         <div class="col-sm-2">
            <input type="date" id="end_date" name="end_date" class="form-control">
         </div>
      </div>

      <div class="form-group">
         <input type="radio" name="ymd" value="date"><label>일별</label>
         <input type="radio" name="ymd" value="month"><label>월별</label>
         <input type="radio" name="ymd" value="year"><label>연별</label>
      </div>

      <input type="submit" class="statistics-btn" value="조회">
   </form>
   <table class="table table-hover">
      <thead class="thead-admin-statistics">
         <tr>
            <th>NO.</th><th>매출일(년/월/일)</th><th>매출액</th><th>누적매출액</th>
         </tr>
      </thead>
   <tbody class="statistics_tbody">
      <c:forEach var="item" items="${list }" varStatus="status">
         <tr> 
            <td>
               <c:out value="${status.count}"/>
            </td>
            <td>${item.stat_logdate }</td>
            <td>${item.total }</td>
            <td>${distinctMember[status.index].member_total }</td>

        </tr>
      </c:forEach>
   </tbody>
</table>


</body>
</html>