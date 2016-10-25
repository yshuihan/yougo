<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jdbc.Order"%>
<%@page import="com.jdbc.Orderdetail"%>
<%@page import="com.jdbc.Product"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>yougo-admin</title>
    
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
  <jsp:useBean id="orderDaoImpl" class="com.jdbc.OrderDaoImpl" scope="request"></jsp:useBean>
  <jsp:useBean id="orderdetailImpl" class="com.jdbc.OrderdetailImpl" scope="request"></jsp:useBean>
    <div class="manage_list col-lg-10 col-lg-offset-1">
    <%
    int pagecount = 5;
    String pagenum=request.getParameter("page");
    String list=request.getParameter("list");
    if(pagenum==null){
   		pagenum="1";
   	}
   	if(list==null){
   		list="1";
   	}
   	int start=(Integer.parseInt(pagenum)-1)*pagecount;
   	String limited="limit " + start + "," + pagecount;
   	String str="select * from orders order by id "+limited;
   	String query="select * from orders order by id ";
   	Collection<Order> cord=orderDaoImpl.getOrder(str);
   	Iterator<Order> orditer=cord.iterator(); 
   	int allcount = orderDaoImpl.orderNum(query);
   	int allpage =1;
	if(allcount%pagecount==0)
	{
		allpage = allcount/pagecount;
	}else{
		allpage = allcount/pagecount+1;
	}
	if(cord.size()!=0){
    %>
	    <div class="table-responsive">
	        <table class="table table-hover">
	            <caption><h3 class="text-center pb-md">订单信息</h3></caption>
	            <thead>
	                <tr>
	                    <th>ID</th>
	                    <th>订单编号</th>
	                    <th>总价(元)</th>
	                    <th>状态</th>
	                    <th>留言</th>
	                    <th>时间</th>
	                    <th>查看</th>
	                    <th>订单状态修改</th>
	                </tr>
	            </thead>
	            <tbody>
			    <%
			    while(orditer.hasNext()){ 
					Order rdr=(Order)orditer.next();
					String pageUrl = "admin/admin.jsp?";
		    		if(list!=null){
	           			pageUrl+="list="+list+"&";
	           		}
	           		if(pagenum!=null){
	           			pageUrl+="page="+pagenum+"&";
	           		}
	           		String ordstate = rdr.getState();
			     %>
	                <tr>
	                    <td class="line-td"><%=rdr.getId() %></td>
	                    <td class="line-td"><%=rdr.getOrdernumber() %></td>
	                    <td class="line-td"><%=rdr.getPrice() %></td>
	                    <td class="line-td"><%=rdr.getState() %></td>
	                    <td class="line-td"><%=rdr.getContext() %></td>
	                    <td class="line-td"><%=rdr.getCreatetime() %></td>
	                    <td class="line-td">
	                        <button type="button" class="btn btn-mydark" onclick="window.location='<%=pageUrl+"ordid="+rdr.getId() %>'">查看</button>
	                    </td>
	                    <td class="line-td">
	                    <%
	                    if(ordstate.equals("未发货")){
	                     %>
	                        <button type="button" class="btn btn-mydark" onclick="window.location='admin/orderstate.jsp?state=发货中&ordid=<%=rdr.getId() %>'">发货</button>
	                    <%} %>
	                    </td>
	                </tr>
	            <%
	            }
	            %>
	            </tbody>
	        </table>
	    </div> 
	    <div id="pageNum" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt-md mb-md">
	    	<%
	    		int licount = 5;
	    		int pageNow = Integer.parseInt(pagenum);
	            if(allpage<licount){
	            	licount=allpage;
	            }
	    		String pageUrl = "admin/admin.jsp?";
	    		if(list!=null){
           			pageUrl+="list="+list+"&";
           		}
	    	 %>
	        <div id="page" class="text-center">
	            <ul class="pagination">
	            	<%
	            	if(pageNow<=1){
	            	 %>
	            	<li><a href="javascript:;">&laquo;</a></li>
	             <%}else{ 
	             	int k =pageNow;
	             	k--;
	             %>
	             <li><a href="<%=pageUrl+"page="+k%>">&laquo;</a></li>
	             <%} %>
	             <%
	             for(int i=1;i<=licount;i++){
	             	if(pageNow==i){ 
	              %>
	                		<li class="active"><a href="javascript:;"><%=i %></a></li>
	              <%
	              }else{
	              %>
	             		<li><a href="<%=pageUrl+"page="+i%>"><%=i %></a></li>
	             <%
	            		}
	             }
	             %>
	             <%
	            	if(pageNow>=allpage){
	            	 %>
	            	<li><a href="javascript:;">&raquo;</a></li>
	             <%}else{ 
	             	int k =pageNow;
	             	k++;
	             %>
	             <li><a href="<%=pageUrl+"page="+k%>">&raquo;</a></li>
	             <%} %>
	            </ul>  
	        </div>
	    </div>
	    <%
    	}else{
    		%>
    		<h3 class="text-orange">暂无订单信息！</h3>
    		<%
    	}
	    %>
	    <%
	    String ordid=request.getParameter("ordid");
	    if(ordid!=null){
		    int secpagecount = 5;
		    String secpagenum=request.getParameter("secpage");
		    if(secpagenum==null){
		   		secpagenum="1";
		   	}
		   	int secstart=(Integer.parseInt(secpagenum)-1)*secpagecount;
		   	String seclimited="limit " + secstart + "," + secpagecount;
		   	String secstr="select * from orderdetail where orderid=" + ordid+" order by id "+seclimited;
		   	String secquery="select * from orderdetail where orderid=" + ordid+" order by id";
		   	Collection<Orderdetail> corddt=orderdetailImpl.getOrderdetail(secstr);
		   	Iterator<Orderdetail> orddtiter=corddt.iterator(); 
		   	int secallcount = orderdetailImpl.orderdetailNum(secquery);
		   	int secallpage =1;
			if(secallcount%secpagecount==0)
			{
				secallpage = secallcount/secpagecount;
			}else{
				secallpage = secallcount/secpagecount+1;
			}
		   	if(corddt.size()!=0){
	     %>
	    <div id="proEva" class="table-responsive">
	        <table class="table table-hover">
	            <caption><h3 class="text-center pb-md">订单编号<%=ordid %>信息</h3></caption>
	            <thead>
	                <tr>
	                    <th>ID</th>
	                    <th>商品</th>
	                    <th>数量</th>
	                    <th>单价</th>
	                </tr>
	            </thead>
	            <tbody>
	            <%
           		while(orddtiter.hasNext()){ 
					Orderdetail ordt=(Orderdetail)orddtiter.next();
	            %>
	                <tr>
	                    <td class="line-td"><%=ordt.getId() %></td>
	                    <td class="line-td">
						<%
	                    Product onepd=productDaoImpl.findProduct(ordt.getProid());
	                    out.print(onepd.getName());
	                     %>
						</td>
	                    <td class="line-td"><%=ordt.getNum() %></td>
	                    <td class="line-td"><%=ordt.getPrice() %></td>
	                </tr>
	            <%} %>       
	            </tbody>
	        </table>
	    </div> 
	    <div id="pageNum" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt-md mb-md">
	    	<%
	    		int seclicount = 5;
	    		int secpageNow = Integer.parseInt(secpagenum);
	            if(secallpage<seclicount){
	            	seclicount=secallpage;
	            }
	    		String secpageUrl = "admin/admin.jsp?";
	    		if(pagenum!=null){
           			secpageUrl+="page="+pagenum+"&";
           		}
           		if(list!=null){
           			secpageUrl+="list="+list+"&";
           		}
	    	 %>
	        <div id="page" class="text-center">
	            <ul class="pagination">
	            	<%
	            	if(secpageNow<=1){
	            	 %>
	            	<li><a href="javascript:;">&laquo;</a></li>
	             <%}else{ 
	             	int k =secpageNow;
	             	k--;
	             %>
	             <li><a href="<%=secpageUrl+"page="+k%>">&laquo;</a></li>
	             <%} %>
	             <%
	             for(int i=1;i<=seclicount;i++){
	             	if(secpageNow==i){ 
	              %>
	                		<li class="active"><a href="javascript:;"><%=i %></a></li>
	              <%
	              }else{
	              %>
	             		<li><a href="<%=secpageUrl+"page="+i%>"><%=i %></a></li>
	             <%
	            		}
	             }
	             %>
	             <%
	            	if(secpageNow>=allpage){
	            	 %>
	            	<li><a href="javascript:;">&raquo;</a></li>
	             <%}else{ 
	             	int k =secpageNow;
	             	k++;
	             %>
	             <li><a href="<%=secpageUrl+"page="+k%>">&raquo;</a></li>
	             <%} %>
	            </ul>  
	        </div>
	    </div>
	    <%
	    	}else{
	    		%>
	    		<h3 class="text-orange">该订单暂无详细订单信息！</h3>
	    		<%
	    	}
	    }else{
	    	%>
    		<h3 class="text-orange">该订单暂无详细订单信息！</h3>
    		<%
	    }
	    %>
	</div>
  </body>
</html>
