<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.yougo.bean.Product"%>
<%@page import="com.yougo.bean.Style"%>
<%@page import="com.yougo.bean.Proimages"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'product_dl.jsp' starting page</title>
    
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
    <jsp:useBean id="productServiceImpl" class="com.yougo.serviceImpl.ProductServiceImpl" scope="request"></jsp:useBean>
    <jsp:useBean id="styleServiceImpl" class="com.yougo.serviceImpl.StyleServiceImpl" scope="request"></jsp:useBean>
    <jsp:useBean id="proimagesServiceImpl" class="com.yougo.serviceImpl.ProImageServiceImpl" scope="request"></jsp:useBean>
  	<%
  	String pid=request.getParameter("pid");
  	out.print(pid);
  	int i=0,j=0,k=0;
  	i=productServiceImpl.deleteProduct(Short.parseShort(pid));
  	if(i!=0){
  		j=styleServiceImpl.deleteproStyle(Short.parseShort(pid));
  		k=proimagesServiceImpl.deleteproProimages(Short.parseShort(pid));
  	}
  	String olUrl=request.getHeader("Referer");
  	response.sendRedirect("admin.jsp?list=2");
  	%>
  </body>
</html>
