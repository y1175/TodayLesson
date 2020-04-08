/*접속자 차트 */
$(document).ready(function(){
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
/*차트끝*/

//디지털시계
//invokes functions as soon as window loads
window.onload = function(){
	time();
	ampm();
	whatDay();
	setInterval(function(){
		time();
		ampm();
		whatDay();
	}, 1000);
};


//gets current time and changes html to reflect it
function time(){
	var date = new Date(),
		hours = date.getHours(),
		minutes = date.getMinutes(),
		seconds = date.getSeconds();

	//make clock a 12 hour clock instead of 24 hour clock
	hours = (hours > 12) ? (hours - 12) : hours;
	hours = (hours === 0) ? 12 : hours;

	//invokes function to make sure number has at least two digits
	hours = addZero(hours);
	minutes = addZero(minutes);
	seconds = addZero(seconds);

	//changes the html to match results
	document.getElementsByClassName('hours')[0].innerHTML = hours;
	document.getElementsByClassName('minutes')[0].innerHTML = minutes;
	document.getElementsByClassName('seconds')[0].innerHTML = seconds;
}

//turns single digit numbers to two digit numbers by placing a zero in front
function addZero (val){
	return (val <= 9) ? ("0" + val) : val;
}

//lights up either am or pm on clock
function ampm(){
	var date = new Date(),
		hours = date.getHours(),
		am = document.getElementsByClassName("am")[0].classList,
		pm = document.getElementsByClassName("pm")[0].classList;
	
		
	(hours >= 12) ? pm.add("light-on") : am.add("light-on");
	(hours >= 12) ? am.remove("light-on") : pm.remove("light-on");
}

//lights up what day of the week it is
function whatDay(){
	var date = new Date(),
		currentDay = date.getDay(),
		days = document.getElementsByClassName("day");

	//iterates through all divs with a class of "day"
	for (x in days){
		//list of classes in current div
		var classArr = days[x].classList;

		(classArr !== undefined) && ((x == currentDay) ? classArr.add("light-on") : classArr.remove("light-on"));
	}
}

//디지털시계끝