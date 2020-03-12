<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div>
      <h3>매출 현황</h3>
      <div>
         <form method="post" action="">
            <label>기간검색</label>
            <span>
               <label for="hs_sn_sales_enddate"></label>
               <input type="date" name="hs_sn_sales_startdate" id="hs_sn_sales_startdate" placeholder="YYYY-MM-DD">
               <label for="hs_sn_sales_enddate"></label>
               <input type="date" name="hs_sn_sales_enddate" id="hs_sn_sales_enddate" placeholder="YYYY-MM-DD">
               <input type="button" name="" id="" value="전체">
               <input type="button" name="" id="" value="오늘">
               <input type="button" name="" id="" value="일주일">
               <input type="button" name="" id="" value="1개월">
            </span>
            <span>
               <label>검색기준</label>
               <select name="" class="">
                  <option value="">전체</option>
                  <option value="">레슨명</option>
                  <option value="">구매자</option>
               </select> 
               <input type="text" id="" name="" placeholder="검색어를 입력해주세요">
               <input type="reset" id="" value="초기화">
               <input type="submit" id="" value="검색">
            </span>   
         </form>
      </div>
      <div>
      
      </div>
   </div>
</body>
</html>