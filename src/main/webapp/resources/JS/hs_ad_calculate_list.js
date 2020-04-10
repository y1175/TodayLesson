$(document).ready(function(){
   $(".hs_admin_calculate_Btn").on('click',function(){
		

		if(confirm("정산지급하시겠습니까?")){
			var calculate_no = $(".calculate_no").val();
			location.href="/todaylessonadmin/admin_calculate_give/"+calculate_no;
		}
	
		
	});
	
});
	


