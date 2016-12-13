<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>优购网-yougo-about</title>
    
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
    <link rel="stylesheet" href="assets/vendor/jquery-Upload/css/fileinput.css">

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
	                        if(!loginid.equals("") && !loginname.equals("")){
	                         %>
	                         	<li class="float-left dropdown">
	                                <a class="no-underline pt-lg pb-md pl-md pr-md nav-hover dropdown-toggle" data-toggle="dropdown" href="javascript:;"><%=loginname %><b class="caret"></b></a>
	                            	<ul class="dropdown-menu">
						               <li><a href="content/us.jsp">个人设置</a></li>
						               <li class="divider"></li>
						               <li><a href="content/login_out.jsp">退出</a></li>
						            </ul>
	                            </li>
	                         <%}else{ %>
	                            <li class="float-left">
	                                <a class="no-underline pt-lg pb-md pl-md pr-md nav-hover" href="content/log_reg.jsp?type=login">登录</a>
	                            </li>
	                            <li class="float-left">
	                                <a class="no-underline pt-lg pb-md pl-md pr-md nav-hover" href="content/log_reg.jsp?type=register">注册</a>
	                            </li>
                            <%} %>
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
                <div id="mainContent" class="col-lg-offset-1 col-lg-10 col-md-offset-1 col-md-10 col-sm-offset-0 col-sm-12 col-xs-offset-0 col-xs-12 p-none mt-lg">
                    <div id="subNavigation" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center text-white border-bottom-mydark mb-md">
                        <a class="no-underline text-white" href="content/classify.jsp?page=1"><h2 class="col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark m-none pt-xlg pb-xs">APPLE</h2></a>
                        <a class="no-underline col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark text-lg pt-sm pb-sm mt-lg" href="content/classify.jsp?typeid=1&page=1">iPhone</a>
                        <a class="no-underline col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark text-lg pt-sm pb-sm mt-lg" href="content/classify.jsp?typeid=2&page=1">Mac</a>
                        <a class="no-underline col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark text-lg pt-sm pb-sm mt-lg" href="content/classify.jsp?typeid=3&page=1">iPad</a>
                        <a class="no-underline col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark text-lg pt-sm pb-sm mt-lg" href="content/classify.jsp?typeid=4&page=1">iWatch</a>
                        <a class="no-underline col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark text-lg pt-sm pb-sm mt-lg" href="content/classify.jsp?typeid=5&page=1">配件</a>
                    </div>
                    <div id="aboutHelp" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt-lg pb-lg mb-lg relative">
                       <h3>优购帮助</h3> 
                       <div class="col-lg-2 col-md-2 col-sm-3 col-xs-4 p-none">
                            <ul class="p-none mt-md listselect no-lsitview ul-borer bg-mydark text-center pt-xs pb-xs">
                                <li class="list-bottom text-md pt-xs pb-xs">
                                    <a class="no-underline text-muted pt-sm pb-sm pl-xs aboutselect" href="javascript:;">关于我们</a>
                                </li>
                                <li class="list-bottom text-md pt-xs pb-xs">
                                    <a class="no-underline text-muted pt-sm pb-sm pl-xs aboutselect" href="javascript:;">网站介绍</a>
                                </li>
                                <li class="list-bottom text-md pt-xs pb-xs">
                                    <a class="no-underline text-muted pt-sm pb-sm pl-xs aboutselect" href="javascript:;">网站未来</a>
                                </li>
                                <li class="text-md pt-xs pb-xs">
                                    <a class="no-underline text-muted pt-sm pb-sm pl-xs aboutselect" href="javascript:;">联系方式</a>
                                </li>
                            </ul> 
                        </div>
                        <div id="aboutContent" class="col-lg-10 col-md-10 col-sm-9 col-xs-8 text-center pt-lg height-min-limited">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 aboutlist">
                                <h3>关于优购</h3>
                                <hr/>
                                <p class="p-sm text-md text-left">优购网是一家做苹果特卖的购物网站，网站包含苹果手机、电脑、平板及其相关配件等产品的售卖，欢迎大家加入优购。</p>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 aboutlist">
                                <h3>yougo-优购</h3>
                                <hr/>
                                <p class="p-sm text-md text-left">优购网是一个苹果及其周边产品的购物网站！优购致力于苹果的周边产品，将第一手的苹果周边产品推送给你！我们不做苹果的制造者，我们只是苹果勤劳的搬运工！</p>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 aboutlist">
                                <h3>yougo and fulture</h3>
                                <hr/>
                                <p class="p-sm text-md text-left">优购网将会一直保持优秀的购物服务，为大家提供更多的保障。实时为用户推送最新的苹果产品。优购计划在未来配置自己的仓库和物流配送，尽心为用户带来给安全、快捷、贴心的便捷服务。</p>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 aboutlist">
                                <h3>联系我们</h3>
                                <hr/>
                                <p class="p-sm text-md">Email：<span>105734577@qq.com</span></p>
                                <p class="p-sm text-md">QQ：<span>105734577</span></p>
                                <p class="p-sm text-md">电话：<span>18817802281</span></p>
                                <p class="p-sm text-md">地址：<span>上海第二工业大学</span></p>
                                <p class="p-sm text-md">如果你有任何建议可以发邮件给我们，我们会留意你的建议！衷心感谢你为我们优购尽的每一分力！</p>
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
    <script src="content/assets/js/about_js.js"></script>
    <!-- add js -->
    <script src="assets/vendor/jquery-Upload/js/fileinput.js"></script>
    <script src="assets/vendor/jquery-Upload/js/fileinput_locale_zh.js"></script>
    <script>
    $(function(){      
          
    });  
    </script>
  </body>
</html>
