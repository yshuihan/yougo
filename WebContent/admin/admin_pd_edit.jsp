<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.yougo.bean.Manager"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>yougo-admin</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <jsp:useBean id="managerDaoImpl" class="com.yougo.impl.ManagerDaoImpl" scope="request"></jsp:useBean>
  <%
  String adminid="",adminname="";
  if(session.getAttribute("adminid")!=null){
 	 adminid=session.getAttribute("adminid").toString();
  }
  if(session.getAttribute("adminname")!=null){
 	 adminname=session.getAttribute("adminname").toString();
  }
  Manager mangr=managerDaoImpl.findManager(Short.parseShort(adminid));
  String oldPd = mangr.getPassword();
   %>
    <div class="manage_list col-lg-10 col-lg-offset-1">
	    <h3 class="text-center pb-md">管理员密码修改</h3>
	    <form class="form-horizontal col-lg-6 col-lg-offset-3" action="admin/pdedit.jsp" method="post" onsubmit="return pd_edit();" role="form">
	        <div class="form-group">
	            <label for="oldPassword" class="col-sm-3 control-label">旧密码</label>
	            <div class="col-sm-9">
	                <input type="password" jspvalue="<%=oldPd %>" class="form-control input-mydark" id="oldPassword" placeholder="请输入旧密码">
	            </div>
	        </div>
	        <div class="form-group">
	            <label for="newPassword" class="col-sm-3 control-label">新密码</label>
	            <div class="col-sm-9">
	                <input type="password" class="form-control input-mydark" name="password" id="newPassword" placeholder="请输入新密码">
	            </div>
	        </div>
	        <div class="form-group">
	            <label for="rePassword" class="col-sm-3 control-label">密码重复</label>
	            <div class="col-sm-9">
	                <input type="password" class="form-control input-mydark" id="rePassword" placeholder="请再次输入密码">
	            </div>
	        </div>
	        <div class="form-group pt-lg pb-lg">
	            <div class="col-sm-6">
	                <button type="submit" class="btn btn-mydark width-p100">submit</button>
	            </div>
	            <div class="col-sm-6">
	                <button type="reset" class="btn btn-mydark width-p100">reset</button>
	            </div>
	        </div>
	    </form>
	</div>
  </body>
</html>
