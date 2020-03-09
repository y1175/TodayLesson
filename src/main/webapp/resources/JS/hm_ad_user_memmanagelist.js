$(document).ready(function(){
	
	$('.detailbutton').click(function(){
		
		/*let no =$(this).parent().children().children().find('span').eq(0).text();*/
		/*let no = $(this).parent().find('td').find('span').eq(0).text();*/
		let no = $('.detailno').html();
		console.log(no);
		location.href="hm_memmanagedetail/"+no;
		
	});
});