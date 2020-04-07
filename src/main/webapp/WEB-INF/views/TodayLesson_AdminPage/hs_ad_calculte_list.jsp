<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div class="">
      <h4 class="">시니어매출정산</h4>   
      <div class="">
         <c:forEach var="" items="">
            <form action="">
               <select>
                  <option value="">전체</option>
                  <option value="">정산신청</option>
                  <option value="">정산완료</option>
               </select>
               <button>엑셀다운로드</button>
            </form>
         </c:forEach>
      </div>
      <div class="">
         <table id="" class="table table-hover">
            <thead style="border-top: 2px solid rgb(53, 54, 58);">
               <tr>
                  <th rowspan="2">NO.</th>
                  <th rowspan="2">정산번호</th>
                  <th rowspan="2">정산상태</th>
                  <th rowspan="2">정산신청일</th>
                  <th rowspan="2">시니어</th>
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
               <c:forEach var="" items="" varStatus="status"> <!-- 정산내역 목록 리스트 정산번호 / 정산상태 / 정산신청일 / 정산기간 / 정산계좌  -->
               <c:forEach var="" items=""> <!-- 결제건수 -->
               <c:forEach var="" items=""> <!-- 레슨수익금액 -->
               <c:forEach var="" items=""> <!-- 포인트사용 -->
                  <tr>
                     <!-- NO. -->
                     <td>
                        <c:out value=""/>
                     </td>
                     <!-- 정산번호 -->
                     <td>
                        <c:out value=""/>
                     </td> 
                     <!-- 정산상태 -->
                     <td>
                        
                     </td>
                     <!-- 정산신청일  정산 완료 됐을시만 나타나게 -->
                     <td>
                     </td> 
                     <!-- 결제건수 -->
                     <td>
                     </td> 
                     <!-- 정산계좌 -->
                     <td>
                        <c:out value=""/>
                        <br>
                        <c:out value=""/>
                        <br>
                        <c:out value=""/>
                     </td>
                     <!-- 정산금액 -->
                     <td>
                     
                     </td> 
                     <!-- 레슨수익금액 결제완료된금액-->
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
                     <td>
                        <c:choose>
                        <c:when test=""> 
                           <td>
                              <c:out value="0"/>
                           </td>
                        </c:when>
                        <c:otherwise>
                           <td>
                              <fmt:formatNumber value="" type="number" maxFractionDigits="3"/>
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