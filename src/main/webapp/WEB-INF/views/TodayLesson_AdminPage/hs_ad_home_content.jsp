<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>        
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- AMCHARTS Resources -->
   <script src="https://www.amcharts.com/lib/4/core.js"></script>
   <script src="https://www.amcharts.com/lib/4/charts.js"></script>
   <script src="https://www.amcharts.com/lib/4/themes/dataviz.js"></script>
   <script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
<!-- AMCHARTS Resources -->
<!-- 레슨카테고리 현황 차트 -->
   <script type="text/javascript">
   am4core.ready(function() {

	// Themes begin
	am4core.useTheme(am4themes_dataviz);
	am4core.useTheme(am4themes_animated);
	// Themes end

	// Create chart instance
	var lessonchart = am4core.create("hs_lessoncg_chartdiv", am4charts.PieChart);

	// Add data
	lessonchart.data = [
		  {
		    category: "핸드메이드",
		    value: '${lessonHandmadeCount}'
		  },
		  {
			category: "교육",
		    value: '${lessonEducationCount}'
		  },
		  {
			category: "운동",
		    value: '${lessonSportCount}'
		  },
		  {
			category: "IT",
		    value: '${lessonITCount}'
		  },
		  {
			category: "요리",
		    value: '${lessonCookCount}'
		  },
		  {
			category: "기타",
		    value: '${lessonOtherCount}'
		  }
		];
	// Set inner radius
	lessonchart.innerRadius = am4core.percent(50);

	// Add and configure Series
	var lessonpieSeries = lessonchart.series.push(new am4charts.PieSeries());
	lessonpieSeries.dataFields.value = "value";
	lessonpieSeries.dataFields.category = "category";
	lessonpieSeries.slices.template.stroke = am4core.color("#fff");
	lessonpieSeries.slices.template.strokeWidth = 2;
	lessonpieSeries.slices.template.strokeOpacity = 1;

	// This creates initial animation
	lessonpieSeries.hiddenState.properties.opacity = 1;
	lessonpieSeries.hiddenState.properties.endAngle = -90;
	lessonpieSeries.hiddenState.properties.startAngle = -90;

	}); // end am4core.ready()
   </script>
<!-- 레슨카테고리 현황 차트 -->
<!-- 상품카테고리 현황 차트 -->
   <script type="text/javascript">
   am4core.ready(function() {

	// Themes begin
	am4core.useTheme(am4themes_dataviz);
	am4core.useTheme(am4themes_animated);
	// Themes end

	// Create chart instance
	var productchart = am4core.create("hs_productcg_chartdiv", am4charts.PieChart);

	// Add data
	productchart.data = [
		  {
		    category: "운동",
		    value: '${productHandmadeCount}'
		  },
		  {
			category: "외국어",
		    value: '${productEducationCount}'
		  },
		  {
			category: "DIY",
		    value: '${productHandmadeCount}'
		  },
		  {
			category: "IT",
		    value: '${productITCount}'
		  },
		  {
			category: "요리",
		    value: '${productCookCount}'
		  },
		  {
			category: "기타",
		    value: '${productOtherCount}'
		  }
		];
	// Set inner radius
	productchart.innerRadius = am4core.percent(50);

	// Add and configure Series
	var productpieSeries = productchart.series.push(new am4charts.PieSeries());
	productpieSeries.dataFields.value = "value";
	productpieSeries.dataFields.category = "category";
	productpieSeries.slices.template.stroke = am4core.color("#fff");
	productpieSeries.slices.template.strokeWidth = 2;
	productpieSeries.slices.template.strokeOpacity = 1;

	// This creates initial animation
	productpieSeries.hiddenState.properties.opacity = 1;
	productpieSeries.hiddenState.properties.endAngle = -90;
	productpieSeries.hiddenState.properties.startAngle = -90;

	}); // end am4core.ready()
   </script>
