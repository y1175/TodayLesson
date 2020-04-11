<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- CSSstyle --> 
   <link rel ="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hs_ad_banner_modify.css?ver=1">
   <style type="text/css">
      .hs_ad_main_asidenav_nav_Banner_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle -->

</head>
<body>
   <div class="hs_Admin_BannerModify">
      <h2 class="hs_Admin_BannerModify_Title">배너수정</h2>
      <div class="hs_ad_BannerModify_Line"></div>
      <div class="" style="width: 100%;">  
         <form  method ="post" autocomplete="off" enctype="multipart/form-data" class="row"
                action="${pageContext.request.contextPath}/todaylessonadmin/admin_banner_modifyresult"
                name="bannermodifyform">
            <input type="hidden" name="banner_no" value="${adminBannerDatail.banner_no}" class="banner_no">
            <div class="col-md-12" style="margin-bottom: 20px;">
               <div class="col-sm-1" style="font-size: 15px;"> 
                  <label>배너유형</label>
               </div>
               <div class="col-sm-11">
		       <select name="banner_group" id="banner_group" class="form-control">
		          <option value="${adminBannerDatail.banner_group}">
		                <c:choose>
                           <c:when test="${adminBannerDatail.banner_group eq '0'}">
                              <c:out value="Main Banner Slider"/>
                           </c:when> 
                           <c:when test="${adminBannerDatail.banner_group eq '1'}">
                              <c:out value="Main Event Banner Slider"/>
                           </c:when>
                           <c:when test="${adminBannerDatail.banner_group eq '2'}">
                              <c:out value="Main Img Banner"/>
                           </c:when>
                             <c:when test="${adminBannerList.banner_group eq '3'}">
                           <c:out value="Event Main Banner Slider"/>
                     		</c:when>
                     		<c:when test="${adminBannerList.banner_group eq '4'}">
                        	<c:out value="Store Main Banner Slider"/>
                     		</c:when>
                      		<c:when test="${adminBannerList.banner_group eq '5'}">
                       		 <c:out value="Ealry Bird Main"/>
                     		</c:when>
                      		<c:when test="${adminBannerList.banner_group eq '6'}">
                      		  <c:out value="Ealry Bird Mini Banner"/>
                     		</c:when>
                        		</c:choose>
		             </option>
		             <option value="0">Main Banner Slider</option>
		             <option value="1">Main Event Banner Slider</option>
		             <option value="2">Main Img Banner</option>
		             <option value="3">Event Main Banner Slider</option>
		             <option value="4">Store Main Banner Slider</option>
		             <option value="5">Ealry Bird Main</option>
		             <option value="6">Ealry Bird Mini Banner</option>
		          </select>
		       </div> 
		    </div>
		    <div class="col-md-12" style="margin-bottom: 20px;">
		       <div class="col-sm-1" style="font-size: 15px;">   
                  <label>배너이름</label>
		       </div>
		       <div class="col-sm-11">
		          <input type="text" id="banner_title" name="banner_title" value="${adminBannerDatail.banner_title}" class="form-control" required="required"/>
		       </div>
		    </div>
		    <div class="col-md-12">
		       <div class="col-sm-1" style="font-size: 15px;">
		          <label for="banner_filepath">파일수정</label>
		       </div>
		       <div class="col-sm-11">
		          <i class="material-icons" style="font-size: 30px;">&#xe439;</i>
		          <input type="file" id="banner_filepath" name="file"   class="custom-file-input"  style="width: 80px; position: relative; bottom: 22px;" />
		       </div>
		    </div>      
            <div class="col-md-12" style="margin-bottom: 20px; margin-top: -15px;">   
               <div class="col-sm-1" style="font-size: 15px;">
		          <label for="banner_filepath">배너이미지</label>
		       </div>
		       <div class="col-sm-11">
		          <div class="Banner_imgmodify">
                     <img src="${adminBannerDatail.banner_filepath}" style="padding: 50px;"/>
                  </div> 
		       </div>
            </div>
            
            <script>
               $("#banner_filepath").change(function(){
                   if(this.files && this.files[0]) {
                     var reader = new FileReader;
                     reader.onload = function(data) {
                        $(".Banner_imgmodify img").attr("src", data.target.result).wisdth(1000);        
                     }
                     reader.readAsDataURL(this.files[0]);
                   }
               });
            </script>
            <div class="col-md-12" style="text-align: center;">
               <input type="button" id="hs_ad_bannerModifySubmitBtn" onclick="updatethumbnail();" value="배너수정"/>
               <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
            </div>
            
            <script>
              function updatethumbnail(){
	  
                  var updateform = document.bannermodifyform;  
	              var thumbnail =  updateform.file.value;
                  var newthumbnail = document.getElementById('banner_filepath');
	                 console.log(thumbnail);
	                 console.log(newthumbnail);
	                if(thumbnail==null){
		                 newthumbnail.disabled = true;
		                 console.log(newthumbnail);
		                 updateform.submit();
	                }else{
	                	 updateform.submit();	
                 	}
               } 
            </script>
      </form>
      </div>
   </div>
</body>
</html>