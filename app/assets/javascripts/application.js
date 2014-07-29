// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function() {
    $(".plus").click(function(e) {
        e.preventDefault();
        var quantity = $(this).parent().find(".quantity");
        quantity.val(Number(quantity.val()) + 1);
    });

    $(".minus").click(function(e) {
        e.preventDefault();
        var quantity = $(this).parent().find(".quantity");
        if(+quantity.val() <= 0) {
            quantity.val(0);
        } else {
            quantity.val(+(quantity.val()) - 1);
        }
    });
});

$(document).ready(function() {
    setTimeout(function() {
        $('.alerts').fadeOut("slow");
    }, 1500);
});


$(document).ready(function() {
    function getUrlVars() {
        var vars = {};
        var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
            vars[key] = value;
        });
        return vars;
    }

    $('.order_id_field[title="'+getUrlVars()['o']+'"]').parents('tr').find('td').css('background-color', '#f7f786');
});




$(document).ready(function() {
    //rangebar start//
    function RangeBarFunc(th, mp) {
        //first load values
        this.loadvals = function() {
            $('.green-range-bar').find('.max-value').text($('.green-range-bar').attr('data-max'));
            $('.green-range-bar').find('.min-value').text($('.green-range-bar').attr('data-min'));
        }

        //ranging
        this.ranging = function() {
            //objects
            var rb = th.parent('.green-range-bar');
            var rbf = rb.find('.from');
            var rbt = rb.find('.to');
            var rbMin = rb.find('.min-value');
            var rbMax = rb.find('.max-value');
            var fildMin = $('#price_min');
            var fildMax = $('#price_max');
            var rbMinVal = Number(rb.attr('data-min'));
            var rbMaxVal = Number(rb.attr('data-max'));

            //positions
            var rbL = rb.offset().left;
            var rbW = rb.width();
            var rbfL = rbf.offset().left;
            var rbfP = 100 * ((rbfL - rbL) / rbW);
            var rbtL = rbt.offset().left;
            var rbtP = 100 * ((rbtL -rbL) / rbW);
            var rbCP = 100 * ((mp - rbL) / rbW);
            var addMinVal = 100 * (7 / rbW);
            //logic
            if(rbCP <= 0) rbCP = 0;
            else if(rbCP >= 100) rbCP = 100;
            if(th.is(rbf) && rbCP >= rbtP + addMinVal) rbCP = rbtP + addMinVal;
            else if(th.is(rbt) && rbCP <= rbfP + addMinVal) rbCP = rbfP + addMinVal;

            var currPrice = Math.round((rbCP * (rbMaxVal - rbMinVal) / 100) + rbMinVal);
            //output
            th.css('left', rbCP+'%');
            if(th.is(rbf)) { rbMin.text(currPrice); fildMin.val(currPrice); }
            if(th.is(rbt)) { rbMax.text(currPrice); fildMax.val(currPrice); }
        }
    }
    new RangeBarFunc().loadvals();
    $('.green-range-bar > .from, .green-range-bar > .to').mousedown(function(){
        var th = $(this);
        $('.green-range-bar > .from, .green-range-bar > .to').css('z-index', '10');
        th.css('z-index', '12');
        $(document).mousemove(function(e) {
            new RangeBarFunc(th, e.pageX).ranging();
        });
    });
    $(document).mouseup(function() {
        $(document).unbind('mousemove');
    });
    //rangebar end//

    //DropDown start//
    var exObj, H;
    $.prototype.editBox = function(obj) {
        H = $(this).is(exObj) ? H : $(obj).height();
        if($(obj).hasClass('opened')) {
            $(obj).css('height', H).stop().animate({height: 0}, 200, function() { $(this).css({'display': 'none', 'height': H}); $(obj).removeClass('opened'); });
        } else {
            $(obj).css('height', 0).css({'display': 'block'}).stop().animate({height: H}, 200, function() { $(this).css('height', H); $(obj).addClass('opened'); });
        }
        exObj = $(this);
    }
    //DropDown end//
});

