<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE>
<html>
<head>

    <title>Product Slider Example</title>
<link rel='stylesheet' href='../../jqwidgets/styles/jqx.base.css' type='text/css'/>
<script type='text/javascript' src='../../scripts/jquery-1.11.1.js'></script>

<!-- Styles -->
<style>
.chartdiv {
  width: 100%;
  height: 500px;
}

</style>

<!-- Resources -->
<!-- 
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>   -->


 <script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/frozen.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script> 

<!-- Chart code -->
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_frozen);
am4core.useTheme(am4themes_animated);
// Themes end

var chart = am4core.create("chartdiv", am4charts.XYChart);

var data = [];
var value = 50;
for(var i = 0; i < 300; i++){
  var date = new Date();
  date.setHours(0,0,0,0);
  date.setDate(i);
  value -= Math.round((Math.random() < 0.5 ? 1 : -1) * Math.random() * 10);
  data.push({date:date, value: value});
}

chart.data = data;

// Create axes
var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
dateAxis.renderer.minGridDistance = 60;

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

// Create series
var series = chart.series.push(new am4charts.LineSeries());
series.dataFields.valueY = "value";
series.dataFields.dateX = "date";
series.tooltipText = "{value}"

series.tooltip.pointerOrientation = "vertical";

chart.cursor = new am4charts.XYCursor();
chart.cursor.snapToSeries = series;
chart.cursor.xAxis = dateAxis;

//chart.scrollbarY = new am4core.Scrollbar();
chart.scrollbarX = new am4core.Scrollbar();

}); // end am4core.ready()
</script>
<script>
/*  $(document).ready(function() {

	   var catecory='';
	   var chartData=[];

	   $(function() {
		   getCateGoryList();
		   getCateGoryDate();
	   });

	   $(document).on('change',getgetCateGoryDate);

		
		
}); */

/* 	$.getJSON("${pageContext.request.contextPath}/slidertest"),
function(data){
	chart.dataProvider=data;
	chart.validataData();
} */

/* $.ajax({
type:'POST',
url:'/slidertest',
async:false, //async : false = 동기 (Synchronous, 요청을 보낸 후 응답결과를 받아야지만 다음 동작이 이루어지는 방식)
contentType : "application/x-www-form-urlencoded; charset=utf-8",
dateType : 'json',
success:function(data){
	
	$.each(data, function(index,item){
		console.log(item);
	});
},error:function(data,status,jqXHR){
		 console.log('실패',data);
		 console.log(status);
		 console.log(jqXHR);
} 

}); */

/* 	$.ajax({
		type:'POST',
		url:'/slidertest',
		async:false, //async : false = 동기 (Synchronous, 요청을 보낸 후 응답결과를 받아야지만 다음 동작이 이루어지는 방식)
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dateType : 'json',
		success:function(data){
			
			$.each(data, function(index,item){
				console.log(item);
			});
		},error:function(data,status,jqXHR){
				 console.log('실패',data);
				 console.log(status);
				 console.log(jqXHR);
		} 
 */
	
	
 
</script>
<script>
/*  원형  */

/*  $(document).ready(function(){
	$.ajax({
		type:'POST',
		url:'/slidertest',
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dateType : 'json', 
		success:function(data){
			cosole.log(data);
	
				var chart = AmCharts.makeChart("chartdiv", {
					  "type": "serial",
					  "theme": "light", */
					 /*  "dataProvider": [{
					    "country": "USA",
					    "visits": 2025
					  }, {
					    "country": "China",
					    "visits": 1882
					  }, {
					    "country": "Japan",
					    "visits": 1809
					  }, {
					    "country": "Germany",
					    "visits": 1322
					  }, {
					    "country": "UK",
					    "visits": 1122
					  }, {
					    "country": "France",
					    "visits": 1114
					  }, {
					    "country": "India",
					    "visits": 984
					  }],
					  "graphs": [{
					    "fillAlphas": 0.9,
					    "lineAlpha": 0.2,
					    "type": "column",
					    "valueField": "cg_count"
					  }],
					  "categoryField": "cate_gory"
					});    
				
				
				/* "type": "Pie",
				   
				    "theme" : "frozen",
				    "innerRadius": "50%",
				    "dataFields": {
				       "value": "cg_count" ,
				       "category": "cate_gory"
				    },
				    "slices": {
				        "stroke": "#fff",
				        "strokeWidth": 2,
				        "strokeOpacity": 1
				    },
				    "hiddenState":{
				    	"opacity":1,
				    	"endAngle":-90,
				    	"startAngle":-90
				    },
				    "dataProvider":[
				    	{ 
				    		$.each(data).function(index,item){
				    			"cate_gory" : item.cate_gory;
				    			"cg_count" : item.cg_count;
				    		}
				    	   
				    	}
				    ]  */
		/* 		    
			})
		
		} *///success
		
/* 	chart = am4core.create("chart", am4charts.PieChart); 
		
		
	}); //ajax
	
	
	
	
});   */
  am4core.ready(function(cate_gory,cg_count) {	
	

	
	// Themes begin
	am4core.useTheme(am4themes_frozen);
	am4core.useTheme(am4themes_animated);
	// Themes end


	// Create chart instance
	var chart = am4core.create("chartdiv2", am4charts.PieChart);
	
	
	
	
/* 	$.each(chart, function(index,item){
		chart.data = [{
			"country": item.cate_gory,
			  "litres": item.cg_count
		}]
		console.log(item);
	})
	   */
	  
	


	// Add data
 	chart.data = [ {
	  "country": "IT",
	  "litres": '${IT}'
	} , {
	  "country": "요리",
	  "litres": 140
	}, {
	  "country": "언어",
	  "litres": 45
	}, {
	  "country": "교육",
	  "litres": 37
	}, {
	  "country": "핸드메이드",
	  "litres": 70
	}, {
	  "country": "기타",
	  "litres": 5
	}, {
      "country": "기타2",
	  "litres": 94
	}, {
		"country": "기타3",
		"litres": 150
	}  
	]; 
 	
	// Set inner radius
 	chart.innerRadius = am4core.percent(50); 

	// Add and configure Series
	var pieSeries = chart.series.push(new am4charts.PieSeries());
	pieSeries.dataFields.value = "litres";
	pieSeries.dataFields.category = "country";
	pieSeries.slices.template.stroke = am4core.color("#fff");
	pieSeries.slices.template.strokeWidth = 2;
	pieSeries.slices.template.strokeOpacity = 1;

	// This creates initial animation
	pieSeries.hiddenState.properties.opacity = 1;
	pieSeries.hiddenState.properties.endAngle = -90;
	pieSeries.hiddenState.properties.startAngle = -90;
}); // end am4core.ready()

 
 
 
</script>


	






</head>
<body>
   <!-- HTML -->
<div id="chartdiv" class="chartdiv"></div>
<div id="chartdiv2" class="chartdiv"></div>
<div id="chart" class="chartdiv"></div>


</body>
</html>