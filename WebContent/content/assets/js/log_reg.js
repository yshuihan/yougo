/* 
* @Author: anchen
* @Date:   2015-11-06 16:45:46
* @Last Modified by:   anchen
* @Last Modified time: 2015-11-17 15:31:26
*/

'use strict';//463 591
$(function(){
    setInterval(function(){
        $('#imgLog').toggleClass('onshow');
    }, 3000);
    url_Contrl();
});
function url_Contrl() {
	var type = getUrlParam('type');
	var result = getUrlParam('result');
	if(type!=null && type=="register"){
		$('#logintab').removeClass('active');
		$('#registertab').addClass('active');
		$('#tblogin').removeClass('in active');
		$('#tbregister').addClass('in active');
	}else{
		$('#logintab').addClass('active');
		$('#registertab').removeClass('active');
		$('#tblogin').addClass('in active');
		$('#tbregister').removeClass('in active');
	}
	if(result!=null){
		if(result=="erro"){
			message_Warn($('#email') ,'用户登录失败！');
		}
		if(result=="exist"){
			message_Warn($('#remail') ,'邮箱已注册，请换一个！');
		}
		if(result=="unseccess"){
			message_Warn($('#remail') ,'注册失败！');
		}
		if(result=="seccess"){
			message_Warn($('#email') ,'注册成功！请登录');
		}
	}
}
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) return unescape(r[2]); return null; //返回参数值
}
function login_True(){
	var $email =$('#email');
	var $password =$('#password');
	if($email.val()=="" || $password.val()==""){
		if($email.val()==""){
			message_Warn($email ,'邮箱不能为空');
		}
		if($password.val()==""){
			message_Warn($password ,'密码不能为空');
		}
		return false;
	}
	return true;
		
};
function register_True(){
	var $remail =$('#remail');
	var $rusername =$('#rusername');
	var $rpassword =$('#rpassword');
	var $rrepassword =$('#rrepassword');
	var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
	if($remail.val()=="" || $rusername.val()=="" || $rpassword.val()=="" || $rrepassword.val()==""){
		if($remail.val()==""){
			message_Warn($remail ,'邮箱不能为空');
		}
		if($rusername.val()==""){
			message_Warn($rusername ,'用户名不能为空');
		}
		if($rpassword.val()==""){
			message_Warn($rpassword ,'密码不能为空');
		}
		if($rrepassword.val()==""){
			message_Warn($rrepassword ,'重复密码不能为空');
		}
		return false;
	}else{
		if(!reg.test($remail.val())){
			message_Warn($remail ,'邮箱格式不正确');
			return false;
		}
		if($rpassword.val().length<6){
			message_Warn($rpassword ,'密码需六位以上！');
			return false;
		}
		if($rpassword.val()!=$rrepassword.val()){
			message_Warn($rrepassword ,'两次输入密码不一致');
			return false;
		}
	}
	return true;
		
};
function message_Warn($obj ,text){
	$obj.attr({'data-toggle' :'tooltip' 
			,'data-placement' :'auto top'
			,'trigger' :'click'
			,'title' :text});
	$obj.tooltip('show');
}