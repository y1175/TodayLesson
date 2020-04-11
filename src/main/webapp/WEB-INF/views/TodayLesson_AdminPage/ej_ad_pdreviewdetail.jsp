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
   .hs_ad_main_asidenav_nav_ProductReview_Title>a{
         color: rgb(224, 62, 82);
      }
      #ej_container{
      width:80%;
      margin:0 auto;
      margin-top:40px;
      }
     .ej_btn{
border: 1px transparent;
padding: 5px 15px; 
background-color: rgb(224, 62, 82);
height:40px;
font-weight : 600;
font-size : 14px;
color: white;

}
.ej_link{
color:black;}
.ej_link:hover{
color:black;
text-decoration: none;
}
#ej_right{
float:right;}

/*페이지버튼 중앙정렬*/
.paging{
	width:100%;
	text-align:center;
	margin-bottom: 30px;
	margin-left: -30px;
}
.paginginside{
	display:inline-block;
}


/*page*/
.pagination .page-link:focus{
    box-shadow: none;
}
.pagination>.page-item>.page-link, .pagination>.page-item>span {
    border: 0;
    border-radius: 30px!important;
    transition: all .3s;
    padding: 0 11px !important;
    margin: 0 3px !important;
    min-width: 30px;
    height: 30px;
    line-height: 30px;
    color: #999;
    font-weight: 400;
    font-size: 12px;
    text-transform: uppercase;
    background: 0 0;
    text-align: center;
}

.pagination>.page-item.active>a, .pagination>.page-item.active>a:focus, .pagination>.page-item.active>a:hover, .pagination>.page-item.active>span, .pagination>.page-item.active>span:focus, .pagination>.page-item.active>span:hover {
    background-color: #9c27b0;
    border-color: #9c27b0;
    color: #fff;
    box-shadow: 0 4px 5px 0 rgba(156,39,176,.14), 0 1px 10px 0 rgba(156,39,176,.12), 0 2px 4px -1px rgba(156,39,176,.2);
}


.pagination.pagination-info>.page-item.active>a, .pagination.pagination-info>.page-item.active>a:focus, .pagination.pagination-info>.page-item.active>a:hover, .pagination.pagination-info>.page-item.active>span, .pagination.pagination-info>.page-item.active>span:focus, .pagination.pagination-info>.page-item.active>span:hover {
    background-color: #00bcd4;
    border-color: #00bcd4;
    box-shadow: 0 4px 5px 0 rgba(0,188,212,.14), 0 1px 10px 0 rgba(0,188,212,.12), 0 2px 4px -1px rgba(0,188,212,.2);
}


.pagination.pagination-success>.page-item.active>a, .pagination.pagination-success>.page-item.active>a:focus, .pagination.pagination-success>.page-item.active>a:hover, .pagination.pagination-success>.page-item.active>span, .pagination.pagination-success>.page-item.active>span:focus, .pagination.pagination-success>.page-item.active>span:hover {
    background-color: #4caf50;
    border-color: #4caf50;
    box-shadow: 0 4px 5px 0 rgba(76,175,80,.14), 0 1px 10px 0 rgba(76,175,80,.12), 0 2px 4px -1px rgba(76,175,80,.2);
}

.pagination.pagination-warning>.page-item.active>a, .pagination.pagination-warning>.page-item.active>a:focus, .pagination.pagination-warning>.page-item.active>a:hover, .pagination.pagination-warning>.page-item.active>span, .pagination.pagination-warning>.page-item.active>span:focus, .pagination.pagination-warning>.page-item.active>span:hover {
    background-color: #ff9800;
    border-color: #ff9800;
    box-shadow: 0 4px 5px 0 rgba(255,152,0,.14), 0 1px 10px 0 rgba(255,152,0,.12), 0 2px 4px -1px rgba(255,152,0,.2);
}

.pagination.pagination-danger>.page-item.active>a, .pagination.pagination-danger>.page-item.active>a:focus, .pagination.pagination-danger>.page-item.active>a:hover, .pagination.pagination-danger>.page-item.active>span, .pagination.pagination-danger>.page-item.active>span:focus, .pagination.pagination-danger>.page-item.active>span:hover {
    background-color: #f44336;
    border-color: #f44336;
    box-shadow: 0 4px 5px 0 rgba(244,67,54,.14), 0 1px 10px 0 rgba(244,67,54,.12), 0 2px 4px -1px rgba(244,67,54,.2);
}

      #ej_container{
      width:80%;
      margin:0 auto;
/*       text-align: center; */
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
<h2 style="text-align: center"><b>후기 관리</b></h2><br>
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