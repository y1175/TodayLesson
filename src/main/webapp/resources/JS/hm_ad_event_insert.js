$(document).ready(function(){
	
	$("#hm_ad_event_insertbtn").on('click',function(){
		
		var group = document.getElementById("event_group").value;
		
		if(group == "")
			{
			alert("이벤트 유형을 선택해주세요.");
			document.getElementById("event_group").focus();
			return false;
			}else{
				document.eventinsertfrm.submit();
			}
		
	});
});