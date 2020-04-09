<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
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
	position: relative;
	bottom: 370px;
}

</style>
<!-- CSSstyle -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hs_ad_sales_statistices.css?ver=3">  
   <style type="text/css">
      .hs_ad_main_asidenav_nav_StatSales_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle -->

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
				    "colors" : ["#e03e52","#e03e52"],
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
				        "scrollbarHeight": 50,
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
				        "cursorColor":"#e03e52",
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
   <div class="hs_ad_sales_statistices">
      <h2 class="hs_admin_sales_statistices_title">매출통계 </h2>
      <!-- 차트 -->
      <div id="chartdiv"></div>
      <div id="chartOutPut"></div>
      <!-- 차트 -->
   <div style="position: relative;bottom: 360px; width: 85%; margin: auto;">   
   
   <form action="/todaylessonadmin/sales_statistics">
      <div style="padding: 30px; width: 100%; height:200px; background-color: rgba(53, 54, 58 , 0.3);">
      <div class="form-group row">
         <label for="start_date end_date" style="width: 100px; text-align: center; ">기간선택</label>
         <div class="col-sm-3" style="margin-right: 5px">
            <input type="date" id="start_date" class="form-control" name="start_date">
         </div>
         <div class="col-sm-1" style="text-align: center;">
            <span>-</span>
         </div>
         <div class="col-sm-3" style="margin-right: 5px">
            <input type="date" id="end_date" name="end_date" class="form-control">
         </div>
      </div>

      <div class="form-group" style="margin-top: 20px;">
         <label class="col-sm-2" style=" text-align: left;padding: 0px; ">일별/월별/연별</label>
         <div class="col-sm-1" style="text-align: center;" >
            <input type="radio" name="ymd" value="date"><label>일별</label>
         </div>
         <div class="col-sm-1"style="text-align: center;"  >
            <input type="radio" name="ymd" value="month"><label>월별</label>
         </div>
         <div class="col-sm-1" style="text-align: center;" >
            <input type="radio" name="ymd" value="year"><label>연별</label>
         </div>
      </div>
      <div class="col-md-12" style="text-align: center; margin-top: 20px;">
         <input type="submit" class="sales_statistics-btn" value="조회">
      </div>
      </div>
   </form>
   <table class="table table-hover" style="margin-top: 30px;">
      <thead class="thead-hs-Salesstatistics">
         <tr>
            <th>NO.</th><th>매출일(년/월/일)</th><th  style="border-right: none;">매출액</th>
         </tr>
      </thead>
      <c:set var="sum_cost" value="0"/>
   <tbody class="body-hs-Salesstatistics" style="border-right: none;">
      <c:forEach var="StatSalesAllChart" items="${StatSalesAllChart}" varStatus="status">
         <tr> 
            <td>
               <c:out value="${status.count}"/>
            </td>
            <td>
               <c:out value="${StatSalesAllChart.orderlist_date}"/>
            </td>
            <td  style="border-right: none;">
               <fmt:formatNumber value="${StatSalesAllChart.orderlist_cost}" type="number" maxFractionDigits="3"/>원
            </td>
            <c:set var="total_sumcost" value="${sum_cost+StatSalesAllChart.orderlist_cost}" />
        </tr>
      </c:forEach>
   </tbody>
   <tfoot class="tfoot-hs-Salesstatistics" style="border-bottom: 2px solid rgba(53, 54, 58 , 0.3 ); border-top: 2px solid rgba(53, 54, 58 , 0.3 )">
      <tr >
         <td colspan="2">합계</td>
         <td  style="border-right: none;">
            <fmt:formatNumber value="${total_sumcost}" type="number" maxFractionDigits="3"/>원
         </td>
      </tr>
   </tfoot>
</table>
</div>
</div>
</body>
</html>