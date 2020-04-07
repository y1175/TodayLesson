<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#options{
  width: 100%;
  margin: 10;
}

#chartdiv {
	width: 100%;
	height: 400px;
}

#chartdivTwo{
  width: 50%;
  height: 400px;
}

.amcharts-graph-g2 .amcharts-graph-stroke {
  stroke-dasharray: 500%;
  -webkit-animation: css-effect 10s ease-out forwards;
  animation: css-effect 10s ease-out forwards;
}

@-webkit-keyframes css-effect {
  0% {
    stroke-dashoffset: 500%;
  }
  100% {
    stroke-dashoffset: 0%;
  }
}
@keyframes css-effect {
  0% {
    stroke-dashoffset: 500%;
  }
  100% {
    stroke-dashoffset: 0%;
  }
}

.modal, .modal .shade {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 100000;
}

.modal .shade {
  background: #000;
  opacity: 0.7;
  z-index: 1;
}

.modal .chart {
  width: 90%!important;
  height: 90%!important;
  top: 5%;
  left: 5%;
  position: absolute;
  background: #fff!important;
  z-index: 2;
  border-radius: 5px;
}
</style>
<!-- Resources -->
 <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.css"/>
  <link rel="stylesheet" href="https://extra.amcharts.com/support/ameffects.css">
  <script src="//www.amcharts.com/lib/3/amcharts.js"></script>
  <script src="//www.amcharts.com/lib/3/serial.js"></script>
  <script src="https://www.amcharts.com/lib/3/radar.js"></script>
  <script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
  <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
<!-- Chart code -->
<!-- <script>
$(document).ready(function(){
	  $.ajax({

			type : "POST",
		    url: "/todaylessonadmin/sales_statistics",
		    success: function(data) {
		    	var charID = document.getElementById('contentBox');
		    	charID.innerHTML = '<div id="chartdiv"></div>';
		    	var mainConfig = {
		    		    "type": "serial",
		    		    "theme": "light",
		    		    "marginRight": 30,
		    		    "marginLeft": 30,
		    		    "legend": {
		    		        "verticalGap": 10,
		    		        "maxColumns": 1,
		    		        "position": "top",
		    				    "useGraphSettings": true,
		    				    "markerSize": 8,
		    		        "align": "center"
		    		    },
		    		    "autoMarginOffset": 20,
		    		    "mouseWheelZoomEnabled":true,
		    		    "dataDateFormat": "YYYY-MM-DD",
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
		    		          "color":"#ffffff",
		    		          "fontSize": 10,
		    		          "maxWidth": 40
		    		        },
		    		        "bullet": "round",
		    		        "bulletBorderAlpha": 1,
		    		        "bulletColor": "#FFFFFF",
		    		        "bulletSize": 5,
		    		        "hideBulletsCount": 50,
		    		        "lineThickness": 2,
		    		        "title": "Worthington",
		    		        "useLineColorForBulletBorder": true,
		    		        "valueField": "value",
		    		        "showHandOnHover": true,
		    		        "balloonText": "<span>Revenue: [[value]]</span>"
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
		    		    "dataProvider": [{
		    		        
		    		    }],
		    		    "periodSelector": {
		    		      "position": "top",
		    		      "periods": [ {
		    		          "period": "DD",
		    		          "count": 10,
		    		          "label": "10D"
		    		        }, {
		    		          "period": "MM",
		    		          "count": 1,
		    		          "label": "1M"
		    		        }, {
		    		          "period": "MM",
		    		          "count": 6,
		    		          "label": "6M"
		    		        }, {
		    		          "period": "YYYY",
		    		          "count": 1,
		    		          "label": "1Y"
		    		        },
		    		        {
		    		          "period": "MAX",
		    		          "label": "MAX"
		    		        }
		    		      ]
		    		    }
		    		}
		    }
		})

	})

