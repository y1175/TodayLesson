$(document).ready(function(){
	$(".eventdetailupdatebtn").on('click',function(){
		
		var no = $(".event_no").val();
		location.href = "/todaylessonadmin/hm_ad_event_update/"+no;
		
	});
	
	$(".eventdetaildeletebtn").on('click',function(){
		

		if(confirm("이벤트를 삭제하시겠습니까?")){
			var no = $(".event_no").val();
			location.href="/todaylessonadmin/hm_ad_event_delete/"+no;
		}
	
		
	});
	

	
});