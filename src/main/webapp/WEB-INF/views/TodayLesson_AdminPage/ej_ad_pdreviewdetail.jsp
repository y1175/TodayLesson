<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="resources/JS/summernote-lite.js"></script>
<script src="resources/JS/summernote-ko-KR.js"></script>
<script>
$(document).ready(function(){
	
	var pdreview_no =${dto.pdreview_no};

	$("#pdreview_detail_deletebtn").on('click',function(){
		if(confirm("도배 또는 악성 후기인 경우 삭제합니다. 삭제하시겠습니까?")){
			location.href="${pageContext.request.contextPath}/todaylessonadmin/ad_product_reviewdelete/"+pdreview_no;
		}
	
		
	});
});
</script>
<style>
      #ej_container{
      width:80%;
      margin:0 auto;
      }
     .ej_btn{
border: 1px transparent;
padding: 5px 15px; 
background-color: rgb(224, 62, 82);
height:40px;
font-weight : 600;
font-size : 14px;
color: white;
float:right;

}
.ej_link{
color:black;}
.ej_link:hover{
color:black;
text-decoration: none;
}
</style>
</head>

<div id=ej_container>
<h2 style="text-align: center">후기 관리</h2><br>
<p style="color: rgb(224, 62, 82); text-align: center;">악성, 도배성 글 일 경우 삭제합니다.</p>
<b>리뷰번호</b> ${dto.pdreview_no }<br>
<b>상품번호</b> ${dto.product_no}<br>
<b>상품명</b> ${dto.product_name}<br>
<b>리뷰제목</b> ${dto.pdreview_title}<br>
<b>리뷰내용</b><br>
${dto.pdreview_content }<br>
<b>작성자</b> ${dto.member_id}<br>
<b>작성날짜</b> ${dto.pdreview_date}<br>


<button id="pdreview_detail_deletebtn" class="ej_btn">삭제</button>

</div>

</body>
</html>