</script> -->
<script type="text/javascript">
var charID = document.getElementById('contentBox');
charID.innerHTML = '<div id="chartdiv"></div>';

var mainConfig = {
    "type": "serial",
    "theme": "light",
    "marginRight": 30,
    "marginLeft": 30,
    "legend": {
        "verticalGap": 10,
        "maxColumns": 1,
        "position": "top",
		    "useGraphSettings": true,
		    "markerSize": 8,
        "align": "center"
    },
    "autoMarginOffset": 20,
    "mouseWheelZoomEnabled":true,
    "dataDateFormat": "YYYY-MM-DD",
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
          "color":"#ffffff",
          "fontSize": 10,
          "maxWidth": 40
        },
        "bullet": "round",
        "bulletBorderAlpha": 1,
        "bulletColor": "#FFFFFF",
        "bulletSize": 5,
        "hideBulletsCount": 50,
        "lineThickness": 2,
        "title": "Worthington",
        "useLineColorForBulletBorder": true,
        "valueField": "value",
        "showHandOnHover": true,
        "balloonText": "<span>Revenue: [[value]]</span>"
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
    "dataProvider": [{
        "date": "2012-07-27",
        "value": 13,
    }, {
        "date": "2012-07-28",
        "value": 11
    }, {
        "date": "2012-07-29",
        "value": 15
    }, {
        "date": "2012-07-30",
        "value": 16
    }, {
        "date": "2012-07-31",
        "value": 18
    }, {
        "date": "2012-08-01",
        "value": 13
    }, {
        "date": "2012-08-02",
        "value": 22
    }, {
        "date": "2012-08-03",
        "value": 23
    }, {
        "date": "2012-08-04",
        "value": 20
    }, {
        "date": "2012-08-05",
        "value": 17
    }, {
        "date": "2012-08-06",
        "value": 16
    }, {
        "date": "2012-08-07",
        "value": 18
    }, {
        "date": "2012-08-08",
        "value": 21
    }, {
        "date": "2012-08-09",
        "value": 26
    }, {
        "date": "2012-08-10",
        "value": 24
    }, {
        "date": "2012-08-11",
        "value": 29
    }, {
        "date": "2012-08-12",
        "value": 32
    }, {
        "date": "2012-08-13",
        "value": 18
    }, {
        "date": "2012-08-14",
        "value": 24
    }, {
        "date": "2012-08-15",
        "value": 22
    }, {
        "date": "2012-08-16",
        "value": 18
    }, {
        "date": "2012-08-17",
        "value": 19
    }, {
        "date": "2012-08-18",
        "value": 14
    }, {
        "date": "2012-08-19",
        "value": 15
    }, {
        "date": "2012-08-20",
        "value": 12
    }, {
        "date": "2012-08-21",
        "value": 8
    }, {
        "date": "2012-08-22",
        "value": 9
    }, {
        "date": "2012-08-23",
        "value": 8
    }, {
        "date": "2012-08-24",
        "value": 7
    }, {
        "date": "2012-08-25",
        "value": 5
    }, {
        "date": "2012-08-26",
        "value": 11
    }, {
        "date": "2012-08-27",
        "value": 13
    }, {
        "date": "2012-08-28",
        "value": 18
    }, {
        "date": "2012-08-29",
        "value": 20
    }, {
        "date": "2012-08-30",
        "value": 29
    }, {
        "date": "2012-08-31",
        "value": 33
    }, {
        "date": "2012-09-01",
        "value": 42
    }, {
        "date": "2012-09-02",
        "value": 35
    }, {
        "date": "2012-09-03",
        "value": 31
    }, {
        "date": "2012-09-04",
        "value": 47
    }, {
        "date": "2012-09-05",
        "value": 52
    }, {
        "date": "2012-09-06",
        "value": 46
    }, {
        "date": "2012-09-07",
        "value": 41
    }, {
        "date": "2012-09-08",
        "value": 43
    }, {
        "date": "2012-09-09",
        "value": 40
    }, {
        "date": "2012-09-10",
        "value": 39
    }, {
        "date": "2012-09-11",
        "value": 34
    }, {
        "date": "2012-09-12",
        "value": 29
    }, {
        "date": "2012-09-13",
        "value": 34
    }, {
        "date": "2012-09-14",
        "value": 37
    }, {
        "date": "2012-09-15",
        "value": 42
    }, {
        "date": "2012-09-16",
        "value": 49
    }, {
        "date": "2012-09-17",
        "value": 46
    }, {
        "date": "2012-09-18",
        "value": 47
    }, {
        "date": "2012-09-19",
        "value": 55
    }, {
        "date": "2012-09-20",
        "value": 59
    }, {
        "date": "2012-09-21",
        "value": 58
    }, {
        "date": "2012-09-22",
        "value": 57
    }, {
        "date": "2012-09-23",
        "value": 61
    }, {
        "date": "2012-09-24",
        "value": 59
    }, {
        "date": "2012-09-25",
        "value": 67
    }, {
        "date": "2012-09-26",
        "value": 65
    }, {
        "date": "2012-09-27",
        "value": 61
    }, {
        "date": "2012-10-04",
        "value": 32
    }, {
        "date": "2012-10-05",
        "value": 21
    }, {
        "date": "2012-10-06",
        "value": 18
    }, {
        "date": "2012-10-07",
        "value": 21
    }, {
        "date": "2012-10-08",
        "value": 28
    }, {
        "date": "2012-10-09",
        "value": 27
    }, {
        "date": "2012-10-10",
        "value": 36
    }, {
        "date": "2012-10-11",
        "value": 33
    },  {
        "date": "2012-11-16",
        "value": 82
    }, {
        "date": "2012-11-17",
        "value": 86
    }, {
        "date": "2012-11-18",
        "value": 80
    }, {
        "date": "2012-11-19",
        "value": 87
    }, {
        "date": "2012-11-20",
        "value": 83
    }, {
        "date": "2012-11-21",
        "value": 85
    }, {
        "date": "2012-11-22",
        "value": 84
    }, {
        "date": "2012-11-23",
        "value": 82
    }, {
        "date": "2012-11-24",
        "value": 73
    }, {
        "date": "2012-11-25",
        "value": 71
    }, {
        "date": "2012-11-26",
        "value": 75
    }, {
        "date": "2012-11-27",
        "value": 79
    }, {
        "date": "2012-11-28",
        "value": 70
    }, {
        "date": "2012-11-29",
        "value": 73
    }, {
        "date": "2012-11-30",
        "value": 61
    }, {
        "date": "2012-12-01",
        "value": 62
    }, {
        "date": "2012-12-02",
        "value": 66
    }, {
        "date": "2012-12-03",
        "value": 65
    }, {
        "date": "2012-12-04",
        "value": 73
    }, {
        "date": "2012-12-05",
        "value": 79
    }, {
        "date": "2012-12-06",
        "value": 78
    }, {
        "date": "2012-12-07",
        "value": 78
    }, {
        "date": "2012-12-08",
        "value": 78
    }, {
        "date": "2012-12-09",
        "value": 74
    }, {
        "date": "2012-12-10",
        "value": 73
    }, {
        "date": "2012-12-11",
        "value": 75
    }, {
        "date": "2012-12-12",
        "value": 70
    }, {
        "date": "2012-12-13",
        "value": 77
    }, {
        "date": "2012-12-14",
        "value": 67
    }, {
        "date": "2012-12-15",
        "value": 62
    }, {
        "date": "2012-12-16",
        "value": 64
    }, {
        "date": "2012-12-17",
        "value": 61
    }, {
        "date": "2012-12-18",
        "value": 59
    }, {
        "date": "2012-12-19",
        "value": 53
    }, {
        "date": "2012-12-20",
        "value": 54
    }, {
        "date": "2012-12-21",
        "value": 56
    }, {
        "date": "2012-12-22",
        "value": 59
    }, {
        "date": "2012-12-23",
        "value": 58
    }, {
        "date": "2012-12-24",
        "value": 55
    }, {
        "date": "2012-12-25",
        "value": 52
    }, {
        "date": "2012-12-26",
        "value": 54
    }, {
        "date": "2012-12-27",
        "value": 50
    }, {
        "date": "2012-12-28",
        "value": 50
    }, {
        "date": "2012-12-29",
        "value": 51
    }, {
        "date": "2012-12-30",
        "value": 52
    }, {
        "date": "2012-12-31",
        "value": 58
    }, {
        "date": "2013-01-01",
        "value": 60
    }, {
        "date": "2013-01-02",
        "value": 67
    }, {
        "date": "2013-01-03",
        "value": 64
    }, {
        "date": "2013-01-04",
        "value": 66
    }, {
        "date": "2013-01-05",
        "value": 60
    }, {
        "date": "2013-01-06",
        "value": 63
    }, {
        "date": "2013-01-07",
        "value": 61
    }, {
        "date": "2013-01-08",
        "value": 60
    }, {
        "date": "2013-01-09",
        "value": 65
    }, {
        "date": "2013-01-10",
        "value": 75
    }, {
        "date": "2013-01-11",
        "value": 77
    }, {
        "date": "2013-01-12",
        "value": 78
    }, {
        "date": "2013-01-13",
        "value": 70
    }, {
        "date": "2013-01-14",
        "value": 70
    }, {
        "date": "2013-01-15",
        "value": 73
    }, {
        "date": "2013-01-16",
        "value": 71
    }, {
        "date": "2013-01-17",
        "value": 74
    }, {
        "date": "2013-01-18",
        "value": 78
    }, {
        "date": "2013-01-19",
        "value": 85
    }, {
        "date": "2013-01-20",
        "value": 82
    }, {
        "date": "2013-01-21",
        "value": 83
    }, {
        "date": "2013-01-22",
        "value": 88
    }, {
        "date": "2013-01-23",
        "value": 85
    }, {
        "date": "2013-01-24",
        "value": 85
    }, {
        "date": "2013-01-25",
        "value": 80
    }, {
        "date": "2013-01-26",
        "value": 87
    }, {
        "date": "2013-01-27",
        "value": 84
    }, {
        "date": "2013-01-28",
        "value": 83
    }, {
        "date": "2013-01-29",
        "value": 84
    }, {
        "date": "2013-01-30",
        "value": 81
    }],
    "periodSelector": {
      "position": "top",
      "periods": [ {
          "period": "DD",
          "count": 10,
          "label": "10D"
        }, {
          "period": "MM",
          "count": 1,
          "label": "1M"
        }, {
          "period": "MM",
          "count": 6,
          "label": "6M"
        }, {
          "period": "YYYY",
          "count": 1,
          "label": "1Y"
        },
        {
          "period": "MAX",
          "label": "MAX"
        }
      ]
    }
}

