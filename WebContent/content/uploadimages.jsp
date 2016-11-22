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
    
    <title>My JSP 'uploadimages.jsp' starting page</title>
    
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
    String loginid="",loginname="",filept="",message="",result="f";
    if(session.getAttribute("loginid")!=null){
 	   loginid=session.getAttribute("loginid").toString();
    }
    if(session.getAttribute("loginname")!=null){
 	   loginname=session.getAttribute("loginname").toString();
    }
    if(session.getAttribute("message")!=null){
  		message=session.getAttribute("message").toString();
    }
    if(session.getAttribute("filept")!=null){
  		filept=session.getAttribute("filept").toString();
    }
    if(request.getAttribute("result")!=null){
  		result=request.getAttribute("result").toString();
    }
    short usrid= Short.parseShort(loginid);
    //out.println(result);
    if(result.equals("t")){
    	User usr=new User(filept ,usrid);
		int i =userDaoImpl.updateUserHeadImage(usr);
		//out.println(i);
		if(i==0){
	  	  session.setAttribute("message", "文件上传失败！");
	    }
    }
    response.sendRedirect("/yougo/content/us.jsp?list=2");
  %>
   
  </body>
</html>
