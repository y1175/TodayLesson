<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>TodayLessonAdmin</title>

<!-- CSSstyle --> 
   <link rel ="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hs_ad_banner_registration.css?ver=1">
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
      <h4 class="hs_Admin_BannerRegistration_Title">배너 등록</h4>
      <div class="hs_ad_BannerRegistration_Line"></div>  
      <div class="" style="width: 100%;">
         <form role="form" method="post" autocomplete="off" enctype="multipart/form-data" class="row"
		       action="${pageContext.request.contextPath}/todaylessonadmin/admin_banner_registrationresult" 
		       name="bannerRegistrationFrm" id="bannerRegistrationFrm"> 
		    <div class="col-md-12">
		       <div class="col-sm-1">
		          <label>배너 유형</label>
		       </div>
		       <div class="col-sm-11">
		          <select name="banner_group" id="banner_group" class="form-control">
		             <option value="">유형을 선택해주세요</option>
		             <option value="0">Main Banner Slider</option>
		             <option value="1">Main Event Banner Slider</option>
		             <option value="2">Main Img Banner</option>
		          </select>
		       </div>      
		    </div>
		    <div class="col-md-12">
		       <div class="col-sm-1">
		          <label>이벤트명</label>
		       </div>
		       <div class="col-sm-11">
		          <input type="text" id="banner_title" name="banner_title" class="form-control" placeholder="배너이름을 입력해주세요." required="required"/>
		       </div>
		    </div>
		    <div class="col-md-12">
		       <div class="col-sm-1">
		          <label for="banner_filepath">파일첨부</label>
		       </div>
		       <div class="col-sm-11">
		          <input type="file" id="banner_filepath" name="file" />
		       </div>
		    </div>
            
            <div  class="col-md-12">   
               <div class="col-sm-1">
		          <label for="banner_filepath">배너이미지</label>
		       </div>
               <div class="Banner_img">
                  <img src="" />
               </div> 
            </div>
 
            <script>
               $("#banner_filepath").change(function(){
                  if(this.files && this.files[0]) {
                     var reader = new FileReader;
                     reader.onload = function(data) {
                        $(".Banner_img img").attr("src", data.target.result).width(1000);   //등록할때 화면에 보이는크기     
                     }
                   reader.readAsDataURL(this.files[0]);
                  }
               });
           </script>
           <div class="col-md-12">
           <input type="button" id="hs_ad_bannerRegistrationrSubmitBtn" value="배너등록"/>
           <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
           </div>
	    </form>
	 </div>
   </div>
</body>
</html>