var innerConfig = {
    "type": "serial",
    "theme": "light",
    "marginRight": 30,
    "marginLeft": 30,
    "addClassNames": true,
    "classNamePrefix": "amcharts",
    "titles":[{ "text": "Hourly Revenue", "id": "title"}],
    "legend": {
        "verticalGap": 10,
        "maxColumns": 1,
        "position": "top",
		    "useGraphSettings": true,
		    "markerSize": 8,
        "align": "center"
    },
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
        "id": "g2",
        "balloon":{
          "drop":true,
          "adjustBorderColor":false,
          "color":"#ffffff",
          "fontSize": 10,
          "maxWidth": 40
        },
        "bullet": "round",
        "bulletBorderAlpha": 1,
        "bulletColor": "#FFFFFF",
        "bulletSize": 5,
        "hideBulletsCount": 50,
        "lineThickness": 2,
        "title": "Worthington",
        "useLineColorForBulletBorder": true,
        "valueField": "value",
        "showHandOnHover": true,
        "balloonText": "<span>Revenue: [[value]]</span>"
    }],
    "chartScrollbar": {
        "graph": "g2",
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
    "categoryField": "time",
    "categoryAxis": {
        "dashLength": 1,
        "minorGridEnabled": true
    },
    "export": {
        "enabled": true
    },
    "dataProvider": [
      {
        "time": "12:00 AM",
        "value": 87
      },
      {
        "time": "1:00 AM",
        "value": 52
      },
      {
        "time": "2:00 AM",
        "value": 58
      },
      {
        "time": "3:00 AM",
        "value": 48
      },
      {
        "time": "4:00 AM",
        "value": 68
      },
      {
        "time": "5:00 AM",
        "value": 70
      },
      {
        "time": "6:00 AM",
        "value": 52
      },
      {
        "time": "7:00 AM",
        "value": 49
      },
      {
        "time": "8:00 AM",
        "value": 80
      },
      {
        "time": "9:00 AM",
        "value": 82
      },
      {
        "time": "10:00 AM",
        "value": 85
      },
      {
        "time": "11:00 AM",
        "value": 91
      },
      {
        "time": "12:00 PM",
        "value": 86
      },
      {
        "time": "1:00 PM",
        "value": 82
      },
      {
        "time": "2:00 PM",
        "value": 76
      },
      {
        "time": "3:00 PM",
        "value": 76
      },
      {
        "time": "4:00 PM",
        "value": 76
      },
      {
        "time": "5:00 PM",
        "value": 80
      },
      {
        "time": "6:00 PM",
        "value": 62
      },
      {
        "time": "7:00 PM",
        "value": 65
      },
      {
        "time": "8:00 PM",
        "value": 59
      },
      {
        "time": "9:00 PM",
        "value": 60
      },
      {
        "time": "10:00 PM",
        "value": 63
      },
      {
        "time": "11:00 PM",
        "value": 90
      },
    ]
  }

