<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.yougo.bean.Manager"%>
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
  <jsp:useBean id="managerDaoImpl" class="com.yougo.impl.ManagerDaoImpl" scope="request"></jsp:useBean>
    <div class="manage_list col-lg-10 col-lg-offset-1">
	    <div class="table-responsive">
	        <table class="table table-hover">
	            <caption><h3 class="text-center pb-md">管理信息查看</h3></caption>
	            <thead>
	                <tr>
	                    <th>ID</th>
	                    <th>用户名</th>
	                    <th>邮箱</th>
	                </tr>
	            </thead>
	            <tbody>
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
			   	String str="select * from manager order by id "+limited;
			   	String query="select * from manager order by id ";
   				Collection<Manager> cmgr=managerDaoImpl.getManager(str);
   				Iterator<Manager> mgriter=cmgr.iterator();
   				int allcount = managerDaoImpl.managerNum(query);
			   	int allpage =1;
				if(allcount%pagecount==0)
				{
					allpage = allcount/pagecount;
				}else{
					allpage = allcount/pagecount+1;
				} 
   				while(mgriter.hasNext()){ 
					Manager mgr=(Manager)mgriter.next();
	             %>
	                <tr>
	                    <td class="line-td"><%=mgr.getId() %></td>
	                    <td class="line-td"><%=mgr.getName() %></td>
	                    <td class="line-td"><%=mgr.getEmail() %></td>
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
	</div>
  </body>
</html>
