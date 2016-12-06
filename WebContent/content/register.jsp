<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.yougo.bean.User"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
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
    <jsp:useBean id="userServiceImpl" class="com.yougo.serviceImpl.UserServiceImpl" scope="request"></jsp:useBean>
    <%
    String email=request.getParameter("email");
    String name=request.getParameter("name");
    String password=request.getParameter("password");
    String repassword=request.getParameter("repassword");
   	String str = "select * from user where email='"+email+"'";
   	User usr = userServiceImpl.isUser(str);
   	if(usr!=null){
   		response.sendRedirect("log_reg.jsp?type=register&result=exist");
   	}else{
		User usrf = new User(name,email,password);
   		int i=userServiceImpl.addUser(usrf);
   		if(i==0){
   			response.sendRedirect("log_reg.jsp?type=register&result=unseccess");
   		}else{
   			response.sendRedirect("log_reg.jsp?type=login&result=seccess");
   			//response.sendRedirect("index.jsp");
   		}
   	}
   	%>
  </body>
</html>
