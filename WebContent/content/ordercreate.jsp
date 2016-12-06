<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="utf-8"%>
<%@page import="com.yougo.bean.Order"%>
<%@page import="com.yougo.bean.Orderdetail"%>
<%@page import="com.yougo.bean.Product"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ordercreate.jsp' starting page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
   <jsp:useBean id="orderServiceImpl" class="com.yougo.serviceImpl.OrderServiceImpl" scope="request"></jsp:useBean>
	<jsp:useBean id="orderDetailServiceImpl" class="com.yougo.serviceImpl.OrderDetailServiceImpl" scope="request"></jsp:useBean>
	<jsp:useBean id="productServiceImpl" class="com.yougo.serviceImpl.ProductServiceImpl" scope="request"></jsp:useBean>
  	<%
  	String loginid="",loginname="";
    if(session.getAttribute("loginid")!=null && session.getAttribute("loginname")!=null){
    	loginid=session.getAttribute("loginid").toString();
    	loginname=session.getAttribute("loginname").toString();
    }else{
    	response.sendRedirect("log_reg.jsp?type=login");
    }
    String addrid=request.getParameter("addrid");
    String ordercode=request.getParameter("ordercode");
    String proid=request.getParameter("proid"); 
    String pronum=request.getParameter("pronum"); 
    String price=request.getParameter("price"); 
    String styleid=request.getParameter("styleid"); 
    String content=request.getParameter("content");
    content=new String(content.getBytes("iso-8859-1"),"utf-8"); 
    String fhstate="未发货";
    //fhstate=new String(fhstate.getBytes("utf-8"),"utf-8"); 
    request.setCharacterEncoding("utf-8");
    //out.print(fhstate);
    System.out.println("addrid:"+addrid+",ordercode:"+ordercode+",proid:"+proid+",pronum:"+pronum+",price:"+price+",styleid:"+styleid+",cntent:"+content);
    short usrid= Short.valueOf(loginid);
    short stid= Short.valueOf(styleid);
    short pid= Short.valueOf(proid);
    short adid= Short.valueOf(addrid);
    //out.print(addrid+"  "+ordercode+"  "+proid+"  "+pronum+"  "+price+"  "+styleid+"  "+content);
    Order odr,odrd;
    Orderdetail odrdtl;
    String olUrl=request.getHeader("Referer");
    int i=0,j=0,k=0;
    String datetime="";
    Date dt =new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:00");
    datetime=sdf.format(dt);
    float allprice=Float.parseFloat(price)*Short.parseShort(pronum);
    odr = new Order(ordercode , allprice,content ,fhstate ,usrid ,datetime);
    //out.print(odr.getContext());
    i=orderServiceImpl.Order(odr);
    if(i==0){
    	//out.print("aa");
    	response.sendRedirect("detail.jsp?pid="+pid);
   	}else{
   		odrd =orderServiceImpl.findoneOrder(ordercode);
   		odrdtl=new Orderdetail(odrd.getId(),pid,Short.parseShort(pronum),Float.parseFloat(price),stid);
   		j=orderDetailServiceImpl.addOrderdetail(odrdtl);
   		if(j==0){
   			while(k==0){
   				k=orderServiceImpl.deleteOrder(odrd.getId());
   			}
   			//out.print("bb");
   			response.sendRedirect(olUrl);
   		}else{
   			Product slpd =productServiceImpl.findProduct(pid);
   			Long salenum=slpd.getSalenum();
   			salenum++;
   			int sl=productServiceImpl.updatesalenum(salenum, pid);
   			//out.print("cc");
   			response.sendRedirect("order.jsp");
   		}
   	}
    /* if(i==0){
  	  response.sendRedirect(olUrl+"&adresult=unseccess");
    }else{
	  response.sendRedirect(olUrl+"&adresult=seccess");
    } */
  	%>
  </body>
</html>
