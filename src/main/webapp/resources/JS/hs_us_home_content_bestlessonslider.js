/* 레슨베스트  */
(function($) {
$.fn.extend({
	BLgScrollingCarousel: function(options) {

        var BLdefaults = {
            scrolling: true,
            amount: false
        };

        options = $.extend(BLdefaults, options);

        var BLsupportsTouch = false;

        if ('ontouchstart' in window){
            BLsupportsTouch = true;
            } else if(window.navigator.msPointerEnabled) {
            BLsupportsTouch = true;
            } else if ('ontouchstart' in document.documentElement) {
            BLsupportsTouch = true;
        }

        if (!BLsupportsTouch){
            var BLx,BLleft,BLdown,BLnewX,BLoldX,BLmaxScrollLeft,BLam,BLamX,BLamL,BLleftElem,BLrightElem,BLcurrx,BLitems,BLelement,BLelements;
            BLelement = $(this);
            if(options.amount == false) {
                amount = BLelement.children(":first").outerWidth(true);
            }else{
                amount = options.amount;
            }
            BLleftElem = $('<span />').addClass('bestlessonjc-left').html('<svg focusable="false" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"></path></svg>');
            BLrightElem = $('<span />').addClass('bestlessonjc-right').html('<svg focusable="false" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path></svg>');
            BLelement.parent().append(BLleftElem).append(BLrightElem);

            BLmaxScrollLeft = BLelement.get(0).scrollWidth - BLelement.get(0).clientWidth;
            BLleft = BLelement.scrollLeft();
            if(BLmaxScrollLeft == BLleft) {
                BLrightElem.hide();
            } else {
                BLrightElem.show();
            }
            if(BLleft == 0) {
                BLleftElem.hide();
            } else {
                BLleftElem.show();
            }

            if(options.scrolling){
                BLelement.bind("DOMMouseScroll mousewheel", function (event) {
                        var BLoEvent = event.originalEvent,
                        direction = BLoEvent.detail ? BLoEvent.detail * -amount : BLoEvent.wheelDelta,
                        position = BLelement.scrollLeft();
                    position += direction > 0 ? -amount : amount;

                    $(this).scrollLeft(position);
                    event.preventDefault();
                    BLmaxScrollLeft = BLelement.get(0).scrollWidth - BLelement.get(0).clientWidth;
                    BLleft = BLelement.scrollLeft();
                    if(BLmaxScrollLeft == BLleft) {
                        BLrightElem.fadeOut(200);
                    } else {
                        BLrightElem.fadeIn(200);
                    }
                    if(BLleft == 0) {
                        BLleftElem.fadeOut(200);
                    } else {
                        BLleftElem.fadeIn(200);
                    }

                });
            }
            BLelement.bind("mousedown", function(e){
                e.preventDefault();
                BLdown = true;
                BLx = e.pageX;
                BLleft = $(this).scrollLeft();
            }).bind("mousemove", function(e){
                if(BLdown){
                    if(e.pageX != BLx){
                        BLelement.addClass("nonclick");
                        BLnewX = e.pageX;
                        BLoldX = BLelement.scrollLeft();
                        BLelement.scrollLeft(BLleft-BLnewX+BLx);
                        BLmaxScrollLeft = BLelement.get(0).scrollWidth - BLelement.get(0).clientWidth;
                        if(BLmaxScrollLeft == BLoldX) {
                            BLrightElem.fadeOut(200);
                        } else {
                            BLrightElem.fadeIn(200);
                        }
                        if(BLoldX == 0) {
                            BLleftElem.fadeOut(200);
                        } else {
                            BLleftElem.fadeIn(200);
                        }
                    }
                } else {
                    BLelement.removeClass("nonclick");
                }
            });
            BLrightElem.bind("click", function(e){
              BLleftElem.fadeIn(200);
              BLitems = $(this).siblings(".hs_us_bestLesson_items");
              BLcurrx = BLitems.scrollLeft();
              BLamX = parseInt($(this).parent().width() / amount); // cantidad de BLelementos BLx viewport
              BLam = (BLamX * amount) - amount;
              BLmaxScrollLeft = BLitems.get(0).scrollWidth - BLitems.get(0).clientWidth;
              if(BLcurrx+BLam >= BLmaxScrollLeft) $(this).fadeOut(200);
              BLitems.animate( { scrollLeft: '+='+BLam }, 200);
            });
            BLleftElem.bind("click", function(e){
              BLrightElem.fadeIn(200);
              BLitems = $(this).siblings(".hs_us_bestLesson_items");
              BLcurrx = BLitems.scrollLeft();
              BLamX = parseInt($(this).parent().width() / amount); // cantidad de BLelementos BLx viewport
              BLam = (BLamX * amount) - amount;
              if(BLcurrx-BLam <= 0) $(this).fadeOut(200);
              BLitems.animate( { scrollLeft: '-='+BLam }, 200);
            });
            $(window).on('resize', function(){
                BLelement.each( function(){
                    BLelements = $(this);
                    BLmaxScrollLeft = BLelements.get(0).scrollWidth - BLelements.get(0).clientWidth;
                    BLleft = BLelements.scrollLeft();
                    if(BLmaxScrollLeft == BLleft) {
                        BLrightElem.fadeOut(200);
                    } else {
                        BLrightElem.fadeIn(200);
                    }
                    if(BLleft == 0) {
                        BLleftElem.fadeOut(200);
                    } else {
                        BLleftElem.fadeIn(200);
                    }
                });
            });
            $(document).on("mouseup mousedown click", ".nonclick a", function(e){  //prevent clicking while moving
              e.preventDefault();
            });
            $(document).on("mouseup", function(e){ //globally remove nonclicks onmouseup
                setTimeout(function(){
                    BLelement.removeClass("nonclick");
                    BLdown=false;
                },1);
            });
        }
    }
});
})(jQuery);