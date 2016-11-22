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
    
    <title>My JSP 'pdedit.jsp' starting page</title>
    
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
  String password=request.getParameter("password");
  String adminid="",adminname="";
  if(session.getAttribute("adminid")!=null){
 	 adminid=session.getAttribute("adminid").toString();
  }
  if(session.getAttribute("adminname")!=null){
 	 adminname=session.getAttribute("adminname").toString();
  }
  short mgrid= Short.parseShort(adminid);
  Manager mgr = new Manager(mgrid ,password);
  String olUrl=request.getHeader("Referer");
  int i =managerDaoImpl.updateManager(mgr);
  if(i==0){
  	response.sendRedirect(olUrl+"&result=unseccess");
  }else{
	response.sendRedirect(olUrl+"&result=seccess");
  }
  %>
  </body>
</html>
