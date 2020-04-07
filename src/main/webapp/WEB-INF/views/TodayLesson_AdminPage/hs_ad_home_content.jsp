<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>        
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>TodayLessonAdminPage</title>
<!-- AMCHARTS Resources -->
   <script src="https://www.amcharts.com/lib/4/core.js"></script>
   <script src="https://www.amcharts.com/lib/4/charts.js"></script>
   <script src="https://www.amcharts.com/lib/4/themes/dataviz.js"></script>
   <script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
<!-- AMCHARTS Resources -->
<!-- AMCHARTS Resources -->
   <!-- 매출통계(일별, 주별, 월별, 년별) -->
   <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
   <script src="https://www.amcharts.com/lib/3/serial.js"></script>
   <script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
   <script src="https://www.amcharts.com/lib/3/pie.js"></script>
   <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
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
	         "sum": '${memberAge10Sum}'
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
<!-- 연령대별 성별 가입현황  -->
<!-- 매출통계(일별, 주별, 월별, 년별) -->
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
				       "marginTop":0,
				       "marginRight": 80,
				       "graphs": [{
				           "id":"g1",
				           "balloonText": "[[category]]<br><b><span style='font-size:14px;'>[[value]]</span></b>",
				           "bullet": "round",
				           "bulletSize": 3,  //세로.. 근 사이즈?       
				           "lineColor": "#e03e52",
				           "lineThickness": 2, 
				           "negativeLineColor": "#637bb6",
				           "type": "smoothedLine",
				           "valueField": "output",
				       }],
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
				       "chartScrollbar": {
				           "graph":"g1",
				           "gridAlpha":0,
				           "color":"#888888",
				           "scrollbarHeight":50, //위에 가로 스크롤 높이
				           "backgroundAlpha":0,
				           "selectedBackgroundAlpha":0.1,
				           "selectedBackgroundColor":"#888888",
				           "graphFillAlpha":0,
				           "autoGridCount":true,
				           "selectedGraphFillAlpha":0,
				           "graphLineAlpha":0.2,
				           "graphLineColor":"#c2c2c2",
				           "selectedGraphLineColor":"#888888",
				           "selectedGraphLineAlpha":1
  				       },
				       "chartCursor": {
				           "categoryBalloonDateFormat": "YYYY-MM-DD", //카테고리를 데이터 나타내주는 형식
				           "cursorAlpha": 0,
				           "valueLineEnabled":true,
				           "valueLineBalloonEnabled":true,
				           "valueLineAlpha":0.8,
				           "fullWidth":true
				       },
				       "valueScrollbar":{
					         "oppositeAxis":false,
					         "offset":50, //오른쪽간격..
					         "scrollbarHeight":10 // 세로 스크롤바  간격?
					   },
				       "categoryField": "date",
				       "categoryAxis": {
				           /* "minPeriod": "YYYY", */
				           "parseDates": true,
				           "minorGridAlpha": 0.1,
				           "minorGridEnabled": true
				       },
				       "export": {
				           "enabled": true
				       },
				       "dataProvider": data
				   });

				   chart.addListener("rendered", zoomChart);
				   if(chart.zoomChart){
					   chart.zoomChart();
				   }

				   function zoomChart(){
				       chart.zoomToIndexes(Math.round(chart.dataProvider.length * 0.4), Math.round(chart.dataProvider.length * 0.55));
				   }
		       }
		   })
  	   })
   </script>
<!-- 매출통계(일별, 주별, 월별, 년별) -->

<!-- 매출통계(일별, 주별, 월별, 년별) CSS -->
   <style type="text/css">
       #chartOutPut{
            width : 100%;
	        height	: 500px;
     	    font-size	: 16px;
	        font-weight : bold;
	        position: relative;
	        bottom: 350px;
	        left: 30px;
      }
   </style>
<!-- 매출통계(일별, 주별, 월별, 년별) CSS -->
<!--AdminMain style-->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hs_ad_home_content.css?ver=5">
<!--AdminMain style-->

