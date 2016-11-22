<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="utf-8"%>
<%@page import="com.yougo.bean.Product"%>
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
    <jsp:useBean id="productDaoImpl" class="com.yougo.impl.ProductDaoImpl" scope="request"></jsp:useBean>
  	<%
  	String groundingstate="否";
  	String id=request.getParameter("id");
  	String name=request.getParameter("name");
  	String protypeid=request.getParameter("protypeid");
  	String procode=request.getParameter("procode");
  	String price=request.getParameter("price");
  	String oldprice=request.getParameter("oldprice");
  	String parameter=request.getParameter("parameter");
  	String upTime=request.getParameter("upTime");
  	String downTime=request.getParameter("downTime");
  	String allcount=request.getParameter("allcount");
  	String discount=request.getParameter("discount");
  	id=new String(id.getBytes("iso-8859-1"),"utf-8");
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
  	Date date = new java.util.Date();  
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
    //groundingstate=new String(groundingstate.getBytes("iso-8859-1"),"utf-8");
  	Product pd=new Product(Short.parseShort(id),name,Short.parseShort(protypeid),
  	Float.parseFloat(price),Float.parseFloat(oldprice),procode,parameter,
  	groundingstate,upTime,downTime,Long.parseLong(allcount),Float.parseFloat(discount));
  	String olUrl=request.getHeader("Referer");
  	int i=0;
  	while(i==0){
  		i=productDaoImpl.updateProductEdit(pd);
  	}
  	response.sendRedirect("admin.jsp?list=2");
  	//out.print(pd.getGrounding());
  	%>
  </body>
</html>
