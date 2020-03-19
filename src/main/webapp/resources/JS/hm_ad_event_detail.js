$(document).ready(function(){
	$(".eventdetailupdatebtn").on('click',function(){
		
		var no = $(".event_no").val();
		location.href = "/hm_ad_event_update/"+no;
		
	});
});