</head>
<body>
<div style="width: 90%; margin: auto; margin-top: 25px;">
   <!-- 상단 네모 박스 4개  -->
   <div class="row" style="width: 100%; margin: auto;">
      <!-- 신규가입자 -->
      <div class="hs_ad_todaybox">
         <div class="col-sm-7" style="display: inline-block; text-align: center;">
            <i class='fas fa-user-edit'></i>
            <p>Today</p>
            <p>신규주니어</p>
         </div>
         <div class="col-sm-4" style="display: inline-block; text-align: center; position: relative; top: 30px;">
            <b>
               <fmt:formatNumber value="${memberJoinCount}" type="number" maxFractionDigits="3"/>
            </b>
         </div>
      </div>
      <!-- 신규시니어 -->
      <div class="hs_ad_todaybox">
         <div class="col-sm-7" style="display: inline-block; text-align: center;">
            <i class='far fa-id-badge'></i>
            <p>Today</p>
            <p>신규시니어</p>
         </div>
         <div class="col-sm-4" style="display: inline-block; text-align: center; position: relative; top: 30px;">
            <b>   
               <fmt:formatNumber value="${seniorChangeCount}" type="number" maxFractionDigits="3"/>
            </b>
         </div>
      </div>
      <!-- 판매금액 -->
      <div class="hs_ad_todaybox">
         <div class="col-sm-7" style="display: inline-block; text-align: center;">
            <i class='fas fa-file-invoice-dollar'></i>
            <p>Today</p>
            <p>판매금액</p>
         </div>
         <div class="col-sm-4" style="display: inline-block; text-align: center; position: relative; top: 30px;">
            <b>
               <fmt:formatNumber value="${orderlistCostSum}" type="number" maxFractionDigits="3"/>
            </b>
         </div> 
      </div>
      <!-- 게시글 -->
      <div class="hs_ad_todaybox">
         <div class="col-sm-7" style="display: inline-block; text-align: center;">
            <i class="fa fa-file-text-o"></i>
            <p>Today</p>
            <p>게시글</p>
         </div>
         <div class="col-sm-4" style="display: inline-block; text-align: center; position: relative; top: 30px;">
            <b>   
               <fmt:formatNumber value="${freeboardWriteCount}" type="number" maxFractionDigits="3"/>
            </b>
         </div>
      </div>   
   </div>
   <!-- 상단 네모 박스 4개  -->
   <!-- 가운데 -->
   <div style="width: 100%; ">
   
      <!-- 스토어판매상품현황 / 주문현황 / 시니어 정산현황 -->
      <div class="hs_ad_conditionBox">
         <div class="row" style="width: 100%; margin: 40px 15px 25px; border: 1px solid rgba(53, 54, 58, 0.3); padding: 15px;">
            <div class="col md-3" style="height: 300px; padding: 0px; border-right: 1px solid rgba(53, 54, 58, 0.3);">
               <!-- 레슨현황 -->
               <div style="height: 135px;">
                  <div class="col md-12" style="text-align: center;">
                     <h5 class="hs_ad_condition_title"><i class='fas fa-edit' style="color:rgb(224, 62, 82); margin-right: 5px; "></i>레슨현황</h5>
                  </div>
                  <div class="col sm-12" style="margin: 5px;">
                     <div class="hs_ad_condition_name">
                        <b>등록레슨</b>
                     </div>
                     <span>
                        <fmt:formatNumber value="${registrationLessonCount}" type="number" maxFractionDigits="3"/>건
                     </span>
                  </div>
                  <div class="col sm-12" style="margin: 5px;">
                     <div class="hs_ad_condition_name">
                        <b>오픈레슨</b>
                     </div>
                     <span>
                        <fmt:formatNumber value="${openLessonCount}" type="number" maxFractionDigits="3"/>건
                     </span>
                  </div>
                  <div class="col sm-12" style="margin: 5px;">
                     <div class="hs_ad_condition_name">
                        <b>마감레슨</b>
                     </div>
                     <span>
                        <fmt:formatNumber value="${closeLessonCount}" type="number" maxFractionDigits="3"/>건
                     </span>
                  </div>
                  <div class="col sm-12" style="margin: 5px;">
                     <div class="hs_ad_condition_name">
                        <b>품절레슨</b>
                     </div>
                     <span>
                        <fmt:formatNumber value="${soldOutLessonCount}" type="number" maxFractionDigits="3"/>건
                     </span>
                  </div>
               </div>
               <!-- 레슨현황 -->
               <!-- 스토어현황 -->
               <div style="height: 135px;">
                  <div class="col md-12" style="text-align: center;">
                     <h5 class="hs_ad_condition_title"><i class='fas fa-edit' style="color:rgb(224, 62, 82); margin-right: 5px; "></i>스토어현황</h5>
                  </div>
                  <div class="col sm-12" style="margin: 5px;">
                     <div class="hs_ad_condition_name">
                        <b>등록상품</b>
                     </div>
                     <span>
                        <fmt:formatNumber value="${registrationProductCount}" type="number" maxFractionDigits="3"/>건
                     </span>
                  </div>
                  <div class="col sm-12" style="margin: 5px;">
                     <div class="hs_ad_condition_name">
                        <b>판매상품</b>
                     </div>
                     <span>
                        <fmt:formatNumber value="${possibilityProductCount}" type="number" maxFractionDigits="3"/>건
                     </span>
                  </div>
                  <div class="col sm-12" style="margin: 5px;">
                     <div class="hs_ad_condition_name">
                        <b>품절 상품</b>
                     </div>
                     <span>
                        <fmt:formatNumber value="${soldOutProductCount}" type="number" maxFractionDigits="3"/>건
                     </span>
                  </div>
               </div>
               <!-- 스토어현황 -->
            </div>
            <div class="col md-3" style="height: 300px; padding: 0px; border-right: 1px solid rgba(53, 54, 58, 0.3);">
               <!-- 주문현황 -->
               <div style="height: 135px;">
                  <div class="col md-12" style="text-align: center;">
                     <h5 class="hs_ad_condition_title"><i class='fas fa-edit' style="color:rgb(224, 62, 82); margin-right: 5px; "></i>주문현황</h5>
                  </div>
                  <div class="col sm-12" style="margin: 5px;">
                     <div class="hs_ad_condition_name">
                        <b>주문완료</b>
                     </div>
                     <span>
                        <fmt:formatNumber value="${orderCompleteCount}" type="number" maxFractionDigits="3"/>건
                     </span>
                  </div>
                  <div class="col sm-12" style="margin: 5px;">
                     <div class="hs_ad_condition_name">
                        <b>배송중</b>
                     </div>
                     <span>
                        <fmt:formatNumber value="${orderDuringShippingCount}" type="number" maxFractionDigits="3"/>건
                     </span>
                  </div>
                  <div class="col sm-12" style="margin: 5px;">
                     <div class="hs_ad_condition_name">
                        <b>배송완료</b>
                     </div>
                     <span>
                        <fmt:formatNumber value="${orderShippingCompleteCount}" type="number" maxFractionDigits="3"/>건
                     </span>
                  </div>
                  <div class="col sm-12" style="margin: 5px;">
                     <div class="hs_ad_condition_name">   
                        <b>주문취소</b>
                     </div>   
                     <span>
                        <fmt:formatNumber value="${orderCancelCount}" type="number" maxFractionDigits="3"/>건
                     </span>
                  </div>
               </div>
               <!-- 주문현황 -->
               <!-- 결제현황 -->
               <div style="height: 135px;">
                  <div class="col md-12" style="text-align: center;">
                     <h5 class="hs_ad_condition_title"><i class='fas fa-edit' style="color:rgb(224, 62, 82); margin-right: 5px; "></i>결제현황</h5>
                  </div>
                  <div class="col sm-12" style="margin: 5px;">
                     <div class="hs_ad_condition_name">
                        <b>결제완료</b>
                     </div>
                     <span>
                        <fmt:formatNumber value="${paymentCompleteCount}" type="number" maxFractionDigits="3"/>건
                     </span>
                  </div>
                  <div class="col sm-12" style="margin: 5px;">
                     <div class="hs_ad_condition_name">
                        <b>환불진행</b>
                     </div>
                     <span>
                        <fmt:formatNumber value="${refundAcceptCount}" type="number" maxFractionDigits="3"/>건
                     </span>
                  </div>
                  <div class="col sm-12" style="margin: 5px;">
                     <div class="hs_ad_condition_name">
                        <b>환불완료</b>
                     </div>
                     <span>
                        <fmt:formatNumber value="${refundCompleteCount}" type="number" maxFractionDigits="3"/>건
                     </span>
                  </div>
               </div>   
               <!-- 결제현황 -->
            </div>
            <div class="col md-3" style="height: 300px; padding: 0px; border-right: 1px solid rgba(53, 54, 58, 0.3);">
               <!-- 레슨접수현황 -->
               <div style="height: 135px;">
                  <div class="col md-12" style="text-align: center;">
                     <h5 class="hs_ad_condition_title"><i class='fas fa-edit' style="color:rgb(224, 62, 82); margin-right: 5px; "></i>레슨 접수현황</h5>
                  </div>
                  <div class="col sm-12" style="margin: 5px;">
                     <div class="hs_ad_condition_name">
                        <b>레슨신규접수</b>
                     </div>
                     <span>
                        <fmt:formatNumber value="${newLessonAcceptCount}" type="number" maxFractionDigits="3"/>건
                     </span>
                  </div>
                  <div class="col sm-12" style="margin: 5px;">
                     <div class="hs_ad_condition_name">
                        <b>레슨심사중</b>
                     </div>
                     <span>
                        <fmt:formatNumber value="${newLessonEvaluationCount}" type="number" maxFractionDigits="3"/>건
                     </span>
                  </div>
                 <div class="col sm-12" style="margin: 5px;">
                     <div class="hs_ad_condition_name">
                        <b>레슨수락</b>
                     </div>
                     <span>
                        <fmt:formatNumber value="${newLessonAcceptanceCount}" type="number" maxFractionDigits="3"/>건
                     </span>
                  </div>
                  <div class="col sm-12" style="margin: 5px;">
                     <div class="hs_ad_condition_name">
                        <b>레슨거절</b>
                     </div>
                    <span>
                        <fmt:formatNumber value="${newLessonRefuseCount}" type="number" maxFractionDigits="3"/>건
                     </span>
                  </div>
               </div>
               <!-- 레슨접수현황 -->
               <!-- 시니어정산현황 -->
               <div style="height: 135px;">
                  <div class="col sm-12" style="text-align: center;">
                     <h5 class="hs_ad_condition_title"><i class='fas fa-edit' style="color:rgb(224, 62, 82); margin-right: 5px; "></i>시니어 정산현황</h5>
                  </div>
                  <div class="col sm-12" style="margin: 5px;">
                     <div class="hs_ad_condition_name"> 
                        <b>정산대기</b>
                     </div>
                    <span>
                        <fmt:formatNumber value="${seniorCalculateWaitCount}" type="number" maxFractionDigits="3"/>건
                     </span>
                  </div>
                  <div class="col sm-12" style="margin: 5px;">
                     <div class="hs_ad_condition_name"> 
                        <b>정산가능</b>
                     </div>    
                     <span>
                        <fmt:formatNumber value="${seniorCalculatePossibleCount}" type="number" maxFractionDigits="3"/>건
                     </span>
                  </div>
                  <div class="col sm-12" style="margin: 5px;">
                     <div class="hs_ad_condition_name">    
                        <b>정산완료</b>
                     </div>   
                     <span>
                        <fmt:formatNumber value="${seniorCalculateCompleteCount}" type="number" maxFractionDigits="3"/>건
                     </span>
                  </div>   
               </div>
               <!-- 시니어정산현황 -->
            </div>
            <div class="col md-3" style="height: 300px; padding: 0px">
               <div class="col sm-12" style="text-align: center;">
                  <h5 class="hs_ad_condition_title"><i class='fas fa-edit' style="color:rgb(224, 62, 82); margin-right: 5px; "></i>1:1 문의현황</h5>
               </div>
               <div class="col sm-12" style="margin: 5px;">
                  <div class="hs_ad_condition_name"> 
                     <b>레슨문의</b>
                  </div>
                  <span>
                     <fmt:formatNumber value="${questionLessonCount}" type="number" maxFractionDigits="3"/>건
                  </span>
               </div>
               <div class="col sm-12" style="margin: 5px;">
                  <div class="hs_ad_condition_name"> 
                     <b>시니어문의</b>
                  </div>    
                  <span>
                     <fmt:formatNumber value="${questionSeniorCount}" type="number" maxFractionDigits="3"/>건
                  </span>
               </div>
               <div class="col sm-12" style="margin: 5px;">
                  <div class="hs_ad_condition_name">    
                     <b>스토어문의</b>
                  </div>   
                  <span>
                     <fmt:formatNumber value="${questionStoreCount}" type="number" maxFractionDigits="3"/>건
                  </span>
               </div>
               <div class="col sm-12" style="margin: 5px;">
                  <div class="hs_ad_condition_name">    
                     <b>주문문의</b>
                  </div>   
                  <span>
                     <fmt:formatNumber value="${questionOrderCount}" type="number" maxFractionDigits="3"/>건
                  </span>
               </div>
               <div class="col sm-12" style="margin: 5px;">
                  <div class="hs_ad_condition_name">    
                     <b>기타문의</b>
                  </div>   
                  <span>
                     <fmt:formatNumber value="${questionOtherCount}" type="number" maxFractionDigits="3"/>건
                  </span>
               </div>
               <div class="col sm-12" style="margin: 5px;">
                  <div class="hs_ad_condition_name">    
                     <b>답변대기</b>
                  </div>   
                  <span>
                     <fmt:formatNumber value="${questionAnswerWaitCount}" type="number" maxFractionDigits="3"/>건
                  </span>
               </div>
               <div class="col sm-12" style="margin: 5px;">
                  <div class="hs_ad_condition_name">    
                     <b>답변완료</b>
                  </div>   
                  <span>
                     <fmt:formatNumber value="${questionAnswerCompleteCount}" type="number" maxFractionDigits="3"/>건
                  </span>
               </div>
            </div>
         </div>
      </div>
   
      <!-- 카테고리 현황 -->
      <div class="hs_ad_category_chart">
         <div class="hs_ad_lesson_product_cg_chart">
            <div id="hs_lessoncg_chartdiv"></div>
            <div style="text-align: center; font-size: 13px; font-weight: 600;">
               <span>레슨 카테고리 현황</span>
            </div>
         </div>
         <div class="hs_ad_lesson_product_cg_chart">
            <div id="hs_productcg_chartdiv"></div>
            <div style="text-align: center; font-size: 13px; font-weight: 600;">
               <span>상품 카테고리 현황</span>
            </div>
         </div>
      </div>
      <!-- 카테고리 현황 -->
      
      <!-- 연령대별 회원현황  -->
      <div class="hs_ad_agejoin_chart">
         <div id="hs_agejoin_chartdiv" style="font-size: 12px;"></div>
         <div style="text-align: center; font-size: 13px; font-weight: 600;">
            <span>연령대별 회원 현황</span>
         </div>
      </div>
      <!-- 연령대별 회원현황  -->
   </div>
    
   
   <!-- 가운데 -->
    <!-- 매출통계(일별, 주별, 월별, 년별) -->
      <div class="hs_adHome_Slaes_chart">
         <div id="chartOutPut"></div>
         <div style="text-align: center; font-size: 13px; font-weight: 600; position: relative; bottom: 340px;">
               <span>일별 매출현황</span>
         </div>
      </div>
    <!-- 매출통계(일별, 주별, 월별, 년별) -->
</div>

</body>
</html>