<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div>
      <h4 class="hs_Admin_BannerUpdate_Title">배너수정</h4>
      <form  method ="post" autocomplete="off" enctype="multipart/form-data" 
             action="${pageContext.request.contextPath}/todaylessonadmin/admin_banner_modifyresult"
             name="bannermodifyform">
         <input type="hidden" value="${adminBannerDatail.banner_no}" class="banner_no">
         <label>배너 유형</label>
		    <select name="banner_group" id="banner_group">
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
                  </c:choose>
		       </option>
		       <option value="0">Main Banner Slider</option>
		       <option value="1">Main Event Banner Slider</option>
		       <option value="2">Main Img Banner</option>
		    </select> 
         <label>이벤트명</label><br>
		    <input type="text" id="banner_title" name="banner_title" value="${adminBannerDatail.banner_title}" placeholder="배너명" required="required"/> <br>
         <label for="banner_filepath">배너수정</label>
            <input type="file" id="banner_filepath" name="file" style="width: 80px;" />
            <div class="Banner_img">
               <img src="${adminBannerDatail.banner_filepath}" />
            </div>   
            <script>
               $("#banner_filepath").change(function(){
                   if(this.files && this.files[0]) {
                     var reader = new FileReader;
                     reader.onload = function(data) {
                        $(".Banner_img img").attr("src", data.target.result).width(1000);        
                     }
                     reader.readAsDataURL(this.files[0]);
                   }
               });
            </script>
            <input type="button" id="hs_ad_bannerModifySubmitBtn" onclick="updatethumbnail();" value="배너수정"/>
            <input type="reset" value="수정취소">
            <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
            
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
</body>
</html>