var testingConfig = {
      "type": "radar",
      "theme": "light",
      "titles": [{"text":"Shipper Performance"}],
      "dataProvider": [ {
        "country": "Speed",
        "litres": 156.9
      }, {
        "country": "Accuracy",
        "litres": 131.1
      }, {
        "country": "Sales",
        "litres": 115.8
      }, {
        "country": "Cost",
        "litres": 109.9
      }, {
        "country": "Other",
        "litres": 108.3
      }, {
        "country": "Other",
        "litres": 99
      } ],
      "valueAxes": [ {
        "axisTitleOffset": 20,
        "minimum": 0,
        "axisAlpha": 0.15
      } ],
      "graphs": [ {
        "balloonText": "[[value]]",
        "bullet": "round",
        "lineThickness": 2,
        "valueField": "litres",
        "id": "g3"
      } ],
      "categoryField": "country",
      "export": {
        "enabled": true
      }
};

var testingConfig2 = {
      "type": "radar",
      "theme": "light",
      "titles": [{"text":"Shipper Performance"}],
      "dataProvider": [ {
        "country": "Speed",
        "litres": 156.9
      }, {
        "country": "Accuracy",
        "litres": 131.1
      }, {
        "country": "Sales",
        "litres": 115.8
      }, {
        "country": "Cost",
        "litres": 109.9
      }, {
        "country": "Other",
        "litres": 108.3
      }, {
        "country": "Other",
        "litres": 99
      } ],
      "graphs": [ {
        "balloonText": "[[value]]",
        "bullet": "round",
        "lineThickness": 2,
        "valueField": "litres",
        "id": "g4"
      } ],
      "categoryField": "country",
      "export": {
        "enabled": true
      }
};
  
