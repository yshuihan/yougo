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
  <jsp:useBean id="userDaoImpl" class="com.yougo.impl.UserDaoImpl" scope="request"></jsp:useBean>
    <%
    String password=request.getParameter("password");
    String loginid="",loginname="";
    if(session.getAttribute("loginid")!=null){
 	   loginid=session.getAttribute("loginid").toString();
    }
    if(session.getAttribute("loginname")!=null){
 	   loginname=session.getAttribute("loginname").toString();
    }
    short usrid= Short.parseShort(loginid);
    User usr = new User(usrid ,password);
    String olUrl=request.getHeader("Referer");
    int i =userDaoImpl.updateUserPassword(usr);
    if(i==0){
  	  response.sendRedirect(olUrl+"&result=unseccess");
    }else{
	  response.sendRedirect(olUrl+"&result=seccess");
    }
    %>
  </body>
</html>
