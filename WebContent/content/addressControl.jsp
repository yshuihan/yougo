<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jdbc.Adress"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addressControl.jsp' starting page</title>
    
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
  <jsp:useBean id="adressDaoImpl" class="com.jdbc.AdressDaoImpl" scope="request"></jsp:useBean>
    <%
    String addtp=request.getParameter("addtp");
    String adid=request.getParameter("adid");
    String name=request.getParameter("name");
    String phone=request.getParameter("phone");
    String address=request.getParameter("address");
    String code=request.getParameter("code");
    name=new String(name.getBytes("iso-8859-1"),"utf-8");
    address=new String(address.getBytes("iso-8859-1"),"utf-8");
    String loginid="",loginname="";
    if(session.getAttribute("loginid")!=null){
 	   loginid=session.getAttribute("loginid").toString();
    }
    if(session.getAttribute("loginname")!=null){
 	   loginname=session.getAttribute("loginname").toString();
    }
    short usrid= Short.parseShort(loginid);
    Adress adr;
    String olUrl=request.getHeader("Referer");
    int i=0;
    if(addtp.equals("add")){
    	adr = new Adress(usrid ,name ,phone ,address ,code);
    	i=adressDaoImpl.addAdress(adr);
    }
    if(addtp.equals("edit")){
    	short addid= Short.parseShort(adid);
   		adr = new Adress(addid ,usrid ,name ,phone ,address ,code);
    	i=adressDaoImpl.updateAdress(adr);
    }	
    if(i==0){
  	  response.sendRedirect(olUrl+"&adresult=unseccess");
    }else{
	  response.sendRedirect(olUrl+"&adresult=seccess");
    }
     %>
  </body>
</html>
