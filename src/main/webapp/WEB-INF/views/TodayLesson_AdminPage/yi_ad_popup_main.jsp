<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- CSSstyle -->
   <style type="text/css">
      .hs_ad_main_asidenav_nav_PopUp_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/yi_admin_popup_main.css?ver=1">
</head>
<body>
<div id="yi_container">
<h2>popup 관리</h2>

<div class="recent-popup"><h3>현재 등록된 팝업</h3></div>
 <img src="${dto1.popup_filepath }" class="popupimg" id="popupimg1" alt="popupimg"/>


<form role="form" method="post" autocomplete="off" enctype="multipart/form-data" action="/todaylessonadmin/popup_adminresult/1">
<div class="form-group">
<label for="popup_title1">팝업 타이틀</label>

<input class="form-control" type="text" name="popup_title" id="popup_title1" value="${dto1.popup_title }" required="required" aria-describedby="popup_title_tip">
<small id="popup_title_tip" class="form-text text-muted">상단에 표시되는 제목입니다.</small>
</div>

<div class="form-group">
<label for="popup_url1">연결되는 페이지URL</label>
<input class="form-control" type="text" name="popup_url" id="popup_url1" value="${dto1.popup_url }" required="required" aria-describedby="popup_url_tip">
<small id="popup_url_tip" class="form-text text-muted">팝업 클릭시 연결될 경로입니다.</small>
</div>

  <div class="form-group">
<label>사용여부</label>
<div class="form-check">
<input class="form-check-input popup_use" type="radio" name="popup_use" id="yes1" value="1">
<label class="form-check-label" for="yes1">예</label>
<input class="form-check-input popup_use" type="radio" name="popup_use"  id="no1" value="0">
<label class="form-check-label" for="no1">아니오</label>
</div>
</div>


<label>이미지 선택</label>
  <div class="form-group filebox">
     <label for="popup_thumbnail1">파일 선택</label>
    <input type="file" name="file" class="form-control-file" id="popup_thumbnail1">
  </div>

 <div class="select_img1"><img src="" />
 <script>
 if($('#popupimg1').attr("src")=="")
	 {
	 $('#popupimg1').attr("src",'http://localhost:8080/resources/imgUpload/2020/04/03/s/s_94c01447-a293-49ba-8bba-136824252ceb_popupdefault.png');
	 }
 if(${dto1.popup_use}==1)
	 {
	 $('#yes1').prop('checked',true);
	 }
 else
	 {
	 $('#no1').prop('checked',true);
	 }
 
  $("#popup_thumbnail1").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img1 img").attr("src", data.target.result).width(300);   
     console.log(data.target.result);
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>
 <div class="detailline"></div>
 </div>
<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
<div class="form-group">
<input type="submit" class="popup-submit-btn" value="팝업등록">
<input type="button" class="popup-delete-btn" value="팝업삭제" onclick="location.href='/todaylessonadmin/popup_admin_delete/1'">
</div>
</form>
</div>
</body>
</html>
