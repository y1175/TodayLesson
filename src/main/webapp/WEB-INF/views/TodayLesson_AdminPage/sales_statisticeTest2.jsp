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
<!-- Resources -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- Chart code -->
<script>
$(document).ready(function(){
	  $.ajax({

			type : "POST",
		    url: "/todaylessonadmin/sales_statistics",
		    success: function(data) {
		        
		    	"xAxes": [{
		    	    // ...
		    	    "events": {
		    	      "datavalidated":  function(ev) {
		    	        var axis = ev.target;
		    	        var start = axis.positionToDate(0);
		    	        var end = axis.positionToDate(1);
		    	 
		    	        // Get weekends
		    	        var current = new Date(start);
		    	        while (current < end) {
		    	          // Get weekend start and end dates
		    	          var weekendStart = getWeekend(current);
		    	          var weekendEnd = new Date(weekendStart);
		    	          weekendEnd.setDate(weekendEnd.getDate() + 2);

		    	          // Create a range
		    	          var range = axis.axisRanges.create();
		    	          range.date = weekendStart;
		    	          range.endDate = weekendEnd;
		    	          range.axisFill.fill = am4core.color("#396478");
		    	          range.axisFill.fillOpacity = 0.2;
		    	          range.grid.strokeOpacity = 0;

		    	          // Iterate
		    	          current.setDate(current.getDate() + 7);
		    	        }
		    	 
		    	        function getWeekend(date) {
		    	          var lastday = date.getDate() - (date.getDay() || 7) + 6;
		    	          var lastdate = new Date(date);
		    	          lastdate.setDate(lastday);
		    	          return lastdate;
		    	        }
		    	      })
		    	    },"dataProvider": data
		    	  }]
		    
		
	  
	  });

			
})



</script>
</head>
<body>
<div id="chartdiv"></div>
<div id="chartOutPut"></div>
</body>
</html>

