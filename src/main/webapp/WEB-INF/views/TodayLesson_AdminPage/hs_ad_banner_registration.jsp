<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>TodayLessonAdmin</title>

<!-- CSSstyle --> 
   <link rel ="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hs_ad_banner_registration.css?ver=2">
   <style type="text/css">
      .hs_ad_main_asidenav_nav_Banner_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle -->

<!-- Banner JS -->
   <script src="${pageContext.request.contextPath}/resources/JS/hs_ad_banner_registration.js"></script>
<!-- Banner JS -->

</head>
<body>
   <div class="hs_Admin_BannerRegistration">
      <h2 class="hs_Admin_BannerRegistration_Title">배너등록</h2>
      <div class="hs_ad_BannerRegistration_Line"></div>  
      <div class="" style="width: 100%;">
         <form role="form" method="post" autocomplete="off" enctype="multipart/form-data" class="row"
		       action="${pageContext.request.contextPath}/todaylessonadmin/admin_banner_registrationresult" 
		       name="bannerRegistrationFrm" id="bannerRegistrationFrm"> 
		    <div class="col-md-12" style="margin-bottom: 20px;">
		       <div class="col-sm-1" style="font-size: 15px;">
		          <label>배너유형</label>
		       </div>
		       <div class="col-sm-11">
		          <select name="banner_group" id="banner_group" class="form-control">
		             <option value="">유형을 선택해주세요</option>
		             <option value="0">Main Banner Slider</option>
		             <option value="1">Main Event Banner Slider</option>
		             <option value="2">Main Img Banner</option>
		             <option value="3">Event Main Banner Slider</option>
		              <option value="4">Store Main Banner Slider</option>
		          </select>
		       </div>      
		    </div>
		    <div class="col-md-12" style="margin-bottom: 20px;">
		       <div class="col-sm-1" style="font-size: 15px;">
		          <label>배너이름</label>
		       </div>
		       <div class="col-sm-11">
		          <input type="text" id="banner_title" name="banner_title" class="form-control" placeholder="배너이름을 입력해주세요." required="required"/>
		       </div>
		    </div>
		    <div class="col-md-12">
		       <div class="col-sm-1" style="font-size: 15px;">
		          <label for="banner_filepath">파일첨부</label>
		       </div>
		       <div class="col-sm-11">
		          <i class="material-icons" style="font-size: 30px;">&#xe439;</i>
		          <input type="file" id="banner_filepath" name="file"  class="custom-file-input" style="position: relative; bottom: 22px;" />
		       </div>
		    </div>
            <div  class="col-md-12" style="margin-bottom: 20px; margin-top: -15px;">   
               <div class="col-sm-1" style="font-size: 15px;">
		          <label for="banner_filepath">배너이미지</label>
		       </div>
		       <div class="col-sm-11">
                  <div class="Banner_imgRegistration">
                     <img src="" style="padding: 50px;" />
                  </div>
               </div> 
            </div>
 
            <script>
               $("#banner_filepath").change(function(){
                  if(this.files && this.files[0]) {
                     var reader = new FileReader;
                     reader.onload = function(data) {
                        $(".Banner_imgRegistration img").attr("src", data.target.result).width(1000);   //등록할때 화면에 보이는크기     
                     }
                   reader.readAsDataURL(this.files[0]);
                  }
               });
           </script>
           <div class="col-md-12" style="text-align: center;">
              <input type="button" id="hs_ad_bannerRegistrationrSubmitBtn" value="배너등록"/>
              <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
           </div>
	    </form>
	 </div>
   </div>
</body>
</html>