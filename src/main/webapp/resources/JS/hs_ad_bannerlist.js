$(document).ready(function(){
	
	$('#hs_ad_bannerRegistrationrBtn').on('click',function(){
		
	location.href="/todaylessonadmin/admin_banner_registration";	
		
	});
	
    $(".hs_admin_bannerupdateBtn").on('click',function(){
		
		var banner_no = $(".banner_no").val();
		location.href = "/todaylessonadmin/admin_banner_modify/"+banner_no;
		
	});
	
	$(".hs_admin_bannerdeleteBtn").on('click',function(){
		

		if(confirm("배너를 삭제하시겠습니까?")){
			var banner_no = $(".banner_no").val();
			location.href="/todaylessonadmin/admin_banner_delete/"+banner_no;
		}
	
		
	});
	
});