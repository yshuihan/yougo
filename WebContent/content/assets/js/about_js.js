/* 
* @Author: anchen
* @Date:   2015-10-05 20:05:04
* @Last Modified by:   anchen
* @Last Modified time: 2015-10-05 20:06:41
*/

'use strict';
$(function(){
    list_Hide();
    usSet_Show();
})
function list_Hide(){
    var $aboutlist = $('.aboutlist');
    $aboutlist.each(function(index){
        $($aboutlist[index]).hide();
    });
    $($aboutlist[0]).show();
}
function usSet_Show(){
    var $aboutselect = $('.aboutselect');
    var $aboutlist = $('.aboutlist');
    $aboutselect.each(function(index){
        $(this).on('click',function(){
            $aboutlist.each(function(ot){
                $($aboutlist[ot]).hide();
            });
            $($aboutlist[index]).show();
        });
    });
}