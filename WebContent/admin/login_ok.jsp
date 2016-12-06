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
    
    <title>yougo-admin-login</title>
    
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
  	<jsp:useBean id="managerServiceImpl" class="com.yougo.serviceImpl.ManagerServiceImpl" scope="request"></jsp:useBean>
    <%
   	String email=request.getParameter("email");
    String password=request.getParameter("password");
    String str = "select * from manager where email='"+email+"' and password='"+password+"'";
   	Manager mgr = managerServiceImpl.isManager(str);
   	if(mgr!=null){
	   	session.setAttribute("adminid",mgr.getId());
	   	session.setAttribute("adminname",mgr.getName());
	   	response.sendRedirect("admin.jsp");
   	}else{
   		response.sendRedirect("login.jsp");
   	}
   	%>
  </body>
</html>
