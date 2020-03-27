<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- style -->   
   <link rel="stylesheet" href="resources/CSS/hs_sn_sales_list.css">
<!-- style -->
</head>
<body>
   <div>
      <h3>매출 현황</h3>
      <div>
       <c:forEach var="salesList_form" items="${salesList}">
         <form method="post" action="${pageContext.request.contextPath}/todaylessonsenior/senior_sales_list?startdate=${salesList_form.sales_search_startdate}&enddate=${salesList_form.sales_search_enddate}&search=${search}&searchtxt=${searchtxt}">
            <label>기간검색</label>
            <div>
               <input type="date" name="startdate" id="hs_sn_sales_startdate" placeholder="YYYY-MM-DD" value="${salesList_form.sales_search_startdate}">
               <span> - </span>
               <input type="date" name="enddate" id="hs_sn_sales_enddate" placeholder="YYYY-MM-DD" value="${salesList_form.sales_search_enddate}">
               <input type="button" name="" id="" value="전체">
               <input type="button" name="" id="" value="오늘">
               <input type="button" name="" id="" value="일주일">
               <input type="button" name="" id="" value="1개월">
            </div>
            <label>검색기준</label>
            <div>   
               <label for=""></label>
               <select name="search" class="">
                  <option value="">전체</option>
                  <option value="">레슨명</option>
                  <option value="">구매자</option>
               </select> 
               <input type="text" id="" name="searchtxt" placeholder="검색어를 입력해주세요">
            </div>
            <div>
               <input type="reset" id="" value="초기화">
               <input type="submit" id="" value="검색">
               
            </div>
            <div>
               <select name="" class="">
                  <option value="">전체</option>
                  <option value="">결제완료</option>
                  <option value="">결제취소</option>
               </select>
               <button>엑셀다운로드</button>
            </div>            
         </form>
         </c:forEach>
      </div>     
      <div>
         <table class="hs_sn_sales_table">
            <thead>
               <tr>
                  <th rowspan="2">NO.</th>
                  <th rowspan="2">결제상태</th>
                  <th rowspan="2">레슨종류</th>
                  <th rowspan="2">레슨번호</th>
                  <th rowspan="2">레슨명</th>
                  <th rowspan="2">구매일</th>
                  <th rowspan="2">구매자</th>
                  <th rowspan="2">시니어매출</th>
                  <th colspan="4">상세내역</th>
               </tr>
               <tr>
                  <th>결제금액</th>   
                  <th>포인트사용</th>
                  <!-- <th>취소금액</th>
                  <th>취소포인트</th> -->
                  <th>정산수수료</th>
                  <th>세금계산서부가세</th>
               </tr>
            </thead>
            <tbody>
               <c:set var="sales_sum" value="0"/> <!-- 시니어매출합계 -->
               <c:set var="cost_sum" value="0"/> <!-- 결제금액합계 -->
               <%-- <c:set var="costcancel_sum" value="0"/> --%> <!-- 결제결제취소합계합계 -->
               <c:set var="usepoint_sum" value="0"/> <!-- 포인트사용합계 -->
               <%-- <c:set var="usepointcancel_sum" value="0"/> --%> <!-- 포인트취소합계 -->
               <c:set var="comm_sum" value="0"/> <!-- 정산수수료합계 -->
               <c:set var="surtaxsum" value="0"/> <!-- 세금계산서 부가세합계-->
               <c:forEach var="salesList" items="${salesList}">
               <%-- <c:choose>
                  <c:when test="${salesList eq null}">
                     <tr>
                        <td>
                           <c:out value="매출내역이 없습니다"/>
                        </td>
                     </tr>
                  </c:when>
               </c:choose> --%>
               <%-- <c:otherwise> --%>
                  <tr>
                     <!-- NO. -->
                     <td>
                        <!-- 스크립트로 자동번호주기 -->
                     </td> 
                     <!-- 결제상태 -->
                     <c:choose>
                        <c:when test="${salesList.orderlist_paystatus == 2}">
                           <c:out value="결제완료"/>
                        </c:when> 
                        <c:when test="${salesList.orderlist_paystatus == 5}">
                           <c:out value="결제취소"/>
                        </c:when>
                     </c:choose>
                     <!-- 레슨종류 -->
                     <c:choose>
                        <c:when test="${salesList.lesson_type == 1}">
                           <c:out value="원데이레슨"/>
                        </c:when> 
                        <c:when test="${salesList.lesson_type == 2}">
                           <c:out value="다회성레슨"/>
                        </c:when>
                        <c:when test="${salesList.lesson_type == 3}">
                           <c:out value="동영상레슨"/>
                        </c:when>
                     </c:choose>                  
                     <!-- 레슨번호 -->
                     <td>
                        <c:out value="${salesList.lesson_no}"/>
                     </td> 
                     <!-- 레슨명 -->
                     <td>
                        <c:out value="${salesList.lesson_title}"/>
                     </td> 
                     <!-- 구매일 -->
                     <td>
                        <c:out value="${salesList.orderlist_date}"/>
                     </td> 
                     <!-- 구매자 -->
                     <td>
                        <c:out value="${salesList.member_name}"/>
                     </td> 
                     <!-- 시니어매출 = 결제금액-(포인트+정산수수료+부가세) -->
                     <c:set var="cost" value="${salesList.lesson_cost}"/> <!-- 결제금액 -->
                     <c:set var="point" value="${salesList.orderlist_usepoint}"/> <!-- 포인트  -->
                     <c:set var="comm" value="${salesList.sales_comm}"/> <!-- 정산수수료 -->
                     <c:set var="surtax" value="${salesList.sales_surtax}"/> <!-- 부가세 -->
                     <c:set var="senior_sales" value="${cost-(point+comm+surtax)}"/>
                        <td>
                           <c:out value="${senior_sales}"/>
                        </td> 
                     <!-- 결제금액 -->
                        <td>
                           <c:out value="${salesList.lesson_cost}"/>
                        </td> 
                     <%-- <c:choose>
                        <c:when test="${salesList.orderlist_paystatus == 0}">
                           <td>
                              <c:out value="${salesList.lesson_cost}"/>
                           </td> 
                        </c:when> --%>
                       <%--  <c:when test="${salesList.orderlist_paystatus == 1}">
                           <td>
                             <c:out value="0"/>
                           </td>
                        </c:when>
                     </c:choose> --%>
                     <!-- 포인트사용 -->
                        <td>
                           <c:out value="${salesList.orderlist_usepoint}"/>
                        </td> 
                     <%-- <c:choose>
                        <c:when test="${salesList.orderlist_paystatus == 0}">
                           <td>
                              <c:out value="${salesList.orderlist_usepoint}"/>
                           </td> 
                        </c:when>
                        <c:when test="${salesList.orderlist_paystatus == 1}">
                           <td>
                             <c:out value="0"/>
                           </td>
                        </c:when>
                     </c:choose> --%>
                     <!-- 취소금액 -->
                     <%-- <c:choose>
                        <c:when test="${salesList.orderlist_paystatus == 0}">
                           <td>
                              <c:out value="0"/>
                           </td>
                        </c:when>
                        <c:when test="${salesList.orderlist_paystatus == 1}">
                          <td>
                             <c:out value="${salesList.lesson_cost}"/>
                          </td>
                        </c:when>
                     </c:choose> --%>
                     <!-- 취소포인트 -->
                     <%-- <c:choose>
                        <c:when test="${salesList.orderlist_paystatus == 0}">
                           <td>
                              <c:out value="0"/>
                           </td>
                        </c:when>
                        <c:when test="${salesList.orderlist_paystatus == 1}">
                          <td>
                             <c:out value="${salesList.orderlist_usepoint}"/>
                          </td>
                        </c:when>
                     </c:choose> --%>
                     <!-- 정산수수료 -->
                     <td>
                        <c:out value="${salesList.sales_comm}"/>
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
                              <c:out value="${salesList.sales_surtax}"/>  
                           </td>    
                        </c:otherwise>
                     </c:choose>
                  </tr>
                  <c:set var="sales_sum" value="${sales_sum+senior_sales}"/> <!-- 시니어매출합계 -->
                  
                     <!-- 결제금액합계 -->
                     <c:set var="cost_sum" value="${cost_sum+salesList.orderlist_cost}"/> 
                     <%-- 결제금액/취소금액 같이되었을때... 처리할려고 햇던거 
                     <c:choose>
                     <c:when test="${salesList.orderlist_paystatus == 0}">
                        <c:set var="cost_sum" value="${cost_sum+salesList.orderlist_paystatus}"/> 
                     </c:when> --%>
                     <!-- 결제결제취소합계합계 -->
                     <%-- <c:when test="${salesList.orderlist_paystatus == 1}">
                        <c:set var="costcancel_sum" value="${costcancel_sum+salesList.orderlist_paystatus}"/> 
                     </c:when>
                  </c:choose> --%>
                  
                     <!-- 포인트사용합계 -->
                     <c:set var="usepoint_sum" value="${usepoint_sum+salesList.orderlist_usepoint}"/> 
                     <%-- 결제금액/취소금액 같이되었을때... 처리할려고 햇던거 
                     <c:choose>
                     <c:when test="${salesList.orderlist_paystatus == 0}">
                        <c:set var="usepoint_sum" value="${usepoint_sum+salesList.orderlist_paystatus}"/> 
                     </c:when> --%>
                     <!-- 포인트취소합계 -->
                     <%-- <c:when test="${salesList.orderlist_paystatus == 1}">
                        <c:set var="usepointcancel_sum" value="${usepointcancel_sum+salesList.orderlist_paystatus}"/>
                     </c:when> 
                  </c:choose> --%>
                  <c:set var="comm_sum" value="${comm_sum+salesList.sales_comm}"/> <!-- 정산수수료합계 -->
                  <c:set var="surtaxsum" value="${surtaxsum+salesList.sales_surtax}"/> <!-- 세금계산서 부가세합계-->
              <%--  </c:otherwise> --%>
               </c:forEach>
            </tbody>
            <tfoot>
               <tr>
                  <td colspan="4">합계</td>
                  <td> <!-- 시니어매출합계 -->
                     <c:out value="${sales_sum}"/>
                  </td> 
                  <td> <!-- 결제금액합계 -->
                     <c:out value="${cost_sum}"/>
                  </td> 
                  <%-- <td> <!-- 결제결제취소합계합계 -->
                     <c:out value="${costcancel_sum}"/>
                  </td --%> 
                  <td> <!-- 포인트사용합계 -->
                     <c:out value="${usepoint_sum}"/>
                  </td> 
                  <%-- <td> <!-- 포인트취소합계 -->
                     <c:out value="${usepointcancel_sum}"/>
                  </td> --%> 
                  <td> <!-- 정산수수료합계 -->
                     <c:out value="${comm_sum}"/>
                  </td> 
                  <td> <!-- 세금계산서 부가세합계-->
                     <c:out value="${surtaxsum}"/>
                  </td> 
               </tr>
            </tfoot>
         </table>
      </div>
   </div>
</body>
</html>