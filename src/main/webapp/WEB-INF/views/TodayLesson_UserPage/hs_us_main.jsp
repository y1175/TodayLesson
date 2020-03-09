<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>            
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery -->
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
<!-- jQuery -->

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
   <script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!--icon-->

<!-- font style -->
   <link rel="stylesheet" href="resources/CSS/font.css">  
<!-- font style -->

</head>
<body>
   <header>
      <jsp:include page="hs_us_main_header.jsp"/>
   </header>
   <section>
      <c:set var="hs_us_section_page" scope="page" value="${param.page}"/>
      <c:out value="${hs_us_section_page} dddd"></c:out>
         <c:if test="${hs_us_section_page}!=null">
            <jsp:include page="${hs_us_section_page}"/>
         </c:if>
         <c:if test="${hs_us_section_page}==null || ${hs_us_section_page}=='' " >
            <jsp:include page="hs_us_home_content.jsp"/>
         </c:if>
   </section>
   <footer>
      <jsp:include page="hs_all_main_footer.jsp"/>
   </footer>
</body>
</html>