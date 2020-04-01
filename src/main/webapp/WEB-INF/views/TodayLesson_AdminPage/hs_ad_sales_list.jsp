<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>TodayLessonAdminPage</title>
</head>
<body>
   <div>
      <h3>시니어 매출 현황</h3>
      <div>
         <c:forEach var="" items="">
            <form action="">
               <select>
                  <option value="">전체</option>
                  <option value="">최대매출순</option>
                  <option value="">상품번호순</option>
               </select>
               <button>엑셀다운로드</button>
            </form>
         </c:forEach>
      </div>
      <div>
         <table class="">
            <thead>
               <tr>
                  <th rowspan="2">NO.</th>
                  <th rowspan="2">카테고리</th>
                  <th rowspan="2">레슨종류</th>
                  <th rowspan="2">레슨번호</th>
                  <th rowspan="2">레슨명</th>
                  <th rowspan="2">시니어</th>
                  <th rowspan="2">시니어매출</th>
                  <th colspan="4">상세내역</th>
               </tr>
               <tr>
                  <th>결제금액</th>   
                  <th>포인트사용</th>
                  <th>정산수수료</th>
                  <th>세금계산서부가세</th>
               </tr>
            </thead>
            <tbody>
               <c:set var="ad_sales_sum" value="0"/> <!-- 시니어매출합계 -->
               <c:set var="ad_cost_sum" value="0"/> <!-- 결제금액합계 -->
               <c:set var="ad_usepoint_sum" value="0"/> <!-- 포인트사용합계 -->
               <c:set var="ad_comm_sum" value="0"/> <!-- 정산수수료합계 -->
               <c:set var="ad_surtaxsum" value="0"/> <!-- 세금계산서 부가세합계-->
               <c:forEach var="" items="" varStatus="status">
                  <tr>
                     <!-- NO. -->
                     <td>
                        <c:out value="${status.count}"/>
                     </td> 
                     <!-- 카테고리 -->
                     <td></td>
                     <!-- 레슨종류 -->
                     <c:choose>
                        <c:when test="">
                           <c:out value="원데이레슨"/>
                        </c:when> 
                        <c:when test="$">
                           <c:out value="다회성레슨"/>
                        </c:when>
                        <c:when test="">
                           <c:out value="동영상레슨"/>
                        </c:when>
                     </c:choose>                  
                     <!-- 레슨번호 -->
                     <td>
                        <c:out value=""/>
                     </td> 
                     <!-- 레슨명 -->
                     <td>
                        <c:out value=""/>
                     </td> 
                     <!-- 시니어 -->
                     <td>
                        <c:out value=""/>
                     </td> 
                     <!-- 시니어매출 = 결제금액-(포인트+정산수수료+부가세) -->
                     <c:set var="cost" value=""/> <!-- 결제금액 -->
                     <c:set var="point" value=""/> <!-- 포인트  -->
                     <c:set var="comm" value=""/> <!-- 정산수수료 -->
                     <c:set var="surtax" value=""/> <!-- 부가세 -->
                     <c:set var="senior_sales" value=""/>
                        <td>
                           <fmt:formatNumber value="" type="number" maxFractionDigits="3"/>
                        </td> 
                     <!-- 결제금액 -->
                        <td>
                           <fmt:formatNumber value="" type="number" maxFractionDigits="3"/>
                        </td> 
                     <!-- 포인트사용 -->
                        <td>
                           <fmt:formatNumber value="" type="number" maxFractionDigits="3"/>
                        </td> 
                     <!-- 정산수수료 -->
                     <td>
                        <fmt:formatNumber value="" type="number" maxFractionDigits="3"/>
                     </td> 
                     <!-- 세금계산서부가세 -->
                     <c:choose>
                        <c:when test="${salesList.senior_crno == null}"> 
                           <td>
                              <c:out value="0"/>
                           </td>
                        </c:when>
                        <c:otherwise>
                           <td>
                              <fmt:formatNumber value="${salesList.sales_surtax}" type="number" maxFractionDigits="3"/>
                           </td>    
                        </c:otherwise>
                     </c:choose>
                  </tr>
                  <c:set var="" value=""/> <!-- 시니어매출합계 -->
                  
                     <!-- 결제금액합계 -->
                     <c:set var="" value=""/> 
                     <!-- 포인트사용합계 -->
                     <c:set var="usepoint_sum" value=""/> 
                  <c:set var="comm_sum" value=""/> <!-- 정산수수료합계 -->
                  <c:set var="surtaxsum" value=""/> <!-- 세금계산서 부가세합계-->
               </c:forEach>
            </tbody>
            <tfoot>
               <tr>
                  <td colspan="6">합계</td>
                  <td> <!-- 시니어매출합계 -->
                     <fmt:formatNumber value="" type="number" maxFractionDigits="3"/>
                  </td> 
                  <td> <!-- 결제금액합계 -->
                     <fmt:formatNumber value="" type="number" maxFractionDigits="3"/>
                  </td> 
                  <td> <!-- 포인트사용합계 -->
                     <fmt:formatNumber value="" type="number" maxFractionDigits="3"/>
                  </td> 
                  <td> <!-- 정산수수료합계 -->
                     <fmt:formatNumber value="" type="number" maxFractionDigits="3"/>
                  </td> 
                  <td> <!-- 세금계산서 부가세합계-->
                     <fmt:formatNumber value="" type="number" maxFractionDigits="3"/>
                  </td> 
               </tr>
            </tfoot>
         </table>
      </div>   
   </div>
</body>
</html>