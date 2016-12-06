<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.yougo.bean.Product"%>
<%@page import="com.yougo.bean.Evaluation"%>
<%@page import="com.yougo.bean.User"%>
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
  <jsp:useBean id="productServiceImpl" class="com.yougo.serviceImpl.ProductServiceImpl" scope="request"></jsp:useBean>
  <jsp:useBean id="evaluationServiceImpl" class="com.yougo.serviceImpl.EvaluationServiceImpl" scope="request"></jsp:useBean>
  <jsp:useBean id="userServiceImpl" class="com.yougo.serviceImpl.UserServiceImpl" scope="request"></jsp:useBean>
    <div class="manage_list col-lg-10 col-lg-offset-1">
	    <div class="table-responsive">
	        <table class="table table-hover">
	            <caption><h3 class="text-center pb-md">商品信息</h3></caption>
	            <thead>
	                <tr>
	                    <th>ID</th>
	                    <th>商品</th>
	                    <th>操作</th>
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
			   	String str="select * from product order by id "+limited;
			   	String query="select * from product order by id ";
			   	Collection<Product> cpd=productServiceImpl.getProduct(str);
			   	Iterator<Product> pditer=cpd.iterator(); 
			   	int allcount = productServiceImpl.productNum(query);
			   	int allpage =1;
				if(allcount%pagecount==0)
				{
					allpage = allcount/pagecount;
				}else{
					allpage = allcount/pagecount+1;
				}
				while(pditer.hasNext()){ 
					Product pd=(Product)pditer.next();
					String pageUrl = "admin/admin.jsp?";
		    		if(list!=null){
	           			pageUrl+="list="+list+"&";
	           		}
	           		if(pagenum!=null){
	           			pageUrl+="page="+pagenum+"&";
	           		}
			    %>
	                <tr>
	                    <td class="line-td"><%=pd.getId() %></td>
	                    <td class="line-td"><%=pd.getName() %></td>
	                    <td class="line-td">
	                        <button type="button" class="btn btn-mydark" onclick="window.location='<%=pageUrl+"pdid="+pd.getId() %>'">查看</button>
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
	    String pdid=request.getParameter("pdid");
	    if(pdid!=null){
		    int secpagecount = 5;
		    String secpagenum=request.getParameter("secpage");
		    if(secpagenum==null){
		   		secpagenum="1";
		   	}
		   	int secstart=(Integer.parseInt(secpagenum)-1)*secpagecount;
		   	String seclimited="limit " + secstart + "," + secpagecount;
		   	String secstr="select * from evaluation where proid=" + pdid+" order by id "+seclimited;
		   	String secquery="select * from evaluation where proid=" + pdid+" order by id";
		   	Collection<Evaluation> ceva=evaluationServiceImpl.getEvaluation(secstr);
		   	Iterator<Evaluation> evaiter=ceva.iterator(); 
		   	int secallcount = evaluationServiceImpl.evaluationNum(secquery);
		   	int secallpage =1;
			if(secallcount%secpagecount==0)
			{
				secallpage = secallcount/secpagecount;
			}else{
				secallpage = secallcount/secpagecount+1;
			}
		   	if(ceva.size()!=0){
	     %>
	    <div id="proEva" class="table-responsive">
	        <table class="table table-hover">
	            <caption><h3 class="text-center pb-md">商品编号<%=pdid %>评价内容信息</h3></caption>
	            <thead>
	                <tr>
	                    <th>ID</th>
	                    <th>用户</th>
	                    <th>商品</th>
	                    <th>总体满意度(星级)</th>
	                    <th>评价内容</th>
	                    <th>评价时间</th>
	                </tr>
	            </thead>
	            <tbody>
	            <%
           		while(evaiter.hasNext()){ 
					Evaluation eva=(Evaluation)evaiter.next();
	            %>
	                <tr>
	                    <td class="line-td"><%=eva.getId() %></td>
	                    <td class="line-td">
	                    <%
	                    User oneusr=userServiceImpl.findUser(eva.getUserid());
	                    out.print(oneusr.getName());
	                     %>
	                    </td>
	                    <td class="line-td">
	                    <%
	                    Product onepd=productServiceImpl.findProduct(eva.getProid());
	                    out.print(onepd.getName());
	                     %>
	                    </td>
	                    <td class="line-td"><%=eva.getStar() %></td>
	                    <td class="line-td"><%=eva.getContent() %></td>
	                    <td class="line-td"><%=eva.getCreatetime() %></td>
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
	    		<h3 class="text-orange">该商品暂无评价信息！</h3>
	    		<%
	    	}
	    }else{
	    	%>
    		<h3 class="text-orange">该商品暂无评价信息！</h3>
    		<%
	    }
	    %>
	</div>
  </body>
</html>
