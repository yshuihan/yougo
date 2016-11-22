<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.yougo.bean.Proimages"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'style_add.jsp' starting page</title>
    
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
    <jsp:useBean id="proimagesDaoImpl" class="com.yougo.impl.ProimagesDaoImpl" scope="request"></jsp:useBean>
	  <%
	    String alt="",pid="",filept="",message="",result="f";
	    if(session.getAttribute("message")!=null){
	  		message=session.getAttribute("message").toString();
	    }
	    if(session.getAttribute("filept")!=null){
	  		filept=session.getAttribute("filept").toString();
	    }
	    if(request.getAttribute("result")!=null){
	  		result=request.getAttribute("result").toString();
	    }
	    if(request.getAttribute("alt")!=null){
	  		alt=request.getAttribute("alt").toString();
	    }
	    //alt=new String(alt.getBytes("iso-8859-1"),"utf-8");
	    if(request.getAttribute("pid")!=null){
	  		pid=request.getAttribute("pid").toString();
	    }
	    short prid= Short.parseShort(pid);
	    //out.println(result);
	    if(result.equals("t")){
	    	Proimages primg=new Proimages( alt,filept,prid);
			int i=0;
			//out.println(sty.getImage());
			while(i==0){
				i =proimagesDaoImpl.addProimages(primg);
			}
	    }
	    response.sendRedirect("/yougo/admin/admin.jsp?list=2&btntp=images&protypeid=0&pid="+prid);
	  %>
  </body>
</html>
