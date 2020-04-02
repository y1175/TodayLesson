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

<h3>팝업1</h3>
<form action="/todaylessonadmin/popup_adminresult/1">
<label>팝업 타이틀</label>
<input type="text" name="popup_title" id="popup_title1" placeholder="${dto1.popup_title }" required="required"><br>
<label>연결되는 페이지URL</label>
<input type="text" name="popup_url" id="popup_url1" placeholder="${dto1.popup_url }" required="required"><br>
<label>사용여부</label>
<input type="radio" name="popup_use" class="popup_use" id="yes1" value="1"><label for="yes1">예</label>
<input type="radio" name="popup_use" class="popup_use" id="no1" value="0"><label for="no1">아니오</label><br>

<input type="file" id="event_thumbnail1" name="file" placeholder="${dto1.popup_filepath }" />
 <br>
 <div class="select_img1"><img src="" /></div>
 <img src="${dto1.popup_filepath }" />
 <script>
 if(${dto1.popup_use}==1)
	 {
	 $('#yes1').prop('checked',true);
	 }
 else
	 {
	 $('#no1').prop('checked',true);
	 }
 
  $("#event_thumbnail1").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img1 img").attr("src", data.target.result).width(300);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>

<input type="submit" value="팝업등록">
<input type="button" value="팝업삭제" onclick="location.href='/todaylessonadmin/popup_admin_delete/1'">
</form>

<h3>팝업2</h3>
<form action="/todaylessonadmin/popup_adminresult/2">
<label>팝업 타이틀</label>
<input type="text" name="popup_title" id="popup_title" placeholder="${dto2.popup_title }"><br>
<label>연결되는 페이지URL</label>
<input type="text" name="popup_url" id="popup_url" placeholder="${dto2.popup_url }"><br>
<label>사용여부</label>
<input type="radio" name="popup_use" class="popup_use" id="yes2" value="1"><label for="yes2">예</label>
<input type="radio" name="popup_use" class="popup_use" id="no2" value="0"><label for="no2">아니오</label><br>

<input type="file" id="event_thumbnail2" name="file" />
 <br>
 <div class="select_img2"><img src="" /></div>
 
 <script>
 if(${dto2.popup_use}==1)
 {
 $('#yes2').prop('checked',true);
 }
else
 {
 $('#no2').prop('checked',true);
 }
  $("#event_thumbnail2").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img2 img").attr("src", data.target.result).width(300);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>

<input type="submit" value="등록">
<input type="button" value="팝업삭제" onclick="location.href='/todaylessonadmin/popup_admin_delete/2'">
</form>

<h3>팝업3</h3>
<form action="/todaylessonadmin/popup_adminresult/3">
<label>팝업 타이틀</label>
<input type="text" name="popup_title" id="popup_title3" placeholder="${dto3.popup_title }"><br>
<label>연결되는 페이지URL</label>
<input type="text" name="popup_url" id="popup_url3" placeholder="${dto3.popup_url }"><br>
<label>사용여부</label>
<input type="radio" name="popup_use" class="popup_use" id="yes3" value="1"><label for="yes3">예</label>
<input type="radio" name="popup_use" class="popup_use" id="no3" value="0"><label for="no3">아니오</label><br>

<input type="file" id="event_thumbnail3" name="file" />
 <br>
 <div class="select_img3"><img src="" /></div>
 
 <script>
 if(${dto3.popup_use}==1)
 {
 $('#yes3').prop('checked',true);
 }
else
 {
 $('#no3').prop('checked',true);
 }
 
  $("#event_thumbnail3").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img3 img").attr("src", data.target.result).width(300);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>

<input type="submit" value="등록">
<input type="button" value="팝업삭제" onclick="location.href='/todaylessonadmin/popup_admin_delete/3'">
</form>
</body>
</html>
