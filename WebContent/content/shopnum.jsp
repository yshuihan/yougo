<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="utf-8"%>
<%@page import="com.jdbc.Shopcart"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shopnum.jsp' starting page</title>
    
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
    <jsp:useBean id="shopcartDaoImpl" class="com.jdbc.ShopcartDaoImpl" scope="request"></jsp:useBean>
    <%
    String loginid="",loginname="";
    if(session.getAttribute("loginid")!=null && session.getAttribute("loginname")!=null){
    	loginid=session.getAttribute("loginid").toString();
    	loginname=session.getAttribute("loginname").toString();
    }else{
    	response.sendRedirect("log_reg.jsp?type=login");
    }
	String numtp=request.getParameter("numtp");
	String scid=request.getParameter("scid");
	String pnum=request.getParameter("pnum");
	Short pronum=Short.parseShort(pnum);
	Short spctid=Short.parseShort(scid);
	if(numtp!=null){
		if(numtp.equals("add")){
			pronum++;
		}
		if(numtp.equals("reduce")){
			pronum--;
		}
	}
	Date dt =new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:00");
    String datetime=sdf.format(dt);
    Shopcart spct=new Shopcart(spctid,pronum,datetime);
    int i=shopcartDaoImpl.updateTheShopcart(spct);
    response.sendRedirect("shop.jsp");
   	/* if(i==0){
    	//out.print("aa");
    	response.sendRedirect("detail.jsp?pid="+proid);
   	}else{
   		response.sendRedirect("shop.jsp");
   	} */
    %>
  </body>
</html>