var chartTwo = AmCharts.makeChart("chartdiv", innerConfig);
var chartThree = AmCharts.makeChart("chartdivTwo", testingConfig);
var chartFour = AmCharts.makeChart("chartdivTwo", testingConfig2);

var chart = AmCharts.makeChart("chartdiv", mainConfig);
chart.addListener("rendered", showZoomOptions);
chart.addListener("clickGraphItem", renderNew);

function renderNew(){
  
  charID.innerHTML = '<div id="chartdiv" style="float:left; margin:10; width:50%"></div>' + '<div id="chartdivTwo" style="float:left; margin:10; width:50%;"></div>';
  
  var el = document.getElementById('options');
  el.innerHTML = '<input type="button" value="Go Back" onclick="renderOld();" />' + " " +
      '<input type="button" value="Full View" onclick="showPopup(\'chartdiv\');" />';
  

  chartTwo.write("chartdiv");
  chartThree.write("chartdivTwo");
  
  return;
}

function renderOld(){
  charID.innerHTML ='<div id="chartdiv"></div>';
  showZoomOptions();
  //chart.clear();
  //chart = AmCharts.makeChart("chartdiv", mainConfig);
  chart.write("chartdiv");
  //chart.validateData();
  addListeners();
  return;
}

function addListeners(){
  chart.addListener("rendered", showZoomOptions);
  chart.addListener("clickGraphItem", renderNew);
}

