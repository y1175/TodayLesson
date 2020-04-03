<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<h2>popup 관리</h2>

<h3>팝업</h3>
 <img src="${dto1.popup_filepath }" id="popupimg1" alt="popupimg"/>
<form role="form" method="post" autocomplete="off" enctype="multipart/form-data"' action="/todaylessonadmin/popup_adminresult/1">
<label>팝업 타이틀</label>
<input type="text" name="popup_title" id="popup_title1" value="${dto1.popup_title }" required="required"><br>
<label>연결되는 페이지URL</label>
<input type="text" name="popup_url" id="popup_url1" value="${dto1.popup_url }" required="required"><br>
<label>사용여부</label>
<input type="radio" name="popup_use" class="popup_use" id="yes1" value="1"><label for="yes1">예</label>
<input type="radio" name="popup_use" class="popup_use" id="no1" value="0"><label for="no1">아니오</label><br>

<input type="file" id="popup_thumbnail1" name="file" />
 <br>
 <div class="select_img1"><img src="" /></div>
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
<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
<input type="submit" value="팝업등록">
<input type="button" value="팝업삭제" onclick="location.href='/todaylessonadmin/popup_admin_delete/1'">
</form>

</body>
</html>
