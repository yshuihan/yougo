<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.yougo.bean.User"%>
<%@page import="com.yougo.bean.Address"%>
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
  	<jsp:useBean id="userDaoImpl" class="com.yougo.impl.UserDaoImpl" scope="request"></jsp:useBean>
  	<jsp:useBean id="adressDaoImpl" class="com.yougo.impl.AddressDaoImpl" scope="request"></jsp:useBean>
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
       	String str="select * from user order by id "+limited;
       	String usrquery="select * from user order by id ";
       	Collection<User> cusr=userDaoImpl.getUser(str);
       	Iterator<User> usriter=cusr.iterator(); 
       	int allcount = userDaoImpl.userNum(usrquery);
       	int allpage =1;
    	if(allcount%pagecount==0)
    	{
    		allpage = allcount/pagecount;
    	}else{
    		allpage = allcount/pagecount+1;
    	}
    %>
    <div class="manage_list col-lg-10 col-lg-offset-1">
	    <div class="table-responsive">
	        <table class="table table-hover">
	            <caption><h3 class="text-center pb-md">用户信息</h3></caption>
	            <thead>
	                <tr>
	                    <th>ID</th>
	                    <th>用户名</th>
	                    <th>邮箱</th>
	                    <th>操作</th>
	                </tr>
	            </thead>
	            <tbody>
	            <%
	            	while(usriter.hasNext()){ 
	            			User usr=(User)usriter.next();
	            			String pageUrl = "admin/admin.jsp?";
	            		    		if(list!=null){
	            	           			pageUrl+="list="+list+"&";
	            	           		}
	            	           		if(pagenum!=null){
	            	           			pageUrl+="page="+pagenum+"&";
	            	           		}
	            %>
	                <tr>
	                    <td class="line-td"><%=usr.getId()%></td>
	                    <td class="line-td"><%=usr.getName()%></td>
	                    <td class="line-td"><%=usr.getEmail()%></td>
	                    <td class="line-td">
	                        <button type="button" class="btn btn-mydark" onclick="window.location='<%=pageUrl+"adusrid="+usr.getId()%>'">查看</button>
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
	             <%
	             	}else{ 
	             	             	int k =pageNow;
	             	             	k--;
	             %>
	             <li><a href="<%=pageUrl+"page="+k%>">&laquo;</a></li>
	             <%
	             	}
	             %>
	             <%
	             	for(int i=1;i<=licount;i++){
	             	             	if(pageNow==i){
	             %>
	                		<li class="active"><a href="javascript:;"><%=i%></a></li>
	              <%
	              	}else{
	              %>
	             		<li><a href="<%=pageUrl+"page="+i%>"><%=i%></a></li>
	             <%
	             	}
	             	             }
	             %>
	             <%
	             	if(pageNow>=allpage){
	             %>
	            	<li><a href="javascript:;">&raquo;</a></li>
	             <%
	             	}else{ 
	             	             	int k =pageNow;
	             	             	k++;
	             %>
	             <li><a href="<%=pageUrl+"page="+k%>">&raquo;</a></li>
	             <%
	             	}
	             %>
	            </ul>  
	        </div>
	    </div>
	    <%
	    	String adusrid=request.getParameter("adusrid");
	    	    if(adusrid!=null){
	    		    String query="select * from adress where userid=" + adusrid;
	    		   	Collection<Address> cadr=adressDaoImpl.getAdresss(query);
	    		   	Iterator<Address> adriter=cadr.iterator(); 
	    		   	if(cadr.size()!=0){
	    %>
	    <div id="userAddress" class="table-responsive">
	        <table class="table table-hover">
	            <caption><h3 class="text-center pb-md">用户编号<%=adusrid%>物流地址</h3></caption>
	            <thead>
	                <tr>
	                    <th>ID</th>
	                    <th>姓名</th>
	                    <th>电话</th>
	                    <th>地址</th>
	                    <th>邮编</th>
	                </tr>
	            </thead>
	            <tbody>
	            <%
	            	while(adriter.hasNext()){ 
	            			Address adr=(Address)adriter.next();
	            %>
	                <tr>
	                    <td class="line-td"><%=adr.getId() %></td>
	                    <td class="line-td"><%=adr.getName() %></td>
	                    <td class="line-td"><%=adr.getPhone() %></td>
	                    <td class="line-td"><%=adr.getAdress() %></td>
	                    <td class="line-td"><%=adr.getCode() %></td>
	                </tr>
	            <%} %>
	            </tbody>
	        </table>
	    </div>
	    <%
	    	}else{
	    		%>
	    		<h3 class="text-orange">该用户未添加物流地址！</h3>
	    		<%
	    	}
	    }
	    %> 
	</div>
  </body>
</html>
