/* 
* @Author: anchen
* @Date:   2015-09-20 12:50:09
* @Last Modified by:   anchen
* @Last Modified time: 2015-10-14 10:30:02
*/

'use strict';
$(function(){
    $('.listselect').hide();
    //$('.manage_list').hide();
    //$('#proconedit').hide();
    $('#styleManager').hide();
    $('#imageAdd').hide();
    //$($('.manage_list')[0]).show();
    //$('.manage-include').hide();
    //$($('.manage-include')[0]).show();
    /*var obj = $('.listview>li');
    $(obj[0]).toggleClass('pb-md');
    $(obj[0]).children('.listselect').slideToggle();*/
    listChange();
    //frameShow();
    listFrame();
    pd_edit_ok();
    order_State_Edit();
    //listShow();
    loginout();
    //console.log(selectist[1]);
});
function pd_edit_ok(){
	var result = getUrlParam('result');
	if(result!=null){
		if(result=="seccess"){
			alert("密码修改成功！");
		}
		if(result=="unseccess"){
			alert("密码修改失败！");
		}
	}
}
function order_State_Edit(){
	var result = getUrlParam('stresult');
	if(result!=null){
		if(result=="seccess"){
			alert("发货成功！");
		}
		if(result=="unseccess"){
			alert("发货失败！请重新发货！");
		}
	}
}
function caseSwitch(list){
	var kt=0;
	switch(list){
	case '0':
	case '1':
		kt=0;
	break;
	case '2':
	case '3':
		kt=1;
	break;
	case '4':
		kt=2;
	break;
	case '5':
		kt=3;
	break;
	case '6':
	case '7':
		kt=4;
	break;
	default:
		kt=0;
	break;
	}
	return kt;
}
function listChange() {
	var list = getUrlParam('list');
	var sesnum = 0;
	if(list==null){
		sesnum=0;
	}else{
		sesnum = caseSwitch(list);
	}
    var selectlist = $('.listview>li');
    selectlist.each(function(index){
        $(this).children('a').on('click' ,function(){
            if(sesnum != index){
                $(selectlist[sesnum]).toggleClass('pb-md');
                $(selectlist[sesnum]).children('.listselect').slideToggle();
            }
            $(selectlist[index]).toggleClass('pb-md');
            $(selectlist[index]).children('.listselect').slideToggle();
            sesnum = index;
        });
    });
}
function listFrame(){
	var list = getUrlParam('list');
	var kt=0;
	if(list==null){
		list=0;
	}
	kt = caseSwitch(list);
	//console.log(kt);
	//alert(list);
	var listli = $('.listview>li');
    var selectlist = $('.listselect');
    $(listli).addClass('pb-md');
    $(listli).children('.listselect').slideUp();
    $(listli[kt]).removeClass('pb-md');
    $(listli[kt]).children('.listselect').slideDown();
    var pnTitle = $(listli[kt]).children('a').html();
    $('#managerTitle').html(pnTitle);
}
function listShow(){
    var selectlist = $('.listselect>li>a');
    //var manageList = $('.manage_list');
    selectlist.each(function(index){
        $(this).on('click' ,function(){
        	alert("aa");
        	var pnTitle = $(selectlist[index]).parents('.listselect').prev('a').html();
            $('#managerTitle').html(pnTitle);
            //$('.manage_list').hide();
            //$($('.manage_list')[index]).show();
        });
    });
}
function frameShow(){
    var selectlist = $('.listselect>li>a');
    selectlist.each(function(index){
        $(this).on('click' ,function(){
            var pnTitle = $(selectlist[index]).parents('.listselect').prev('a').html();
            $('#managerTitle').html(pnTitle);
            $('.manage-include').hide();
            $($('.manage-include')[index]).show();
        });
    });
}
function pd_edit(){
	var $oldPassword =$('#oldPassword');
	var $newPassword =$('#newPassword');
	var $rePassword =$('#rePassword');
	if($oldPassword.val()=="" || $newPassword.val()=="" || $rePassword.val()==""){
		alert('内容不能为空');
		return false;
	}else{
		if($oldPassword.val().length<6 || $newPassword.val().length<6 || $rePassword.val().length<6){
			alert('密码需六位以上！');
			return false;
		}
		if($oldPassword.val()!=$oldPassword.attr("jspvalue")){
			alert('原密码不正确！');
			return false;
		}
		if($newPassword.val()!= $rePassword.val()){
			alert('两次密码输入不一致！');
			return false;
		}
	}
	return true;
		
};
function pro_Edit(){
    $('#proconedit').toggle();
}
function add_Style(){
    $('#styleManager').show();
    $('#proStyle').hide();
    $('#pageStyle').hide();
}
function btn_Style(){
    $('#proStyle').show();
    $('#pageStyle').show();
    $('#styleManager').hide();
}
function edit_Style(){
    $('#styleManager').show();
    $('#proStyle').hide();
    $('#pageStyle').hide();
}
function add_Images(){
    $('#imageAdd').toggle();
}
function loginout(){
    $('#loginOut').on('click' ,function(){
        console.log(alert('即将登出！'));
    })
}
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) return unescape(r[2]); return null; //返回参数值
}