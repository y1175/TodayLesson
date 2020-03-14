<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--aside nav style-->
<link rel="stylesheet" href="resources/CSS/hs_sn_main_leftaside_nav.css">
<!--aside nav style-->

</head>
<body>
   <nav class="hs_sn_main_asidenav_nav">
   
      <b>레슨</b>
      <br>
         <a href="">레슨등록</a>
         <br>
         <a href="">레슨관리</a>
         <br>
      
      <div class="hs_sn_main_asidenav_line"></div>
      
      <b>매출정산</b>
      <br> <!-- 나중에 컨트럴러에서 시니어 no값 넘기기 -->   
         <a href="/senior_sales_list/${senior_no}">매출현황</a>
         <br>
         <a href="">정산신청</a>
         <br>
         <a href="">정산내역</a>

      <div class="hs_sn_main_asidenav_line"></div>
      
   </nav>

</body>
</html>