<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
         <form method="post" action="">
            <label>기간검색</label>
            <div>
               <label for="hs_sn_sales_enddate"></label>
               <input type="date" name="hs_sn_sales_startdate" id="hs_sn_sales_startdate" placeholder="YYYY-MM-DD">
               <label for="hs_sn_sales_enddate"></label>
               <input type="date" name="hs_sn_sales_enddate" id="hs_sn_sales_enddate" placeholder="YYYY-MM-DD">
               <input type="button" name="" id="" value="전체">
               <input type="button" name="" id="" value="오늘">
               <input type="button" name="" id="" value="일주일">
               <input type="button" name="" id="" value="1개월">
            </div>
            <label>검색기준</label>
            <div>   
               <label for=""></label>
               <select name="" class="">
                  <option value="">전체</option>
                  <option value="">레슨명</option>
                  <option value="">구매자</option>
               </select> 
               <input type="text" id="" name="" placeholder="검색어를 입력해주세요">
            </div>
            <div>
               <input type="reset" id="" value="초기화">
               <input type="submit" id="" value="검색">
            </div>
            <div>
               <select name="" class="">
                  <option value="">전체</option>
                  <option value="">신청완료</option>
                  <option value="">결제대기</option>
                  <option value="">결제완료</option>
                  <option value="">결제취소</option>
               </select>
               <button>엑셀다운로드</button>
            </div>            
         </form>
      </div>     
      <div>
         <table class="hs_sn_sales_table">
            <thead>
               <tr>
                  <th rowspan="2">NO.</th>
                  <th rowspan="2">결제상태</th>
                  <th rowspan="2">레슨번호</th>
                  <th rowspan="2">레슨명</th>
                  <th rowspan="2">구매일</th>
                  <th rowspan="2">구매자</th>
                  <th rowspan="2">시니어매출</th>
                  <th colspan="6">관리</th>
               </tr>
               <tr>
                  <th>결제금액</th>   
                  <th>포인트사용</th>
                  <th>취소금액</th>
                  <th>포인트취소</th>
                  <th>정산수수료</th>
                  <th>세금계산서부가세</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td>1</td>
                  <td>1</td>
                  <td>1</td>
                  <td>1</td>
                  <td>1</td>
                  <td>1</td>
                  <td>1</td>
                  <td>1</td>
                  <td>1</td>
                  <td>1</td>
                  <td>1</td>
                  <td>1</td>
                  <td>1</td>
               </tr>
            </tbody>
            <tfoot>
               <tr>
                  <td colspan="6">합계</td>
                  <td>2</td>
                  <td>2</td>
                  <td>2</td>
                  <td>2</td>
                  <td>2</td>
                  <td>2</td>
                  <td>2</td>
               </tr>
            </tfoot>
         </table>
      </div>
   </div>
</body>
</html>