

//곧 마감 얼리버드 레슨


//레슨슬라이더(마감)
(function($) {
	    $.fn.extend({
	        ELgScrollingCarousel: function(options) {

	            var ELdefaults = {
	                scrolling: true,
	                amount: false
	            };

	            options = $.extend(ELdefaults, options);

	            var ELsupportsTouch = false;

	            if ('ontouchstart' in window){
	            	ELsupportsTouch = true;
	                } else if(window.navigator.msPointerEnabled) {
	                	ELsupportsTouch = true;
	                } else if ('ontouchstart' in document.documentElement) {
	                	ELsupportsTouch = true;
	            }

	            if (!ELsupportsTouch){
	                var ELx,ELleft,ELdown,ELnewX,ELoldX,ELmaxScrollLeft,ELam,ELamX,ELamL,ELleftElem,ELrightElem,ELcurrx,ELitems,ELelement,ELelements;
	                ELelement = $(this);
	                if(options.amount == false) {
	                    amount = ELelement.children(":first").outerWidth(true);
	                }else{
	                    amount = options.amount;
	                }
	                ELleftElem = $('<span />').addClass('ELjc-left').html('<svg focusable="false" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"></path></svg>');
	                ELrightElem = $('<span />').addClass('ELjc-right').html('<svg focusable="false" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path></svg>');
	                ELelement.parent().append(ELleftElem).append(ELrightElem);

	                ELmaxScrollLeft = ELelement.get(0).scrollWidth - ELelement.get(0).clientWidth;
	                ELleft = ELelement.scrollLeft();
	                if(ELmaxScrollLeft == ELleft) {
	                	ELrightElem.hide();
	                } else {
	                	ELrightElem.show();
	                }
	                if(ELleft == 0) {
	                	ELleftElem.hide();
	                } else {
	                	ELleftElem.show();
	                }

	                if(options.scrolling){
	                    ELelement.bind("DOMMouseScroll mousewheel", function (event) {
	                            var ELoEvent = event.originalEvent,
	                            direction = ELoEvent.detail ? ELoEvent.detail * -amount : ELoEvent.wheelDelta,
	                            position = ELelement.scrollLeft();
	                        position += direction > 0 ? -amount : amount;

	                        $(this).scrollLeft(position);
	                        event.preventDefault();
	                        ELmaxScrollLeft = ELelement.get(0).scrollWidth - ELelement.get(0).clientWidth;
	                        ELleft = ELelement.scrollLeft();
	                        if(ELmaxScrollLeft == ELleft) {
	                        	ELrightElem.fadeOut(200);
	                        } else {
	                        	ELrightElem.fadeIn(200);
	                        }
	                        if(ELleft == 0) {
	                        	ELleftElem.fadeOut(200);
	                        } else {
	                        	ELleftElem.fadeIn(200);
	                        }

	                    });
	                }
	                ELelement.bind("mousedown", function(e){
	                    e.preventDefault();
	                    ELdown = true;
	                    ELx = e.pageX;
	                    ELleft = $(this).scrollLeft();
	                }).bind("mousemove", function(e){
	                    if(ELdown){
	                        if(e.pageX != ELx){
	                        	ELelement.addClass("nonclick");
	                        	ELnewX = e.pageX;
	                        	ELoldX = ELelement.scrollLeft();
	                        	ELelement.scrollLeft(ELleft-ELnewX+ELx);
	                        	ELmaxScrollLeft = ELelement.get(0).scrollWidth - ELelement.get(0).clientWidth;
	                            if(ELmaxScrollLeft == ELoldX) {
	                            	ELrightElem.fadeOut(200);
	                            } else {
	                            	ELrightElem.fadeIn(200);
	                            }
	                            if(ELoldX == 0) {
	                            	ELleftElem.fadeOut(200);
	                            } else {
	                            	ELleftElem.fadeIn(200);
	                            }
	                        }
	                    } else {
	                    	ELelement.removeClass("nonclick");
	                    }
	                });
	                ELrightElem.bind("click", function(e){
	                	ELleftElem.fadeIn(200);
	                	ELitems = $(this).siblings(".hm_us_endlesson_items");
	                	ELcurrx = ELitems.scrollLeft();
	                	ELamX = parseInt($(this).parent().width() / amount); // cantidad de elementos x viewport
	                	ELam = (ELamX * amount) - amount;
	                	ELmaxScrollLeft = ELitems.get(0).scrollWidth - ELitems.get(0).clientWidth;
	                  if(ELcurrx+ELam >= ELmaxScrollLeft) $(this).fadeOut(200);
	                  ELitems.animate( { scrollLeft: '+='+ELam }, 200);
	                });
	                ELleftElem.bind("click", function(e){
	                	ELrightElem.fadeIn(200);
	                	ELitems = $(this).siblings(".hm_us_endlesson_items");
	                	ELcurrx = ELitems.scrollLeft();
	                	ELamX = parseInt($(this).parent().width() / amount); // cantidad de elementos x viewport
	                	ELam = (ELamX * amount) - amount;
	                  if(ELcurrx-ELam <= 0) $(this).fadeOut(200);
	                  ELitems.animate( { scrollLeft: '-='+ELam }, 200);
	                });
	                $(window).on('resize', function(){
	                	ELelement.each( function(){
	                		ELelements = $(this);
	                		ELmaxScrollLeft = ELelements.get(0).scrollWidth - ELelements.get(0).clientWidth;
	                		ELleft = ELelements.scrollLeft();
	                        if(ELmaxScrollLeft == ELleft) {
	                        	ELrightElem.fadeOut(200);
	                        } else {
	                        	ELrightElem.fadeIn(200);
	                        }
	                        if(ELleft == 0) {
	                        	ELleftElem.fadeOut(200);
	                        } else {
	                        	ELleftElem.fadeIn(200);
	                        }
	                    });
	                });
	                $(document).on("mouseup mousedown click", ".nonclick a", function(e){  //prevent clicking while moving
	                  e.preventDefault();
	                });
	                $(document).on("mouseup", function(e){ //globally remove nonclicks onmouseup
	                    setTimeout(function(){
	                    	ELelement.removeClass("nonclick");
	                        ELdown=false;
	                    },1);
	                });
	            }
	        }
	    });
	})(jQuery);