<!-- 상품카테고리 현황 차트 -->
<!-- 연령대별 성별 가입현황 -->
   <script>
   am4core.ready(function() {

   // Themes begin
   am4core.useTheme(am4themes_dataviz);
   am4core.useTheme(am4themes_animated);
   // Themes end

   // Create chart instance
   var chart = am4core.create("hs_age_gen_joinchartdiv", am4charts.XYChart);

   // Add data
   chart.data = [{
     "age": "70+",
     "male": '-${productEducationCount}',
     "female": '${productEducationCount}'
   }, {
     "age": "65-69",
     "male": -0.2,
     "female": 0.3
   }, {
     "age": "50-59",
     "male": -0.3,
     "female": 0.6
   }, {
     "age": "40-49",
     "male": -0.5,
     "female": 0.8
   }, {
     "age": "30-39",
     "male": -0.8,
     "female": 1.0
   }, {
     "age": "20-29",
     "male": -1.1,
     "female": 1.3
  }];

// Use only absolute numbers
chart.numberFormatter.numberFormat = "#.#s";

// Create axes
var categoryAxis = chart.yAxes.push(new am4charts.CategoryAxis());
categoryAxis.dataFields.category = "age";
categoryAxis.renderer.grid.template.location = 0;
categoryAxis.renderer.inversed = true;

var valueAxis = chart.xAxes.push(new am4charts.ValueAxis());
valueAxis.extraMin = 0.1;
valueAxis.extraMax = 0.1;
valueAxis.renderer.minGridDistance = 40;
valueAxis.renderer.ticks.template.length = 5;
valueAxis.renderer.ticks.template.disabled = false;
valueAxis.renderer.ticks.template.strokeOpacity = 0.4;
valueAxis.renderer.labels.template.adapter.add("text", function(text) {
  return text == "Male" || text == "Female" ? text : text + "%";
})

// Create series
var male = chart.series.push(new am4charts.ColumnSeries());
male.dataFields.valueX = "male";
male.dataFields.categoryY = "age";
male.clustered = false;

var maleLabel = male.bullets.push(new am4charts.LabelBullet());
maleLabel.label.text = "{valueX}%";
maleLabel.label.hideOversized = false;
maleLabel.label.truncate = false;
maleLabel.label.horizontalCenter = "right";
maleLabel.label.dx = -10;

var female = chart.series.push(new am4charts.ColumnSeries());
female.dataFields.valueX = "female";
female.dataFields.categoryY = "age";
female.clustered = false;

var femaleLabel = female.bullets.push(new am4charts.LabelBullet());
femaleLabel.label.text = "{valueX}%";
femaleLabel.label.hideOversized = false;
femaleLabel.label.truncate = false;
femaleLabel.label.horizontalCenter = "left";
femaleLabel.label.dx = 10;

var maleRange = valueAxis.axisRanges.create();
maleRange.value = -10;
maleRange.endValue = 0;
maleRange.label.text = "Male";
maleRange.label.fill = chart.colors.list[0];
maleRange.label.dy = 20;
maleRange.label.fontWeight = '600';
maleRange.grid.strokeOpacity = 1;
maleRange.grid.stroke = male.stroke;

var femaleRange = valueAxis.axisRanges.create();
femaleRange.value = 0;
femaleRange.endValue = 10;
femaleRange.label.text = "Female";
femaleRange.label.fill = chart.colors.list[1];
femaleRange.label.dy = 20;
femaleRange.label.fontWeight = '600';
femaleRange.grid.strokeOpacity = 1;
femaleRange.grid.stroke = female.stroke;

}); // end am4core.ready()
</script>
   
<!-- 연령대별 성별 가입현황  1-->
<!-- 연령대별 가입현황 2 -->
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_dataviz);
am4core.useTheme(am4themes_animated);
// Themes end

// Create chart instance
var chart = am4core.create("hs_age_gen_joinchartdiv2", am4charts.XYChart);
chart.scrollbarX = new am4core.Scrollbar();

// Add data
chart.data = [{
  "country": "20대",
  "visits": '${productEducationCount}'
}, {
  "country": "30대",
  "visits": 50
}, {
  "country": "40대",
  "visits": '${lessonHandmadeCount}'
}, {
  "country": "50대",
  "visits": 170
}, {
  "country": "60대",
  "visits": 200
}, {
  "country": "70이상",
  "visits": 500
}];

// Create axes
var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
categoryAxis.dataFields.category = "country";
categoryAxis.renderer.grid.template.location = 0;
categoryAxis.renderer.minGridDistance = 30;
categoryAxis.renderer.labels.template.horizontalCenter = "right";
categoryAxis.renderer.labels.template.verticalCenter = "middle";
categoryAxis.renderer.labels.template.rotation = 0; // 카테고리 방향 각도 
categoryAxis.tooltip.disabled = true;
categoryAxis.renderer.minHeight = 10; //차트 높이설정

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.renderer.minWidth = 30;

// Create series
var series = chart.series.push(new am4charts.ColumnSeries());
series.sequencedInterpolation = true;
series.dataFields.valueY = "visits";
series.dataFields.categoryX = "country";
series.tooltipText = "[{categoryX}: bold]{valueY}[/]";
series.columns.template.strokeWidth = 0;

