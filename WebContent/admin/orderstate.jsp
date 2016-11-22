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
    
    <title>My JSP 'orderstate.jsp' starting page</title>
    
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
  <jsp:useBean id="orderDaoImpl" class="com.yougo.impl.OrderDaoImpl" scope="request"></jsp:useBean>
  <%
  String state=request.getParameter("state");
  String ordid=request.getParameter("ordid");
  //state=new String(state.getBytes("iso-8859-1"),"utf-8");
  short orid= Short.parseShort(ordid);
  Order ordr = new Order(orid,state);
  String olUrl=request.getHeader("Referer");
  int i =orderDaoImpl.updateOrderState(ordr);
  if(i==0){
  	response.sendRedirect(olUrl+"&stresult=unseccess");
  }else{
	response.sendRedirect(olUrl+"&stresult=seccess");
  }
  %>
  </body>
</html>
