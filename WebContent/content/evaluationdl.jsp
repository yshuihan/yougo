<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="utf-8"%>
<%@page import="com.jdbc.Evaluation"%>
<%@page import="com.jdbc.Order"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'evaluationdl.jsp' starting page</title>
    
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
    <jsp:useBean id="evaluationDaoImpl" class="com.jdbc.EvaluationDaoImpl" scope="request"></jsp:useBean>
    <jsp:useBean id="orderDaoImpl" class="com.jdbc.OrderDaoImpl" scope="request"></jsp:useBean>
    <%
   	String loginid="",loginname="";
    if(session.getAttribute("loginid")!=null && session.getAttribute("loginname")!=null){
    	loginid=session.getAttribute("loginid").toString();
    	loginname=session.getAttribute("loginname").toString();
    }else{
    	response.sendRedirect("log_reg.jsp?type=login");
    }
    String pid=request.getParameter("pid");
    String star=request.getParameter("star");
    String content=request.getParameter("content");
    content=new String(content.getBytes("iso-8859-1"),"utf-8"); 
    String datetime="";
    Date dtnow =new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:00");
    datetime=sdf.format(dtnow);
    int i=0;
    Evaluation eva=new Evaluation(Short.parseShort(pid),Short.parseShort(loginid),content,Short.parseShort(star),datetime);
	while(i==0){
		i=evaluationDaoImpl.addEvaluation(eva);
	}
	response.sendRedirect("detail.jsp?pid="+pid);
    %>
  </body>
</html>
