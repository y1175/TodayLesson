$(document).ready(function(){
	
	$('#detailbutton').click(function(){
		
		let member_no =$(this).find('tr').eq(0).text();
		location.href="detail/"+member_no;
		
	});
});