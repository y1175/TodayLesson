<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- CSSstyle -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hs_sn_calculate_statementlist.css?ver=1">  
   <style type="text/css">
      .hs_sn_main_asidenav_nav_calStatment_title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle -->  

</head>
<body>
   <div class="hs_senior_calculate_statement">
      <h4 class="hs_senior_calculate_statement_title">정산내역</h4>   
      <div class="hs_senior_CalculateStatement_ExcelBox" style="text-align: right; margin-right: 15px;">
         <button class="hs_senior_CalculateStatement_ExcelBtn">엑셀다운로드</button>
      </div>
      <div class="hs_senior_calculate_statementList">
         <table id="hs_senior_calculate_statementList_Table" class="table table-hover">
            <thead style="border-top: 2px solid rgb(53, 54, 58);">
               <tr>
                  <th rowspan="2">NO.</th>
                  <th rowspan="2">정산번호</th>
                  <th rowspan="2">정산상태</th>
                  <th rowspan="2">정산신청일</th>
                  <th rowspan="2">결제건수</th>
                  <th rowspan="2">정산기간</th>
                  <th rowspan="2">정산계좌</th>
                  <th rowspan="2">정산금액</th>
                  <th colspan="4" style="border-right: none; border-bottom: 1px solid rgba(53, 54, 58, 0.4);">상세내역</th>
               </tr>
               <tr>
                  <th>레슨수익금액</th> 
                  <th>포인트사용</th>  
                  <th>정산수수료</th>
                  <th style="border-right: none;">세금계산서부가세</th>
               </tr>
            </thead>
            <tbody>
               <c:forEach var="cal_statementlist" items="${cal_statementlist}" varStatus="status"> <!-- 정산내역 목록 리스트 정산번호 / 정산상태 / 정산신청일 / 정산기간 / 정산계좌  -->
               <c:forEach var="cal_statement_paycount" items="${cal_statement_paycount}"> <!-- 결제건수 -->
               <c:forEach var="cal_statement_lessonrevenuecost" items="${cal_statement_lessonrevenuecost}"> <!-- 레슨수익금액 -->
               <c:forEach var="cal_statement_usepointsum" items="${cal_statement_usepointsum}"> <!-- 포인트사용 -->
                  <tr>
                     <!-- NO. -->
                     <td>
                        <c:out value="${status.count}"/>
                     </td>
                     <!-- 정산번호 정산신청완료했을시에만 나타나게 -->
                     <td>
                        <c:out value="${cal_statementlist.calculate_no}"/>
                     </td> 
                     <!-- 정산상태 -->
                     <td>
                        <c:choose>
                           <c:when test="${cal_statementlist.orderlist_calculatestatus == 2}">
                              <c:out value="정산확인"/>
                           </c:when>
                           <c:when test="${cal_statementlist.orderlist_calculatestatus == 3}">
                              <c:out value="정산완료"/>
                           </c:when>
                        </c:choose>
                     </td>
                     <!-- 정산신청일  정산 완료 됐을시만 나타나게 -->
                     <td>
                        <c:out value="${cal_statementlist.calculate_date}"/>
                     </td> 
                     <!-- 결제건수 -->
                     <td>
                        <fmt:formatNumber value="${cal_statement_paycount}" type="number" maxFractionDigits="3"/>
                     </td> 
                  
                     <!-- 정산기간 -->
                     <td>
                        <c:out value="${cal_statementlist.lesson_open_period}"/>
                        <span> - </span>
                        <c:out value="${cal_statementlist.lesson_close_period}"/>
                     </td> 
                     <!-- 정산계좌 -->
                     <td>
                        <c:out value="${cal_statementlist.senior_bank_name}"/>
                        <br>
                        <c:out value="${cal_statementlist.senior_account_num}"/>
                        <br>
                        <c:out value="${cal_statementlist.s.senior_account_name}"/>
                     </td>
                     <!-- 정산금액 -->
                     <td>
                     
                     </td> 
                     <!-- 레슨수익금액 결제완료된금액-->
                     <td>
                        <fmt:formatNumber value="${cal_statement_lessonrevenuecost}" type="number" maxFractionDigits="3"/>
                     </td> 
                     <!-- 포인트사용 -->
                     <td>
                        <fmt:formatNumber value="${cal_statement_usepointsum}" type="number" maxFractionDigits="3"/>
                     </td> 
                     <!-- 정산수수료 -->
                     <td>
                        <fmt:formatNumber value="${cal_statement_lessonrevenuecost*0.1}" type="number" maxFractionDigits="3"/>
                     </td> 
                     <!-- 세금계산서부가세 -->
                     <td>
                        <c:choose>
                        <c:when test="${salesList.senior_crno == null}"> 
                           <td>
                              <c:out value="0"/>
                           </td>
                        </c:when>
                        <c:otherwise>
                           <td>
                              <fmt:formatNumber value="${(cal_statement_lessonrevenuecost/1.1)*0.1}" type="number" maxFractionDigits="3"/>
                           </td>    
                        </c:otherwise>
                     </c:choose>
                     </td>
                  </tr>
               </c:forEach>
               </c:forEach>
               </c:forEach>   
               </c:forEach>       
            </tbody>
         </table>
      </div>
   </div>  
</body>
</html>