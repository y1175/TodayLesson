$(document).ready(function(){
	
	$('.detailbutton').click(function(){

		var str = "";
		var tdArr = new Array();
		var checkBtn = $(this);
		
		var tr = checkBtn.parent().parent();
		var td = tr.children();
		
		var no = td.eq(0).text();
		
		location.href="hm_memmanagedetail/"+no;
		
	});
});