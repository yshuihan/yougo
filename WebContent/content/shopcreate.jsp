<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="utf-8"%>
<%@page import="com.jdbc.Order"%>
<%@page import="com.jdbc.Orderdetail"%>
<%@page import="com.jdbc.Shopcart"%>
<%@page import="com.jdbc.Product"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shopcreate.jsp' starting page</title>
    
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
    <jsp:useBean id="orderDaoImpl" class="com.jdbc.OrderDaoImpl" scope="request"></jsp:useBean>
    <jsp:useBean id="orderdetailImpl" class="com.jdbc.OrderdetailImpl" scope="request"></jsp:useBean>
    <jsp:useBean id="productDaoImpl" class="com.jdbc.ProductDaoImpl" scope="request"></jsp:useBean>
    <%
    String loginid="",loginname="";
    if(session.getAttribute("loginid")!=null && session.getAttribute("loginname")!=null){
    	loginid=session.getAttribute("loginid").toString();
    	loginname=session.getAttribute("loginname").toString();
    }else{
    	response.sendRedirect("log_reg.jsp?type=login");
    }
    Date dt =new Date();
	String dtstr= Long.toString(dt.getTime());
	Random random = new Random();
    int num=random.nextInt(10);
	String odrCOde="A"+dtstr.substring(dtstr.length()-6,dtstr.length()-1)+num;
	String addrid=request.getParameter("addrid");
	String content=request.getParameter("content");
	content=new String(content.getBytes("iso-8859-1"),"utf-8"); 
	String fhstate="未发货";
    //fhstate=new String(fhstate.getBytes("iso-8859-1"),"utf-8");
	String[] spck= request.getParameterValues("spck");
	if(request.getParameter("empty")!=null){
		int l=0;
		while(l==0){
			l=shopcartDaoImpl.deleteAllShopcart(Short.parseShort(loginid));
		}
	}
	if(request.getParameter("delete")!=null){
		if(spck.length>0){
		int l=0;
			for(int a=0;a<spck.length;a++){
				while(l==0){
	   				l=shopcartDaoImpl.deleteShopcart(Short.parseShort(spck[a]));
	   			}
	   			l=0;
			}
		}
	}
	if(request.getParameter("clearing")!=null){
		if(spck!=null && spck.length>0){
			float allprice=0;
			for(int a=0;a<spck.length;a++){
				Shopcart spt=shopcartDaoImpl.findShopcart(Short.parseShort(spck[a]));
				allprice+=spt.getPrice()*spt.getNum();
			}
			String datetime="";
		    Date dtnow =new Date();
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:00");
		    datetime=sdf.format(dtnow);
		    short usrid= Short.parseShort(loginid);
		    Order odr = new Order(odrCOde , allprice,content ,fhstate ,usrid ,datetime);
		    int i=orderDaoImpl.Order(odr);
		    int k=0,l=0;
		    if(i==1){
		   		Order odrd =orderDaoImpl.findoneOrder(odrCOde);
		   		for(int b=0;b<spck.length;b++){
		   			Shopcart spt=shopcartDaoImpl.findShopcart(Short.parseShort(spck[b]));
					Orderdetail odrdtl=new Orderdetail(odrd.getId(),spt.getProid(),spt.getNum(),spt.getPrice(),spt.getStyleid());
					int j=orderdetailImpl.addOrderdetail(odrdtl);
					if(j==0){
			   			while(k==0){
			   				k=orderDaoImpl.deleteOrder(odrd.getId());
			   			}
			   		}else{
			   			while(l==0){
			   				l=shopcartDaoImpl.deleteShopcart(Short.parseShort(spck[b]));
			   			}
			   			l=0;
			   			Product slpd =productDaoImpl.findProduct(spt.getProid());
			   			Long salenum=slpd.getSalenum();
			   			salenum++;
			   			int sl=productDaoImpl.updatesalenum(salenum, spt.getProid());
			   		}
				}	
		   	}
		}
	}
	response.sendRedirect("shop.jsp");
    %>
  </body>
</html>
