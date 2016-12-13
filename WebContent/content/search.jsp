<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.yougo.bean.Product"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>优购网-yougo-search</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- css vendor -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css"> 
    <!-- common css -->
    <link rel="stylesheet" href="assets/css/common.css">
    <link rel="stylesheet" href="content/assets/css/reset.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- person css -->
    <link rel="stylesheet" href="content/assets/css/theme_yougo.css">
    <!-- add css -->

  </head>
  
  <body>
    <div id="main" class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div id="headContent" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-none">
	                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-white text-lg theme-bg search-line-height">
	                    <div id="logo" class="col-lg-1 col-md-1 col-sm-1 col-xs-2 p-none pt-xs">
	                        <a class="no-underline" href="content/index.jsp">
	                        	<img class="img-responsive logo-size pull-right" src="assets/images/apple_icon.png" alt="优购网-yougo"/>
	                        </a>
	                    </div>
	                    <div id="logReg" class="col-lg-2 col-md-2 col-sm-3 col-xs-3 mt-md mb-sm">
	                        <ul class="no-lsitview">
	                        <%
	                        	/* String loginid = session.getAttribute("loginid").toString();
	                        	                    	String loginname = session.getAttribute("loginname").toString(); */
	                        	                        String loginid="",loginname="";
	                        	                        if(session.getAttribute("loginid")!=null){
	                        	                        	loginid=session.getAttribute("loginid").toString();
	                        	                        }
	                        	                        if(session.getAttribute("loginname")!=null){
	                        	                        	loginname=session.getAttribute("loginname").toString();
	                        	                        }
	                        	                        String pro=request.getParameter("pro");
	                        	                        pro=new String(pro.getBytes("iso-8859-1"),"utf-8");
	                        	                        if(!loginid.equals("") && !loginname.equals("")){
	                        %>
	                         	<li class="float-left dropdown">
	                                <a class="no-underline pt-lg pb-md pl-md pr-md nav-hover dropdown-toggle" data-toggle="dropdown" href="javascript:;"><%=loginname%><b class="caret"></b></a>
	                            	<ul class="dropdown-menu">
						               <li><a href="content/us.jsp">个人设置</a></li>
						               <li class="divider"></li>
						               <li><a href="content/login_out.jsp">退出</a></li>
						            </ul>
	                            </li>
	                         <%
	                         	}else{
	                         %>
	                            <li class="float-left">
	                                <a class="no-underline pt-lg pb-md pl-md pr-md nav-hover" href="content/log_reg.jsp?type=login">登录</a>
	                            </li>
	                            <li class="float-left">
	                                <a class="no-underline pt-lg pb-md pl-md pr-md nav-hover" href="content/log_reg.jsp?type=register">注册</a>
	                            </li>
                            <%
                            	}
                            %>
	                        </ul>
	                    </div>
	                    <div id="shopList" class="col-lg-3 col-lg-offset-0 col-md-3 col-md-offset-0 col-sm-4 col-sm-offset-0 col-xs-4 col-xs-offset-0 mt-md mb-sm pull-right">
	                        <ul class="no-lsitview">
	                            <li class="float-left">
	                                <a class="no-underline pt-lg pb-md pl-md pr-md nav-hover" href="content/order.jsp">我的订单</a>
	                            </li>
	                            <li class="float-left">
	                                <a class="no-underline pt-lg pb-md pl-md pr-md nav-hover" href="content/shop.jsp">购物车</a>
	                            </li>
	                        </ul>
	                    </div>
	                    <div id="search" class="col-lg-3 col-lg-offset-3 col-md-3 col-md-offset-3 col-sm-3 col-sm-offset-1 col-xs-3 col-xs-offset-0 mt-md mb-sm pull-left">
	                        <form action="content/search.jsp" method="get" accept-charset="utf-8">
	                            <div class="form-group m-none">
	                                <input id="searchInput" type="text" value="<%=pro%>" autocomplete="off" class="form-control onshow search-circle input-mydark search-input input-md pull-right text-md theme-bg text-white search-max" name="pro" style="background-image:url(content/assets/images/Search_plus1.png);background-repeat:no-repeat;background-position:95% 50%;">
	                            </div>
	                        </form>
	                    </div>
	                </div>
	            </div>
	            <jsp:useBean id="productServiceImpl" class="com.yougo.serviceImpl.ProductServiceImpl" scope="request"></jsp:useBean>
                <%
                	int pagecount = 12;
                	String odb = "id";
                	String pagenum=request.getParameter("page");
                	String orderby=request.getParameter("orderby");
                	if(pagenum==null){
                		pagenum="1";
                	}
                	if(orderby!=null){
                		if(orderby.equals("all")){
                			odb = "id";
                		}
                		if(orderby.equals("sale")){
                			odb = "salenum";
                		}
                		if(orderby.equals("hot")){
                			odb = "clicknum";
                		}
                		if(orderby.equals("price")){
                			odb = "price";
                		}
                		if(orderby.equals("time")){
                			odb = "grounding";
                		}
                	}
                	int start=(Integer.parseInt(pagenum)-1)*pagecount;
                	String limited=" limit " + start + "," + pagecount;
                	String str=null,query=null;
                	if(pro==null){
                		String oldUrl = request.getHeader("Referer");
						response.sendRedirect(oldUrl);
                	}else{
                		//pro=new String(pro.getBytes("iso-8859-1"),"utf-8");
                		str="select * from product where name like '%" + pro+ "%' order by " + odb+" desc";
                		query =str+limited;
                	}
			    	Collection<Product> cpdt=productServiceImpl.getProduct(query);
					Iterator<Product> cpditer=cpdt.iterator(); 
					int allcount = productServiceImpl.productNum(str);
					int allpage =1;
					if(allcount%pagecount==0)
					{
						allpage = allcount/pagecount;
					}else{
						allpage = allcount/pagecount+1;
					}
			     %>
                <div id="mainContent" class="col-lg-offset-1 col-lg-10 col-md-offset-1 col-md-10 col-sm-offset-0 col-sm-12 col-xs-offset-0 col-xs-12 p-none pt-xlg mt-lg">
                    <div id="subNavigation" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center text-white border-bottom-mydark mb-md">
                        <a class="no-underline text-white" href="content/classify.jsp?page=1"><h2 class="col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark m-none pt-xlg pb-xs">APPLE</h2></a>
                        <a class="no-underline col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark text-lg pt-sm pb-sm mt-lg" href="content/classify.jsp?typeid=1&page=1">iPhone</a>
                        <a class="no-underline col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark text-lg pt-sm pb-sm mt-lg" href="content/classify.jsp?typeid=2&page=1">Mac</a>
                        <a class="no-underline col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark text-lg pt-sm pb-sm mt-lg" href="content/classify.jsp?typeid=3&page=1">iPad</a>
                        <a class="no-underline col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark text-lg pt-sm pb-sm mt-lg" href="content/classify.jsp?typeid=4&page=1">iWatch</a>
                        <a class="no-underline col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark text-lg pt-sm pb-sm mt-lg" href="content/classify.jsp?typeid=5&page=1">配件</a>
                    </div>
                    <div id="selectCondition" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center p-none border-mydark">
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 p-none pt-sm pb-md text-white text-md bg-mydark">
                   			筛选<span class="glyphicon glyphicon-th-list ml-xs"></span>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 p-none p-sm text-white text-md bg-mydark">
                        	<a class="no-underline bg-mydark text-lg pt-sm pb-sm mt-lg" href="content/search.jsp?orderby=all&page=1&pro=<%=pro%>">
                        		综合<span class="glyphicon glyphicon-sort-by-attributes-alt ml-xs"></span>
                        	</a>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 p-none p-sm text-white text-md bg-mydark">
                        	<a class="no-underline bg-mydark text-lg pt-sm pb-sm mt-lg" href="content/search.jsp?orderby=sale&page=1&pro=<%=pro%>">
                        		热销<span class="glyphicon glyphicon-sort-by-attributes-alt ml-xs"></span>
                        	</a>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 p-none p-sm text-white text-md bg-mydark">
                        	<a class="no-underline bg-mydark text-lg pt-sm pb-sm mt-lg" href="content/search.jsp?orderby=hot&page=1&pro=<%=pro%>">
                        		热门<span class="glyphicon glyphicon-sort-by-attributes-alt ml-xs"></span>
                        	</a>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 p-none p-sm text-white text-md bg-mydark">
                        	<a class="no-underline bg-mydark text-lg pt-sm pb-sm mt-lg" href="content/search.jsp?orderby=price&page=1&pro=<%=pro%>">
                        		价格<span class="glyphicon glyphicon-sort-by-attributes-alt ml-xs"></span>
                        	</a>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 p-none p-sm text-white text-md bg-mydark">
                        	<a class="no-underline bg-mydark text-lg pt-sm pb-sm mt-lg" href="content/search.jsp?orderby=time&page=1&pro=<%=pro%>">
                        		上架时间<span class="glyphicon glyphicon-sort-by-attributes-alt ml-xs"></span>
                        	</a>
                        </div>
                    </div>
                    <div id="productShow" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-none mt-lg">
                        <div id="productList" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-none mt-md mb-md">
                            <%
                       		while(cpditer.hasNext()){ 
  								Product pd=(Product)cpditer.next();
                           	 %>
                            <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 theproduct p-none pl-sm pr-sm mt-md">
                                <a class="no-underline" href="content/detail.jsp?pid=<%=pd.getId() %>">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 bgimg-cover pro-size box-shadow" style="background-image: url(<%=pd.getIndeximage()%>)">
                                        
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 box-shadow pt-sm animation-show">
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 p-none">
	                                        <p class="text-orange text-md">
	                                            <span>¥</span>
	                                            <span><%=pd.getPrice() %></span>
	                                        </p>
                                        	<p class="text-ellipsis text-muted" title="<%=pd.getName() %>"><%=pd.getName() %></p>
                                    	</div>
                                    	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 p-none">
                                    		<p class="text-orange text-right pt-xs">sale：<%=pd.getSalenum() %></p>
                                    	</div>
                                    </div>
                                </a>
                            </div>
                            <%
                            }
                             %>
                        </div>
                        <div id="pageNum" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt-md mb-md">
                        	<%
                        		int licount = 5;
                        		int pageNow = Integer.parseInt(pagenum);
                                if(allpage<licount){
                                	licount=allpage;
                                }
                        		String pageUrl = "content/classify.jsp?";
                        		if(orderby!=null){
                        			pageUrl+="orderby="+orderby+"&";
                        		}
                        		if(pro!=null){
                        			pageUrl+="pro="+pro+"&";
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
                </div>
                <div id="footContent">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-none mt-xlg text-center">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 bg-mydark text-md pt-sm pb-sm">
                            <a class="no-underline text-white ml-md mr-md" href="content/about.jsp">关于我们</a>
                            <a class="no-underline text-white ml-md mr-md" href="content/about.jsp">网站介绍</a>
                            <a class="no-underline text-white ml-md mr-md" href="content/about.jsp">网站未来</a>
                            <a class="no-underline text-white ml-md mr-md" href="content/about.jsp">联系方式</a>
                        </div>
                        <div class="col-lg-offset-1 col-lg-10 col-md-offset-1 col-md-10 col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10 pt-sm pb-sm">
                            <a class="no-underline" href="javascript:;">@本网站版权由AlphaGao团队所有  2016-2018</a>
                        </div>
                    </div>
                </div>
            </div>
    </div>
     <!-- js vendor -->
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- person js -->
    <script src="content/assets/js/yougo_js.js"></script>
    <script src="content/assets/js/search_js.js"></script>
    <!-- add js -->
    <script>
    
    </script>
  </body>
</html>
