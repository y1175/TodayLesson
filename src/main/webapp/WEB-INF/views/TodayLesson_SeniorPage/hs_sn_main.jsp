<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>      
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery -->
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
   
<!-- jQuery -->

<!-- jQuery DatePicker -->
   <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- jQuery DatePicker -->

<!-- viewport -->
   <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, shrink-to-fit=no">
<!-- viewport / shrink-to-fit=no 사파리 브라우저에 영향을 미치는 속성 -->

<!-- Bootstrap -->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
   <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<!-- Bootstrap -->

<!--icon-->
   <!-- Font Awesome5 -->
      <script src='https://kit.fontawesome.com/a076d05399.js'></script>
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
   <!-- Font Awesome5 -->
   <!-- Font Awesome5 -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <!-- Font Awesome5 -->
   <!-- Google -->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
   <!-- Google -->
   <!-- Bootstrap -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <!-- Bootstrap -->
<!--icon-->

<!-- font style -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/font.css">  
<!-- font style -->

</head>
<body>

   <header>
      <tiles:insertAttribute name="hs_sn_main_header"/>
   </header>
   
   <section style="width: 100%;">
      
      <aside  style="width: 10%; float: left;">
         <tiles:insertAttribute name="hs_sn_main_leftaside_nav"/>
      </aside>
      
      <section style="width: 90%; float: right ;">
      <tiles:insertAttribute name="hs_sn_main_section"/>
      </section>
   
   </section>
   
   <footer>
      <tiles:insertAttribute name="hs_sn_main_footer"/>
   </footer>
</body>
</html>