function testChart(){
  //chart.clear();
  
  var el = document.getElementById('options');
  el.innerHTML = '<input type="button" value="Go Back" onclick="renderOld();" />';
  
  charID.innerHTML = '<div id="chartdiv" style="float:left; margin:10; width:50%"></div>' + '<div id="chartdivTwo" style="float:left; margin:10; width:50%;"></div>';
  
  chartThree.write("chartdiv");
  chartFour.write("chartdivTwo");
  
  return;
}

function showZoomOptions(){
  
  var el = document.getElementById('options');
  el.innerHTML = '<h3>Zoom Options</h3>' +
    '<input type="button" value="TMC" onclick="fancyMe();" />' + ' ' +
    '<input type="button" value="Day" onclick="zoomTo(1);" />' + ' ' +
    '<input type="button" value="Week" onclick="zoomTo(7);" />' + ' ' +
    '<input type="button" value="Month" onclick="zoomTo(31);" />' + ' ' +
    '<input type="button" value="Test" onclick="testChart();" />'
  
}

function zoomTo(time) {
  switch(time){
    case 1:
      chart.zoomToIndexes(0, 22);
      break;
    case 7:
      chart.zoomToIndexes(0, 114);
      break;
    case 31:
      chart.zoomToIndexes(0, chart.dataProvider.length);
      break;
  }
}

function showPopup(id) {
  //var chart = $( "#" + id );
  var towers = $("#contentBox");
  var modal = $( "<div>" ).addClass( "modal" );
  var shade = $( "<div>" ).addClass( "shade" ).appendTo( modal ).on( "click", close );
  //var placeholder = $( "<div>" ).prop( "id", id + "_placeholder" ).hide().insertBefore( chart );
  //$( document.body ).append( modal );
  modal.appendTo(towers);
  //chart.appendTo( modal ).addClass( "chart" );

  function close() {
    //chart.insertAfter( placeholder ).removeClass( "chart" );
    //placeholder.remove();
    modal.remove();
  }
}

function fancyMe(){
    $.fancybox({
    href: "https://www.tmctrans.com/",
    title: "TMC Home",
    type: "iframe"
  });
}

map.addListener("clickGraphItem", function(event) {
  $.fancybox({
    href: event.mapObject.modalUrl,
    title: event.mapObject.title,
    type: "iframe"
  });
});

</script>

</head>
<body>

<div>
    <div id="options"></div>
    <div id="contentBox" style="margin:0px auto; width:100">
    </div>
  </div>

</body>
</html>

