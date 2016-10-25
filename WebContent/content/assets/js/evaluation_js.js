/* 
* @Author: anchen
* @Date:   2015-10-04 15:54:02
* @Last Modified by:   anchen
* @Last Modified time: 2015-11-06 17:19:08
*/

'use strict';
$(function(){
    add_Star();
})
function add_Star(){
    var $star = $('.glyphicon-star');
    $star.each(function(index){
        $(this).on('click',
            function(){
                if($(this).hasClass('text-orange')){
                    var k = Math.floor(index/5);
                    var $satisfaction = $('.satisfaction');
                    var len = $($satisfaction[k]).find('.text-orange').length;
                    len = (len-1)+k*5;
                    k = (k+1)*5;
                    if(len == index){                      
                        $(this).toggleClass('text-orange'); 
                    }else{
                        for(var i=index+1;i<k;i++){
                           $($star[i]).removeClass('text-orange'); 
                        }
                    }     
                }else{
                    var k =  Math.floor(index/5)*5;
                    for(var i=k;i<=index;i++){
                       $($star[i]).addClass('text-orange'); 
                    } 
                }
                $("#Starnum").val($(".all-eva.text-orange").length);
            }
        );
    });
}