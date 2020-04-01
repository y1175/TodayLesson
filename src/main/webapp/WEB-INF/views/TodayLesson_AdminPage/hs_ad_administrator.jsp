<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- CSSstyle --> 
   <style type="text/css">
      .hs_ad_main_asidenav_nav_Administrator_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle -->

</head>
<body>
   <div>
      <table>
         <tbody>
            <tr>
               <th>아이디</th>
               <td><c:out value="${dto.member_id}"/></td>
            </tr>
            <tr>
               <th>담당자</th>
               <td><c:out value="${dto.member_name}"/></td>
            </tr>
            <tr>
               <th>구분</th>
               <td>
                  <c:if test="${dto.member_level==0}">
                     <c:out value="관리자"/>
                  </c:if>
               </td>
            </tr>
            <tr>
               <th>마지막로그인</th>
               <td></td>
            </tr>
         </tbody>
      </table>
   </div>
</body>
</html>