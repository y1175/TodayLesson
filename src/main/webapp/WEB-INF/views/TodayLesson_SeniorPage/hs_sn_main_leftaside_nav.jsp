<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--aside nav style-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hs_sn_main_leftaside_nav.css?ver=1">
<!--aside nav style-->

</head>
<body>
   <nav class="hs_sn_main_asidenav_nav">
   
      <b class="hs_sn_main_asidenav_nav_title">레슨</b>
         <p>
            <a href="">레슨등록</a>
         </p>   
         <p>
            <a href="">레슨관리</a>
         </p>
         
      <div class="hs_sn_main_asidenav_line"></div>
      
      <b class="hs_sn_main_asidenav_nav_title">매출정산</b>
         <p class="hs_sn_main_asidenav_nav_salestitle">
            <a href="${pageContext.request.contextPath}/todaylessonsenior/senior_sales_list">매출현황</a>
         </p>
         <p class="hs_sn_main_asidenav_nav_calRequest_title">
            <a href="${pageContext.request.contextPath}/todaylessonsenior/senior_calculate_requestlist">정산신청</a>
         </p>
         <p class="hs_sn_main_asidenav_nav_calStatment_title">
            <a href="${pageContext.request.contextPath}/todaylessonsenior/senior_calculate_statementlist">정산내역</a>
         </p>
         
      <div class="hs_sn_main_asidenav_line"></div>
      
   </nav>

</body>
</html>