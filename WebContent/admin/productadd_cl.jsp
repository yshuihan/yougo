<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="utf-8"%>
<%@page import="com.jdbc.Product"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'product_edit.jsp' starting page</title>
    
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
    <jsp:useBean id="productDaoImpl" class="com.jdbc.ProductDaoImpl" scope="request"></jsp:useBean>
  	<%
  	String groundingstate="否";
  	String name="",protypeid="0",procode="",price="0",oldprice="0",parameter="",upTime="",downTime="",allcount="",discount="",indexiamge="";
  	name=request.getParameter("name");
  	protypeid=request.getParameter("protypeid");
  	procode=request.getParameter("procode");
  	price=request.getParameter("price");
  	oldprice=request.getParameter("oldprice");
  	parameter=request.getParameter("parameter");
  	upTime=request.getParameter("upTime");
  	downTime=request.getParameter("downTime");
  	allcount=request.getParameter("allcount");
  	discount=request.getParameter("discount");
  	indexiamge=request.getParameter("indexiamge");
  	name=new String(name.getBytes("iso-8859-1"),"utf-8");
  	protypeid=new String(protypeid.getBytes("iso-8859-1"),"utf-8");
  	procode=new String(procode.getBytes("iso-8859-1"),"utf-8");
  	price=new String(price.getBytes("iso-8859-1"),"utf-8");
  	oldprice=new String(oldprice.getBytes("iso-8859-1"),"utf-8");
  	parameter=new String(parameter.getBytes("iso-8859-1"),"utf-8");
  	upTime=new String(upTime.getBytes("iso-8859-1"),"utf-8");
  	downTime=new String(downTime.getBytes("iso-8859-1"),"utf-8");
  	allcount=new String(allcount.getBytes("iso-8859-1"),"utf-8");
  	discount=new String(discount.getBytes("iso-8859-1"),"utf-8");
  	indexiamge=new String(indexiamge.getBytes("iso-8859-1"),"utf-8");
  	if(upTime!=null && downTime!=null && !upTime.equals("") && !downTime.equals("")){
	  	Date date = new Date();  
	    SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); 
	    String currentdata = dateFormat.format(date);  
	    Date currenttime = dateFormat.parse(currentdata);  
	    Date dtuptime = dateFormat.parse(upTime); 
	    Date dtdowntime = dateFormat.parse(downTime);
	    upTime = dateFormat.format(dtuptime); 
	    downTime = dateFormat.format(dtdowntime);  
	    if(currenttime.before(dtdowntime)&&dtuptime.before(currenttime)){ 
	    	groundingstate="是";
	    }
    }
    float theprice=0,theoldprice=0,thediscount=1;
    Long theallcount=new Long((long)0);;
    if(price!=null && !price.equals("")){
    	theprice=Float.parseFloat(price);
    }
    if(oldprice!=null && !oldprice.equals("")){
    	theoldprice=Float.parseFloat(oldprice);
    }
    if(discount!=null && !discount.equals("")){
    	thediscount=Float.parseFloat(discount);
    }
    if(allcount!=null && !allcount.equals("")){
    	theallcount=Long.parseLong(allcount);
    }
    //groundingstate=new String(groundingstate.getBytes("iso-8859-1"),"utf-8");
  	 Product pd=new Product(name,Short.parseShort(protypeid),
  	theprice,theoldprice,procode,parameter,
  	groundingstate,upTime,downTime,indexiamge,theallcount,thediscount);
  	String olUrl=request.getHeader("Referer");
  	int i=0;
  	i=productDaoImpl.addtheProduct(pd);
  	//out.print(upTime);
  	response.sendRedirect("admin.jsp?list=2");
  	//out.print(pd.getGrounding());
  	%>
  </body>
</html>
