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
      var agememberchart = am4core.create("hs_agejoin_chartdiv", am4charts.XYChart);
      agememberchart.scrollbarX = new am4core.Scrollbar();

      // Add data
      agememberchart.data = [{
	         "age": "10대",
	         "sum": '$memberAge10Sum}'
      },{
             "age": "20대",
             "sum": '${memberAge20Sum}'
      }, {
             "age": "30대",
             "sum": '${memberAge30Sum}'
      }, {
             "age": "40대",
             "sum": '${memberAge40Sum}'
      }, {
             "age": "50대",
             "sum": '${memberAge50Sum}'
      }, {
             "age": "60대",
             "sum": '${memberAge60Sum}'
      }, {
             "age": "70대이상",
             "sum": '${memberAge70PlusSum}'
      }];

      // Create axes
      var categoryAxis = agememberchart.xAxes.push(new am4charts.CategoryAxis());
      categoryAxis.dataFields.category = "age";
      categoryAxis.renderer.grid.template.location = 0;
      categoryAxis.renderer.minGridDistance = 30;
      categoryAxis.renderer.labels.template.horizontalCenter = "right";
      categoryAxis.renderer.labels.template.verticalCenter = "middle";
      categoryAxis.renderer.labels.template.rotation = 0; // 카테고리 방향 각도 
      categoryAxis.tooltip.disabled = true;
      categoryAxis.renderer.minHeight = 10; //차트 높이설정

      var valueAxis = agememberchart.yAxes.push(new am4charts.ValueAxis());
      valueAxis.renderer.minWidth = 30;

      // Create series
      var series = agememberchart.series.push(new am4charts.ColumnSeries());
      series.sequencedInterpolation = true;
      series.dataFields.valueY = "sum";
      series.dataFields.categoryX = "age";
      series.tooltipText = "[{categoryX}: bold]{valueY}[/]";
      series.columns.template.strokeWidth = 0;//차트 선

      series.tooltip.pointerOrientation = "vertical";

      series.columns.template.column.cornerRadiusTopLeft = 5; //보이는 화면 radius
      series.columns.template.column.cornerRadiusTopRight = 5; //보이는 화면 radius
      series.columns.template.column.fillOpacity = 0.8;

      // on hover, make corner radiuses bigger
      var hoverState = series.columns.template.column.states.create("hover");
      hoverState.properties.cornerRadiusTopLeft = 5; //마우스올렸을때 radius
      hoverState.properties.cornerRadiusTopRight = 5; //마우스올렸을때 radius
      hoverState.properties.fillOpacity = 1;

      series.columns.template.adapter.add("fill", function(fill, target) {
         return agememberchart.colors.getIndex(target.dataItem.index);
      });

      // Cursor
      agememberchart.cursor = new am4charts.XYCursor();

      }); // end am4core.ready()
   </script>   
<!-- 연령대별 성별 가입현황  1-->

<!--AdminMain style-->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hs_ad_home_content.css?ver=1">
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
            <pre>레슨 카테고리 현황</pre>
         </div>
         <div class="hs_ad_lesson_product_cg_chart">
            <div id="hs_productcg_chartdiv"></div>
            <pre>상품 카테고리 현황</pre>
         </div>
      </div>
      <!-- 카테고리 현황 -->
      
      
      <!-- 연령대별 회원현황  -->
      <div class="hs_ad_agejoin_chart">
         <div>
         <div id="hs_agejoin_chartdiv" style="font-size: 12px;"></div>
         <pre>연령대별 회원 현황</pre>
         </div>
      </div>
      <!-- 연령대별 회원현황  -->
      
     
   </div>
  
   
   <!-- 가운데 -->
   
   
</div>


</body>
</html>