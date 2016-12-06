<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="utf-8"%>
<%@page import="com.yougo.bean.User"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP '/usmessage.jsp' starting page</title>
    
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
    System.out.println(email);
    	String name=request.getParameter("name");
    	String phone=request.getParameter("phone");
    	String QQ=request.getParameter("QQ");
    	String birth=request.getParameter("birth");
    	String adress=request.getParameter("adress");
    	email=new String(email.getBytes("iso-8859-1"),"utf-8");
    	name=new String(name.getBytes("iso-8859-1"),"utf-8");
    	phone=new String(phone.getBytes("iso-8859-1"),"utf-8");
    	QQ=new String(QQ.getBytes("iso-8859-1"),"utf-8");
    	birth=new String(birth.getBytes("iso-8859-1"),"utf-8");
    	adress=new String(adress.getBytes("iso-8859-1"),"utf-8");
    	String loginid="",loginname="";
        if(session.getAttribute("loginid")!=null && session.getAttribute("loginname")!=null){
        	loginid=session.getAttribute("loginid").toString();
        	loginname=session.getAttribute("loginname").toString();
        	short usrid= Short.parseShort(loginid);
        	User usrf = new User(usrid,name,email,phone,QQ,birth,adress);
        	String olUrl=request.getHeader("Referer");
        	int i=userServiceImpl.updateUser(usrf);
	   		if(i==0){
	   			response.sendRedirect(olUrl);
	   			//response.sendRedirect(olUrl+"?result=unseccess");
	   		}else{
	   			response.sendRedirect(olUrl);
	   			//response.sendRedirect(olUrl+"?result=seccess");
	   			//response.sendRedirect("index.jsp");
	   		}
        }else{
        	response.sendRedirect("log_reg.jsp");
        }
     %>
  </body>
</html>
