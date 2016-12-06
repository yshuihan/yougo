<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.yougo.bean.Evaluation"%>
<%@page import="com.yougo.bean.Protype"%>
<%@page import="com.yougo.bean.Product"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>优购网-yougo-evaluation</title>
    
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
	                        	String loginid="",loginname="";
	                        	                        if(session.getAttribute("loginid")!=null && session.getAttribute("loginname")!=null){
	                        	                        	loginid=session.getAttribute("loginid").toString();
	                        	                        	loginname=session.getAttribute("loginname").toString();
	                        	                        }else{
	                        	                        	response.sendRedirect("log_reg.jsp?type=login");
	                        	                        }
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
	                                <input id="searchInput" type="text" autocomplete="off" class="form-control onshow search-circle input-mydark search-input input-md pull-right text-md theme-bg text-white" name="pro" style="background-image:url(content/assets/images/Search_plus1.png);background-repeat:no-repeat;background-position:95% 50%;">
	                            </div>
	                        </form>
	                    </div>
	                </div>
	            </div>
	            <jsp:useBean id="productServiceImpl" class="com.yougo.serviceImpl.ProductServiceImpl" scope="request"></jsp:useBean>
                <jsp:useBean id="proTypeServiceImpl" class="com.yougo.serviceImpl.ProTypeServiceImpl" scope="request"></jsp:useBean>
                <%
			    	String prid=request.getParameter("pid");
			    	String proname="";
			    	Product pd;
			    	Protype ptp;
			    	String olUrl=request.getHeader("Referer");
			    	if(prid==null){
			    		response.sendRedirect(olUrl);
			    	}else{
				    	short pid=Short.parseShort(prid);
				    	pd=productServiceImpl.findProduct(pid);
						short protypeid=pd.getTypeid();
						ptp=proTypeServiceImpl.findProtype(protypeid);
						proname=pd.getName();
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
                    <div id="breadCrumbs" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt-md">
                        <h4>
                            <a class="no-underline text-muted" href="content/classify.jsp">APPLE</a>
                            <span class="pl-xs pr-xs">></span>
                            <a class="no-underline text-muted" href="content/classify.jsp?typeid=<%=pd.getTypeid() %>"><%=ptp.getType() %></a>
                        </h4>
                    </div>
                    <div id="evaluationContent" class="col-lg-offset-1 col-lg-10 mt-lg pb-lg mb-lg relative">
                        <div id="proImage" class="col-lg-8 col-md-8 col-sm-8 col-xs-7 mt-md mb-lg">
                            <a class="no-underline text-dark" href="content/detail.jsp?pid=<%=pd.getId() %>">
                                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5 bgimg-cover image-height-size box-shadow" style="background-image: url(<%=pd.getIndeximage() %>)"></div>
                            </a>
                            <h4 class="col-lg-7 col-md-7 col-sm-7 col-xs-7 absolute title-name-ab"><a class="no-underline text-dark" href="content/detail.jsp?pid=<%=pd.getId() %>"><%=pd.getName() %></a></h4>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-5 pull-right text-md p-lg mt-xlg box-shadow">
                            <h4 class="pb-xs">商品满意度</h4>
                            <div class="satisfaction mt-sm">商品:
                               <span class="glyphicon glyphicon-star ml-xs"></span>
                               <span class="glyphicon glyphicon-star ml-xs"></span>
                               <span class="glyphicon glyphicon-star ml-xs"></span>
                               <span class="glyphicon glyphicon-star ml-xs"></span> 
                               <span class="glyphicon glyphicon-star ml-xs"></span> 
                            </div>
                            <div class="satisfaction mt-sm">物流:
                               <span class="glyphicon glyphicon-star ml-xs"></span>
                               <span class="glyphicon glyphicon-star ml-xs"></span>
                               <span class="glyphicon glyphicon-star ml-xs"></span>
                               <span class="glyphicon glyphicon-star ml-xs"></span> 
                               <span class="glyphicon glyphicon-star ml-xs"></span> 
                            </div>
                            <div class="satisfaction mt-sm">总评:
                               <span class="glyphicon glyphicon-star ml-xs all-eva"></span>
                               <span class="glyphicon glyphicon-star ml-xs all-eva"></span>
                               <span class="glyphicon glyphicon-star ml-xs all-eva"></span>
                               <span class="glyphicon glyphicon-star ml-xs all-eva"></span> 
                               <span class="glyphicon glyphicon-star ml-xs all-eva"></span> 
                            </div>
                        </div>
                        <form class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-none" action="content/evaluationdl.jsp" method="post"> 
                        	<input type="hidden" name="pid" value="<%=prid %>" />
                        	<input id="Starnum" type="hidden" name="star" value="0" />
	                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt-md mb-lg border-top-mydark pt-md">
	                            <textarea name="content" class="form-control mt-md input-mydark" rows="5" placeholder="留言"></textarea>
	                            <button type="submit" class="btn btn-success pull-right mt-md"><span class="glyphicon glyphicon-shopping-cart mr-sm"></span>评价</button>
	                        </div>
                        </form>
                    </div>
                </div>
                <%} %>
                <div id="footContent">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-none mt-xlg text-center">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 bg-mydark text-md pt-sm pb-sm">
                            <a class="no-underline text-white ml-md mr-md" href="content/about.jsp">关于我们</a>
                            <a class="no-underline text-white ml-md mr-md" href="content/about.jsp">网站介绍</a>
                            <a class="no-underline text-white ml-md mr-md" href="content/about.jsp">网站未来</a>
                            <a class="no-underline text-white ml-md mr-md" href="content/about.jsp">联系方式</a>
                        </div>
                        <div class="col-lg-offset-1 col-lg-10 col-md-offset-1 col-md-10 col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10 pt-sm pb-sm">
                            <a class="no-underline" href="javascript:;">@本网站版权由AlphaGao所有  2016-2018</a>
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
    <script src="content/assets/js/evaluation_js.js"></script>
    <!-- add js -->
    <script>
    $(function(){      
          
    });  
    </script>
  </body>
</html>
