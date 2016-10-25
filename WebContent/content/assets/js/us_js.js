/* 
* @Author: anchen
* @Date:   2015-10-04 16:38:37
* @Last Modified by:   anchen
* @Last Modified time: 2015-10-31 14:03:01
*/

'use strict';
$(function(){
    $('#addeditAddress').hide();
    $('#usmessage').hide();
    $('#uploadImage').hide();
    /*$('#btnAdd').on('click',function(){
    	 $('#addtype').val("add");
        $('#addeditAddress').show();
    });*/
    /*$('.btn-edit').on('click',function(){
   	 $('#addtype').val("edit");
       $('#addeditAddress').show();
   });*/
    $('#usmessage_back').on('click',function(){
    	$('#usmessage').hide();
        $('#uslist').show();
    });
    $('#useditbtn').on('click',function(){
        $('#usmessage').show();
        $('#uslist').hide();
    });
    $('#editImage').on('click',function(){
        $('#uploadImage').toggle();
    });
    list_Hide();
    list_Show();
    //usSet_Show();
    pd_ediit_ok();
    ediit_Address();
    add_ediit_ok();
});
function list_Show(){
	var list = getUrlParam('list');
	var $uslist = $('.uslist');
	$uslist.hide();
	if(list!=null&&list!=""){
		var kt = caseSwitch(list);
		$($uslist[kt]).show();
	}else{
		$($uslist[0]).show();
	}
}
function caseSwitch(list){
	var kt=0;
	switch(list){
	case '0':
		kt=0;
	break;
	case '1':
		kt=1;
	break;
	case '2':
		kt=2;
	break;
	case '3':
		kt=3;
	break;
	default:
		kt=0;
	break;
	}
	return kt;
}
function ediit_Address(){
	var edtp = getUrlParam('edtp');
	var $uslist = $('.uslist');
	if(edtp!=null && (edtp=="edit" || edtp=="add")){
		$('#addtype').val(edtp);
	    $('#addeditAddress').show();
	    var $uslist = $('.uslist');
	    $uslist.hide();
	    $($uslist[1]).show();
	}
}
function add_ediit_ok(){
	var edtp = getUrlParam('edtp');
	var result = getUrlParam('adresult');
	var $uslist = $('.uslist');
	if(edtp!=null && edtp=="edit"){
		$('#addeditAddress').show();
		if(result!=null && result=="seccess"){
			$('#addeditAddress').hide();
			alert("地址修改成功！");
		}
		if(result!=null && result=="unseccess"){
			$('#addeditAddress').show();
			alert("地址修改失败！");
		}
		$uslist.hide();
	    $($uslist[1]).show();
		//list_Show();
	}
	if(edtp!=null && edtp=="add"){
		$('#addeditAddress').show();
		if(result!=null && result=="seccess"){
			$('#addeditAddress').hide();
			alert("地址添加成功！");
		}
		if(result!=null && result=="unseccess"){
			$('#addeditAddress').show();
			alert("地址添加失败！");
		}
		$uslist.hide();
	    $($uslist[1]).show();
		//list_Show();
	}
}
function pd_ediit_ok(){
	var result = getUrlParam('result');
	if(result!=null && result=="seccess"){
		alert("密码修改成功！");
	}
	if(result!=null && result=="unseccess"){
		alert("密码修改失败！");
	}
}
function pd_edit(){
	var $oldPassword =$('#oldPassword');
	var $newPassword =$('#newPassword');
	var $rePassword =$('#rePassword');
	if($oldPassword.val()=="" || $newPassword.val()=="" || $rePassword.val()==""){
		if($oldPassword.val()==""){
			message_Warn($oldPassword ,'内容不能为空');
		}
		if($newPassword.val()==""){
			message_Warn($newPassword ,'内容不能为空');
		}
		if($rePassword.val()==""){
			message_Warn($rePassword ,'内容不能为空');
		}
		return false;
	}else{
		if($oldPassword.val().length<6||$newPassword.val().length<6||$rePassword.val().length<6){
			if($oldPassword.val().length<6){
				message_Warn($oldPassword ,'密码需六位以上！');
			}
			if($newPassword.val().length<6){
				message_Warn($newPassword ,'密码需六位以上！');
			}
			if($rePassword.val().length<6){
				message_Warn($rePassword ,'密码需六位以上！');
			}
			return false;
		}else{
			if($oldPassword.val()!=$oldPassword.attr("jspvalue")){
				message_Warn($oldPassword ,'原密码不正确！');
				return false;
			}
			if($newPassword.val()!= $rePassword.val()){
				message_Warn($rePassword ,'两次密码输入不一致！');
				return false;
			}
		}	
	}
	return true;
		
};
function address_form(){
	var $userName =$('#userName');
	var $phone =$('#phone');
	var $address =$('#address');
	var $code =$('#code');
	var regph= /^(13[0-9]|14[0-9]|15[0-9]|18[0-9])\d{8}$/;
	if($userName.val()=="" || $phone.val()=="" || $address.val()==""|| $code.val()==""){
		if($userName.val()==""){
			message_Warn($userName ,'名字不能为空');
		}
		if($phone.val()==""){
			message_Warn($phone ,'手机号码不能为空');
		}
		if($address.val()==""){
			message_Warn($address ,'地址不能为空');
		}
		if($code.val()==""){
			message_Warn($code ,'邮编不能为空');
		}
		return false;
	}else{
		if($code.val().length!=6){
			message_Warn($code ,'邮编需六位！');
			return false;
		}
		if(!regph.test($usPhone.val())){
			message_Warn($usPhone ,'手机格式不正确');
			return false;
		}	
	}
	return true;
};
function list_Hide(){
    var $uslist = $('.uslist');
    $uslist.each(function(index){
        $($uslist[index]).hide();
    });
    $($uslist[0]).show();
}
function usSet_Show(){
    var $usselect = $('.usselect');
    var $uslist = $('.uslist');
    $usselect.each(function(index){
        $(this).on('click',function(){
        	$('#usmessage').hide();
            $uslist.each(function(ot){
                $($uslist[ot]).hide();
            });
            $($uslist[index]).show();
        });
    });
}
function us_Message(){
	//$('#usmessage').hide();
    //$('#uslist').show();
	var $usEmail =$('#usEmail');
	var $usName =$('#usName');
	var $usPhone =$('#usPhone');
	var $usQq =$('#usQq');
	var $usBirth =$('#usBirth');
	var $usAdress =$('#usAdress');
	var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
	var regph= /^(13[0-9]|14[0-9]|15[0-9]|18[0-9])\d{8}$/;
	if($usEmail.val()=="" || $usName.val()=="" || $usPhone.val()=="" || $usQq.val()=="" || $usBirth.val()=="" || $usAdress.val()==""){
		if($usEmail.val()==""){
			message_Warn($usEmail ,'邮箱不能为空');
		}
		if($usName.val()==""){
			message_Warn($usName ,'用户名不能为空');
		}
		if($usPhone.val()==""){
			message_Warn($usPhone ,'手机不能为空');
		}
		if($usQq.val()==""){
			message_Warn($usQq ,'QQ不能为空');
		}
		if($usBirth.val()==""){
			message_Warn($usBirth ,'出生日期不能为空');
		}
		if($usAdress.val()==""){
			message_Warn($usAdress ,'地址不能为空');
		}
		return false;
	}else{
		if(!reg.test($usEmail.val())){
			message_Warn($usEmail ,'邮箱格式不正确');
			return false;
		}
		if($usQq.val().length<5){
			message_Warn($usQq ,'QQ最低5位以上！');
			return false;
		}
		if(!regph.test($usPhone.val())){
			message_Warn($usPhone ,'手机格式不正确');
			return false;
		}
	}
	return true;
}
function message_Warn($obj ,text){
	$obj.attr({'data-toggle' :'tooltip' 
			,'data-placement' :'auto top'
			,'trigger' :'click'
			,'title' :text});
	$obj.tooltip('show');
}
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) return unescape(r[2]); return null; //返回参数值
}