/* 
* @Author: anchen
* @Date:   2015-10-03 12:16:44
* @Last Modified by:   anchen
* @Last Modified time: 2015-11-06 13:54:38
*/

'use strict';
$(function(){
    animation_Show();
    animation_Rotate();
})
function animation_Show(){
    var $product = $('.theproduct');
    $product.each(function(index){
        $(this).hover(
            function(){
                $(this).children().addClass('onshow');
            },
            function(){
                $(this).children().removeClass('onshow');
            }
        );
    });
}
function animation_Rotate(){
    var $product = $('.ani-rotate');
    $product.each(function(index){
        $(this).hover(
            function(){
                $(this).addClass('onshow');
            },
            function(){
                $(this).removeClass('onshow');
            }
        );
    });
}