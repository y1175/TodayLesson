<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>           
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>TodayLesson</title>

<!-- jQuery -->
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
<!-- jQuery -->

<!-- viewport -->
   <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, shrink-to-fit=no">
<!-- viewport / shrink-to-fit=no 사파리 브라우저에 영향을 미치는 속성 -->

<!-- Bootstrap4 -->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
   <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<!-- Bootstrap4 -->

<!-- Bootstrap3 --> 
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
   <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
   <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Bootstrap3 -->



<!--icon-->
   <!-- Font Awesome5 -->
      <script src='https://kit.fontawesome.com/a076d05399.js'></script>
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
   <!-- Font Awesome5 -->
   <!-- Font Awesome4 -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <!-- Font Awesome4 -->
   <!-- Google -->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
   <!-- Google -->
<!--icon-->

<!-- font style -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/font.css">  
<!-- font style -->

<!-- popup javascript -->
<script>
/*팝업창 띄우기*/
function pevent(){
    function getCookie(name){
        var nameOfCookie = name + "=";
        var x = 0;
        while (x <= document.cookie.length){
            var y = (x + nameOfCookie.length);
            if (document.cookie.substring(x, y) == nameOfCookie){
            if ((endOfCookie = document.cookie.indexOf(";", y)) == -1){
            endOfCookie = document.cookie.length;
            }
            return unescape (document.cookie.substring(y, endOfCookie));
            }
            x = document.cookie.indexOf (" ", x) + 1;
            console.log();
            if (x == 0) break;
        }
        return "";
    }
    if (getCookie("popname") != "done"){
        var popUrl = "${pageContext.request.contextPath}/popupOpen";
        var popOption = "width=400%, height=235%, resizable=no, scrollbars=no, status=no;";
        window.open(popUrl,"",popOption);
    }
}
</script>
<script>
/*팝업이 사용상태일때*/
$(document).ready(function(){
	if(${popup_dto1.popup_use}==1)
	   {
	pevent()
	   }
	
}) 

</script>
<!-- popup javascript -->

</head>
<body>
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var d = window.document;
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "d5c81313-9c5b-414c-b252-d6c75187f760"
  });
</script>
<!-- End Channel Plugin -->

   <header>
      <tiles:insertAttribute name="hs_us_main_header"/>
   </header>
   
   
   <section>
      <tiles:insertAttribute name="hs_us_main_section"/>
   </section>
   
   <footer>
      <tiles:insertAttribute name="hs_us_main_footer"/>
   </footer>
</body>
</html>