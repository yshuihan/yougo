<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jdbc.Style"%>
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
    <jsp:useBean id="styleDaoImpl" class="com.jdbc.StyleDaoImpl" scope="request"></jsp:useBean>
	  <%
	    String name="",pid="",filept="",message="",result="f";
	    if(session.getAttribute("message")!=null){
	  		message=session.getAttribute("message").toString();
	    }
	    if(session.getAttribute("filept")!=null){
	  		filept=session.getAttribute("filept").toString();
	    }
	    if(request.getAttribute("result")!=null){
	  		result=request.getAttribute("result").toString();
	    }
	    if(request.getAttribute("name")!=null){
	  		name=request.getAttribute("name").toString();
	    }
	    //name=new String(name.getBytes("iso-8859-1"),"utf-8");
	    if(request.getAttribute("pid")!=null){
	  		pid=request.getAttribute("pid").toString();
	    }
	    short prid= Short.parseShort(pid);
	    //out.println(name);
	    if(result.equals("t")){
	    	Style sty=new Style( name,filept,prid);
			int i=0;
			//out.println(sty.getImage());
			while(i==0){
				i =styleDaoImpl.addtheStyle(sty);
			}
	    }
	    response.sendRedirect("/yougo/admin/admin.jsp?list=2&btntp=style&protypeid=0&pid="+prid);
	  %>
  </body>
</html>
