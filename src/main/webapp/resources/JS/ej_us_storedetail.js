/*$(document).ready(function(){ 
	
	//페이지 열자마자 스크롤이 맨위가게함
	$('html, body').animate({
		scrollTop: $('html').offset().top
	}, 'slow');
	
	
	관련상품카르셀  
	var owl = $('.owl-carousel');
	owl.owlCarousel({
	    items:4,
	    loop:true,
	    margin:10,
	    nav: true, 
	    autoplay:true,
	    autoplayTimeout:1000,
	    autoplayHoverPause:true 
	});
	
	 $('.owl-carousel').owlCarousel();
	
	//후기
	 $(".reviewCon").slideUp();

	 $(".reviewTitle").click(function(){
	 	console.log(this);
	 	//전체 댓글내용 다보이니까
	 	//this 의 내용만 보이도록 수정하기
	 	 $(".reviewCon").toggle(); 
	 	$(this).next.(".reviewCon").slideToggle(100);
	 }); 
	
	
	
	
});*/