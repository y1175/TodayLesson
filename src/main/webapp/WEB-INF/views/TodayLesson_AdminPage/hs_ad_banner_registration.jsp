<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>TodayLessonAdmin</title>
<!-- Banner JS -->
   <script src="${pageContext.request.contextPath}/resources/JS/hs_ad_banner_registration.js"></script>
<!-- Banner JS -->
</head>
<body>
   <div>
      <h4>배너 등록</h4>
      <div>
         <form role="form" method="post" autocomplete="off" enctype="multipart/form-data"
		       action="${pageContext.request.contextPath}/todaylessonadmin/admin_banner_registrationresult" 
		       name="bannerRegistrationFrm" id="bannerRegistrationFrm"> 
		    <label>이벤트명</label><br>
		       <input type="text" id="banner_title" name="banner_title" style="width: 40%;" placeholder="배너명" required="required"/> <br>
			<!-- <div class="inputArea">  ??? -->
            <label for="banner_filepath">썸네일</label>
               <input type="file" id="banner_filepath" name="file" />
               
            <div class="Banner_img">
               <img src="" />
            </div> 
 
            <script>
               $("#banner_filepath").change(function(){
                  if(this.files && this.files[0]) {
                     var reader = new FileReader;
                     reader.onload = function(data) {
                        $(".Banner_img img").attr("src", data.target.result).width(300);        
                     }
                   reader.readAsDataURL(this.files[0]);
                  }
               });
           </script>
            <input type="button" id="hs_ad_bannerRegistrationrSubmitBtn" value="배너등록"/>
           <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
	    </form>
	 </div>
   </div>
</body>
</html>