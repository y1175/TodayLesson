<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
		    category: "운동",
		    value: '${lessonSportCount}'
		  },
		  {
			category: "교육",
		    value: '${lessonEducationCount}'
		  },
		  {
			category: "핸드메이드",
		    value: '${lessonHandmadeCount}'
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
</head>
<body>
<div style="width: 100%">
   <div style="border: 1px solid black; width: 30%;">
      <b>게시글수(지금 한달로 계산해둠)</b>
      <c:out value="${freeboardWriteCount}"/>
   </div>
   <div style="border: 1px solid black; width: 30%;">
      <b>판매금액(지금 한달로 계산해둠)</b>
      <c:out value="${orderlistCostSum}"/>
   </div>
   <div style="border: 1px solid black; width: 30%;">
      <b>가입자수(지금 한달로 계산해둠)</b>
      <c:out value="${memberJoinCount}"/>
   </div>
   <div style="width: 40%; height: 30%; margin: 30px;">
      <div id="hs_lessoncg_chartdiv"></div>
      <b>레슨카테고리현황</b>
   </div>
   <div style="width: 40%; height: 30%; margin: 30px;">
      <div id="hs_productcg_chartdiv"></div>
      <b>상품카테고리현황</b>
   </div>
</div>

</body>
</html>