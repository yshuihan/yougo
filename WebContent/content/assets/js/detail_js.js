/* 
* @Author: anchen
* @Date:   2015-10-04 12:17:44
* @Last Modified by:   anchen
* @Last Modified time: 2015-11-06 18:51:11
*/
'use strict';
$(function(){
	var listst = $('.style-list');
	$(listst[0]).removeClass('border-mydark-blod');
	$(listst[0]).addClass('border-green-blod');
	var lsstlid=$(listst[0]).attr("styleValue");
	$("#iptStid").val(lsstlid);
    num_Add();
    num_Minus();
    images_Show();
    select_Style();
    swiper_Show();
    url_Contrl();
})
function url_Contrl() {
	var tabtp = getUrlParam('tabtp');
	if(tabtp!=null && tabtp=="evaluation"){
		$('#tbdetail').removeClass('active');
		$('#tbevaluation').addClass('active');
		$('#detail').removeClass('in active');
		$('#evaluation').addClass('in active');
	}else{
		$('#tbdetail').addClass('active');
		$('#tbevaluation').removeClass('active');
		$('#detail').addClass('in active');
		$('#evaluation').removeClass('in active');
	}	
}
function swiper_Show(){
    var swiper = new Swiper('.swiper-container', {
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        slidesPerView: 3,
        paginationClickable: true,
        spaceBetween: 10,
    });
}
function num_Add(){
    var $numAdd = $('#numAdd');
    var $buyNum = $('#buyNum');
    $numAdd.on('click',function(){
        var k = $buyNum.val();
        k++;
        $buyNum.val(k);
    });
    
}
function num_Minus(){
    var $numMinus = $('#numMinus');
    var $buyNum = $('#buyNum');
    $numMinus.on('click',function(){
        var k = $buyNum.val();
        if(k>1){
           k--; 
       }
        $buyNum.val(k);
    });
    
}
function images_Show(){
    var $imagesShow = $('.images-show');
    var $proImage = $('#proImage');
    $imagesShow.hover(function(index){
        $proImage.attr({
            "src": $(this).attr('src')
        });
    });
    
}
function select_Style(){
    var $stylelist = $('.style-list');
    $stylelist.each(function(index){
        $(this).on('click',function(){
        	var stlid= $($stylelist[index]).attr("styleValue");
        	$("#iptStid").val(stlid);
            $($stylelist[index]).addClass('border-green-blod');
            $($stylelist[index]).removeClass('border-mydark-blod');
            $stylelist.each(function(ot){
                if(ot!=index){
                    $($stylelist[ot]).removeClass('border-green-blod');
                    $($stylelist[ot]).addClass('border-mydark-blod');
                }
            });
        });
    });
}
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) return unescape(r[2]); return null; //返回参数值
}