series.tooltip.pointerOrientation = "vertical";

series.columns.template.column.cornerRadiusTopLeft = 10;
series.columns.template.column.cornerRadiusTopRight = 10;
series.columns.template.column.fillOpacity = 0.8;

// on hover, make corner radiuses bigger
var hoverState = series.columns.template.column.states.create("hover");
hoverState.properties.cornerRadiusTopLeft = 0;
hoverState.properties.cornerRadiusTopRight = 0;
hoverState.properties.fillOpacity = 1;

series.columns.template.adapter.add("fill", function(fill, target) {
  return chart.colors.getIndex(target.dataItem.index);
});

// Cursor
chart.cursor = new am4charts.XYCursor();

}); // end am4core.ready()
</script>
<!--  -->
<!--AdminMain style-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hs_ad_home_content.css?ver=2">
<!--AdminMain style-->

</head>
<body>
<div style="width: 90%; margin: auto; margin-top: 25px;">
   <!-- 상단 네모 박스 4개  -->
   <div class="row" style="width: 100%; margin: auto;">
      <!-- 신규가입자 -->
      <div class="hs_ad_todaybox">
         <div class="col-sm-7" style="display: inline-block; text-align: center;">
            <i class='fas fa-users'></i>
            <pre>Today</pre>
            <pre>신규가입자</pre>
         </div>
         <div class="col-sm-4" style="display: inline-block; text-align: center; position: relative; bottom: 40px;">
            <b>
               <fmt:formatNumber value="${memberJoinCount}" type="number" maxFractionDigits="3"/>
            </b>
         </div>
      </div>
      <!-- 신규레슨 -->
      <div class="hs_ad_todaybox">
         <div class="col-sm-7" style="display: inline-block; text-align: center;">
            <i class='fas fa-users'></i>
            <pre>Today</pre>
            <pre>신규레슨</pre>
         </div>
         <div class="col-sm-4" style="display: inline-block; text-align: center; position: relative; bottom: 40px;">
            <b>   
               <fmt:formatNumber value="${memberJoinCount}" type="number" maxFractionDigits="3"/>
            </b>
         </div>
      </div>
      <!-- 판매금액 -->
      <div class="hs_ad_todaybox">
         <div class="col-sm-7" style="display: inline-block; text-align: center;">
            <i class="material-icons">&#xe84f;</i>
            <pre>Today</pre>
            <pre>판매금액</pre>
         </div>
         <div class="col-sm-4" style="display: inline-block; text-align: center; position: relative; bottom: 40px;">
            <b>
               <fmt:formatNumber value="${orderlistCostSum}" type="number" maxFractionDigits="3"/>
            </b>
         </div> 
      </div>
      <!-- 게시글 -->
      <div class="hs_ad_todaybox">
         <div class="col-sm-7" style="display: inline-block; text-align: center;">
            <i class="material-icons">content_paste</i>
            <pre>Today</pre>
            <pre>게시글</pre>
         </div>
         <div class="col-sm-4" style="display: inline-block; text-align: center; position: relative; bottom: 40px;">
            <b>   
               <fmt:formatNumber value="${freeboardWriteCount}" type="number" maxFractionDigits="3"/>
            </b>
         </div>
      </div>   
   </div>
   <!-- 상단 네모 박스 4개  -->
   <!-- 가운데 -->
   <div style="width: 100%;">
   <!-- 카테고리 현황 -->
      <div class="hs_ad_category_chart">
         <div class="hs_ad_lesson_product_cg_chart">
            <div id="hs_lessoncg_chartdiv"></div>
            <pre>레슨카테고리현황</pre>
         </div>
         <div class="hs_ad_lesson_product_cg_chart">
            <div id="hs_productcg_chartdiv"></div>
            <pre>상품카테고리현황</pre>
         </div>
      </div>
   <!-- 카테고리 현황 -->
   
      <div class="hs_ad_agjoin_chart2">
         <div id="hs_age_gen_joinchartdiv2" style="font-size: 12px;"></div>
      </div>
      
   </div>
  
   
   <!-- 가운데 -->
   
   <!-- 성별 연령대별 가입현황 -->
      <div class="hs_ad_agjoin_chart" style="margin-top: 500px;">
         <div id="hs_age_gen_joinchartdiv" style="font-size: 12px;"></div>
         <pre>연령대별 가입현황(넣을지 말지 고민중 생각보다 안이쁨)</pre>
      </div>
   <!-- 성별 연령대별 가입현황 -->
   
</div>


</body>
</html>