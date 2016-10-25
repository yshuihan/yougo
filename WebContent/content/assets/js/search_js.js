/* 
* @Author: anchen
* @Date:   2015-10-01 22:36:46
* @Last Modified by:   anchen
* @Last Modified time: 2015-10-05 16:42:05
*/

'use strict';
$(function(){
    select_Condition();
    animation_Show();
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
function select_Condition(){
    var $condition = $('.condition-select');
    var $conditionlist = $('.condition');
    $condition.each(function(index){
        $(this).hover(
            function(){
                $($conditionlist[index]).removeClass('no-display');
                $($conditionlist[index]).addClass('z-index04');
            },
            function(){
                $($conditionlist[index]).addClass('no-display');
                $($conditionlist[index]).removeClass('z-index04');
            }
        );
    });
}