$(document).ready(function() {
    var fadeSpeed = 1000;
    var clickSwitch = true;
    var imgCl = '.topSliderEach';
    var buttCl = '.topSliderButt';
    var buttId = 'topSliderButtHover';
    var imgCounter = $(imgCl).length;
    var currImg = 0;
    var lastImg;
    var fdInterval;




    $('#top-who-is').click(function(e) {
        e.preventDefault();
        $(this).editBox('.balanceDrop');
    });


    //append buttons
    var buttons = '';
    for(i = 0; i < imgCounter; i++) {
        buttons = (i == 0) ? buttons+'<span name="'+i+'" class="topSliderButt" id="'+buttId+'"></span>' : buttons+'<span name="'+i+'" class="topSliderButt"></span>';
    }
    $('#topSliderButtBar').html(buttons);

    //make first visible
    $(imgCl+':eq(0)').css({
        opacity: 1,
        display: 'block'
    });

    $(window).load(function() {
        $("#main-slider").css('height', $(imgCl).height());
    });

    //timeing functions
    function setInt() { //set timeing
        fdInterval = window.setInterval(function() {
            fadeImages(Number(currImg) + 1);
        }, 10000);
    }

    function clrInt() { //clear timeing
        window.clearInterval(fdInterval);
    }

    //fadeing function
    function fadeImages(imgNum) {
        if(clickSwitch) {
            lastImg = currImg;
            currImg = imgNum;
            if(currImg >= imgCounter) currImg = 0;

            if(lastImg != currImg) {
                //change hover button
                $(buttCl).removeAttr('id');
                $(buttCl+':eq('+currImg+')').attr('id', buttId);

                //change images
                $(imgCl+':eq('+lastImg+')').animate({opacity: 0}, fadeSpeed, function() {
                    $(imgCl+':eq('+lastImg+')').css('display', 'none');
                });
                $(imgCl+':eq('+currImg+')').css('display', 'block');
                $(imgCl+':eq('+currImg+')').animate({opacity: 1}, fadeSpeed, function(){
                    clickSwitch = true; setInt();
                });

                //window.alert('curr:'+currImg+' / Last:'+lastImg);

                clickSwitch = false;
                clrInt();
            }
        }
    }

    //fade by click
    $(buttCl).click(function() {
        fadeImages($(this).attr('name'));
    });

    //fade by timeing
    setInt();
});


$(document).ready(function() {
    $('#top-who-is').click(function(e) {
        e.preventDefault();
        $(this).editBox('.balanceDrop');
    });

    $('#edit-pass').click(function(e) {
        e.preventDefault();
        $(this).editBox('.edit-pass-remable');
    });

});


$(document).ready(function() {
       $('.alerts').click(function(){
        $(this).animate({opacity: 0}, 500, function() {
            $(this).css({'opacity': '1', 'display': 'none'});
        });
    });
});


$(document).ready(function() {
    $('#print-invoice').click(function() {
            var newCnt = document.getElementById('printable-content').innerHTML;
            var newWind = window.open('', '_blank');
            newWind.document.write('<div style="width: 960px; margin: 0 auto;"><h2 class="full-width float-left mt10px fs18px fbold">WunderKind.Ge</h2>'+newCnt+'</div>');
            newWind.print();
            newWind.close();
        });
});



// Home Slider


$(document).ready(function() {
    var fadeSpeed = 1000;
    var clickSwitch = true;
    var imgCl = '.topSliderEach';
    var buttCl = '.topSliderButt';
    var buttId = 'topSliderButtHover';
    var imgCounter = $(imgCl).length;
    var currImg = 0;
    var lastImg;
    var fdInterval;

    //append buttons
    var buttons = '';
    for(i = 0; i < imgCounter; i++) {
        buttons = (i == 0) ? buttons+'<span name="'+i+'" class="topSliderButt" id="'+buttId+'"></span>' : buttons+'<span name="'+i+'" class="topSliderButt"></span>';
    }
    $('#topSliderButtBar').html(buttons);

    //make first visible
    $(imgCl+':eq(0)').css({
        opacity: 1,
        display: 'block'
    });

    $(window).load(function() {
        $("#main-slider").css('height', $(imgCl).height());
    });

    //timeing functions
    function setInt() { //set timeing
        fdInterval = window.setInterval(function() {
            fadeImages(Number(currImg) + 1);
        }, 10000);
    }

    function clrInt() { //clear timeing
        window.clearInterval(fdInterval);
    }

    //fadeing function
    function fadeImages(imgNum) {
        if(clickSwitch) {
            lastImg = currImg;
            currImg = imgNum;
            if(currImg >= imgCounter) currImg = 0;

            if(lastImg != currImg) {
                //change hover button
                $(buttCl).removeAttr('id');
                $(buttCl+':eq('+currImg+')').attr('id', buttId);

                //change images
                $(imgCl+':eq('+lastImg+')').animate({opacity: 0}, fadeSpeed, function() {
                    $(imgCl+':eq('+lastImg+')').css('display', 'none');
                });
                $(imgCl+':eq('+currImg+')').css('display', 'block');
                $(imgCl+':eq('+currImg+')').animate({opacity: 1}, fadeSpeed, function(){
                    clickSwitch = true; setInt();
                });

                //window.alert('curr:'+currImg+' / Last:'+lastImg);

                clickSwitch = false;
                clrInt();
            }
        }
    }

    //fade by click
    $(buttCl).click(function() {
        fadeImages($(this).attr('name'));
    });

    //fade by timeing
    setInt();
});
