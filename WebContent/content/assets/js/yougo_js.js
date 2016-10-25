/* 
* @Author: anchen
* @Date:   2015-10-31 12:29:43
* @Last Modified by:   anchen
* @Last Modified time: 2015-11-06 18:18:14
*/

'use strict';
var ck=0;
$(function(){
    $('.true-address').hide();
    $('.order-up').hide();
    $($('.address-list')[0]).addClass('theme-orange-bg text-white');
    $($('.true-address')[0]).show();
    var adrid=$($('.address-list')[0]).parent().attr("addrvalue");
	$("#ipaddrid").val(adrid);
    $('.add-pro').hide();
    $('.order-down').show();
    var $searchInput = $('#searchInput');
    var k=1;
    $searchInput.on('click' ,function(){
        if(k==1){
            $searchInput.removeClass('search-mini');
            $searchInput.addClass('search-max');
            k=0;
        }else{
            $searchInput.removeClass('search-max');
            $searchInput.addClass('search-mini');
            k=1;
        }
    });
    animation_Show();
    address_Select();
    show_Select();
    select_Product();
    shop_Control();
})
function animation_Show(){
    $('#imgComputer').addClass('animate-computer');
    setTimeout(function(){
        $('#imgShopCart').addClass('animate-shopcart');
    }, 2000);
    setTimeout(function(){
        $('#imgMac').addClass('animate-Mac');
    },4000);
    setTimeout(function(){
        $('#imgIphone').addClass('animate-Iphone');
    },4500);
    setTimeout(function(){
        $('#imgIpad').addClass('animate-Ipad');
    },5000);
    setTimeout(function(){
        $('#imgMac').addClass('animate-goshop');
        setTimeout(function(){
            $('#imgIphone').addClass('animate-goshop');
            setTimeout(function(){
                $('#imgIpad').addClass('animate-goshop');
            },1000);
        },1000);
    },7000);
    setTimeout(function(){
        $('#imgTest').addClass('animate-text');
    },10000);
    setTimeout(function(){
        $('#imgComputer').addClass('animate-left');
        $('#imgShopCart').addClass('animate-left');
        $('#imgTest').addClass('animate-right');
        setTimeout(function(){
        $('#imgTest').addClass('animate-top');
    },1600);
    },12000);
}
function address_Select(){
    var $addressList = $('.address-list');
    var $trueaddress = $('.true-address');
    $addressList.each(function(index){
        $(this).on('click' ,function(){
        	var adrid=$($addressList[index]).parent().attr("addrvalue");
        	$("#ipaddrid").val(adrid);
            $(this).addClass('theme-orange-bg text-white');
            $trueaddress.eq(index).show();
            $addressList.each(function(ot){
                if(ot!==index){
                    $addressList.eq(ot).removeClass('theme-orange-bg text-white');
                    $trueaddress.eq(ot).hide();
                }
            });
        });
    });
}
function select_Product(){
	var $slpro = $('.sl-pro');
	var ck=0;
	$("#allselect").on("click" ,function(){
		if(ck==0){
	        $slpro.attr("checked",'true');
	        ck=1;
	    }
		else{
	        $slpro.removeAttr("checked");
	        ck=0;
	    }
	});
	    
}
function show_Select(){
    var $orderup = $('.order-up');
    var $orderdown = $('.order-down');
    var $addpro = $orderup.find('.add-pro');
    $orderup.each(function(index){
        $(this).on('click' ,function(){
            var listid = $(this).attr('listid');
            var prostr = '.add-pro' + listid;
            var up = '#up' + listid;
            var down = '#down' + listid;
            var $showlist = $(prostr);
            $(up).hide();
            $(down).show();
            $showlist.hide();
        });
    });
    $orderdown.each(function(index){
        $(this).on('click' ,function(){
            var listid = $(this).attr('listid');
            var prostr = '.add-pro' + listid;
            var up = '#up' + listid;
            var down = '#down' + listid;
            var $showlist = $(prostr);
            $(up).show();
            $(down).hide();
            $showlist.show();
        });
    });
}
function shop_Control(){
	var $numPro =$(".num-pro");
	$numPro.each(function(index){
		$(this).on("blur",function(){
			var pronum=$(".num-pro").eq(index).val();
			var scid=$(".num-pro").eq(index).attr("scid");
			var scnum=$(".num-pro").eq(index).attr("scnum");
			//alert(pronum);
			if(pronum!=scnum){
				if(pronum<=0){
					$(".num-pro").eq(index).val(scnum);
				}else{
					location.href="content/shopnum.jsp?scid="+scid+"&pnum="+pronum;
				}
			}
		 });
	});
	 
}