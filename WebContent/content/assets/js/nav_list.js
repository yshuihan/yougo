/* 
* @Author: anchen
* @Date:   2015-09-29 17:15:49
* @Last Modified by:   anchen
* @Last Modified time: 2015-10-31 12:30:22
*/

'use strict';
$(function(){
    image_Animation();
})
function image_Back(listImage ,index){
    var t = Math.floor(index/8);
    var start = t*8;
    for(var i=start;i<start+8;i++){
        if($(listImage[i]).hasClass('list-first')){
            t = i;
        }
    }
    return t;
}
function image_Animation(){
    var $listImage = $('.lsit-pro-view>a>.list-image');
    var first = 0;
    $listImage.each(function(index){
        $(this).hover(function(){
            first = image_Back($listImage ,index);
            if(first!=index){
                $($listImage[first]).animate({
                    width: '80px'
                } ,1000);
                $($listImage[first]).removeClass('list-first');
                $(this).addClass('list-first');
                $(this).animate({
                    width: '351.79px'
                },1000);
                
            }
        });
    });
}