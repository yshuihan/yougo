<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.yougo.bean.Order"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ordercontrol.jsp' starting page</title>
    
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
    <jsp:useBean id="orderServiceImpl" class="com.yougo.serviceImpl.OrderServiceImpl" scope="request"></jsp:useBean>
    <%
  	String loginid="",loginname="";
    if(session.getAttribute("loginid")!=null && session.getAttribute("loginname")!=null){
    	loginid=session.getAttribute("loginid").toString();
    	loginname=session.getAttribute("loginname").toString();
    }else{
    	response.sendRedirect("log_reg.jsp?type=login");
    }
    String orderid =request.getParameter("orderid");
    String olUrl=request.getHeader("Referer");
    Order odr =new Order(Short.parseShort(orderid) ,"已签收");
    int i=0;
    while(i==0){
    	i=orderServiceImpl.updateOrderState(odr);
    }
    response.sendRedirect(olUrl);
    %>
  </body>
</html>
