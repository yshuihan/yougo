<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="utf-8"%>
<%@page import="com.yougo.bean.Shopcart"%>
<%@page import="com.yougo.bean.Product"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addshop.jsp' starting page</title>
    
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
    <jsp:useBean id="shopCartServiceImpl" class="com.yougo.serviceImpl.ShopCartServiceImpl" scope="request"></jsp:useBean>
  	<%
  	String loginid="",loginname="";
    if(session.getAttribute("loginid")!=null && session.getAttribute("loginname")!=null){
    	loginid=session.getAttribute("loginid").toString();
    	loginname=session.getAttribute("loginname").toString();
    }else{
    	response.sendRedirect("log_reg.jsp?type=login");
    }
	String proid=request.getParameter("proid");
    String styleid=request.getParameter("styleid");
    String pronum=request.getParameter("pronum");
    Product pdr=productServiceImpl.findProduct(Short.parseShort(proid));
    float price=pdr.getPrice(); 
    Date dt =new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:00");
    String datetime=sdf.format(dt);
    String str="select * from shopcart where userid="+loginid+" and proid="+proid+" and styleid="+styleid;
    //out.print(str);
    Shopcart sct=shopCartServiceImpl.findTheShopcart(str);
    if(sct!=null){
    	//out.print("aa");
    	Short number=(short)(Short.parseShort(pronum)+sct.getNum());
    	Shopcart spct=new Shopcart(sct.getId(),number,datetime);
    	int i=shopCartServiceImpl.updateTheShopcart(spct);
    	if(i==0){
	    	//out.print("aa");
	    	response.sendRedirect("detail.jsp?pid="+proid);
	   	}else{
	   		response.sendRedirect("shop.jsp");
	   	}
    }else{
	    Shopcart spct=new Shopcart(Short.parseShort(loginid),Short.parseShort(proid),Short.parseShort(pronum),price,Short.parseShort(styleid),datetime);
	  	int i=shopCartServiceImpl.addShopcart(spct);
	    if(i==0){
	    	//out.print("aa");
	    	response.sendRedirect("detail.jsp?pid="+proid);
	   	}else{
	   		response.sendRedirect("shop.jsp");
	   	}
   	}
  	%>
  </body>
</html>
