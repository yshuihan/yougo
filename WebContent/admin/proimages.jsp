<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.yougo.bean.Product"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'proimages.jsp' starting page</title>
    
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
	  <%
	    String pid="",filept="",message="",result="f";
	    if(session.getAttribute("message")!=null){
	  		message=session.getAttribute("message").toString();
	    }
	    if(session.getAttribute("filept")!=null){
	  		filept=session.getAttribute("filept").toString();
	    }
	    if(request.getAttribute("result")!=null){
	  		result=request.getAttribute("result").toString();
	    }
	    if(request.getAttribute("pid")!=null){
	  		pid=request.getAttribute("pid").toString();
	    }
	    short prid= Short.parseShort(pid);
	    //out.println(result);
	    if(result.equals("t")){
	    	Product usr=new Product(prid ,filept);
			int i =productServiceImpl.updateProductImage(usr);
			//out.println(i);
			if(i==0){
		  	  session.setAttribute("message", "文件上传失败！");
		    }
	    }
	    response.sendRedirect("/yougo/admin/admin.jsp?list=2");
	  %>
  </body>
</html>
