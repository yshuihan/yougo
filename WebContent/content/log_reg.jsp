<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>优购网-yougo-log_reg</title>
    
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
    <link rel="stylesheet" href="content/assets/css/animation.css">
    <!-- add css -->
    <link rel="stylesheet" href="assets/vendor/swiper/css/swiper.min.css">
    <style type="text/css" media="screen">
        .logo-width{
            width: 80px;
        }  
    </style>
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
            <div id="content" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-none relative">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-none bgimg-cover opacity80 login-height pt-xlg pl-xlg">
                    <div class="col-lg-4 col-md-4 col-sm-5 col-xs-0 p-none mt-lg pl-sm">
                        <div id="imgLog" class="col-lg-offset-1 col-lg-10 col-md-offset-1 col-md-10 col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10 p-none box-shadow animation-rotateone">
                            <img class="img-responsive" src="content/assets/images/photo/log_reg.jpg">
                        </div>
                    </div>
                    <div class="col-lg-offset-2 col-lg-4 col-md-offset-2 col-md-5 col-sm-offset-0 col-sm-6 col-xs-offset-2 col-xs-8 p-none mt-lg pl-sm pr-sm">
                        <div id="tabContainer" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-none">    
                            <ul id="myTab" class="nav nav-tabs text-center">
                                <li id="logintab" class="col-lg-6 col-md-6 col-sm-6 col-xs-6 p-none active"><a href="content/log_reg.jsp?type=login"><h4 class="m-none mt-xs mb-xs">LOGIN</h4></a></li>
                                <li id="registertab" class="col-lg-6 col-md-6 col-sm-6 col-xs-6 p-none"><a href="content/log_reg.jsp?type=register"><h4 class="m-none mt-xs mb-xs">REGISTER</h4></a></li>
                            </ul>
                            <div id="myTabContent" class="tab-content">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-none tab-pane fade in active" id="tblogin">
                                    <div id="login" class="theme-orange-border col-lg-12 col-md-12 col-sm-12 col-xs-12 p-none">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center theme-orange-bg login-box-height pt-xlg">
                                            <h1 class="m-none mt-xlg pt-xlg text-white">LOGIN</h1>
                                            <p class="pt-sm text-white">REGISTER&gt;&gt;</p>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 bg-grey">
                                            <form action="content/login_ok.jsp" method="post" onsubmit="return login_True();" class="form-horizontal">
                                                <div class="form-group mt-md pt-md">
                                                    <label for="email" class="col-sm-3 control-label">邮箱</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control input-mydark" name="email" id="email" placeholder="请输入邮箱">
                                                    </div>
                                                </div>
                                                <div class="form-group mt-md pt-md">
                                                    <label for="password" class="col-sm-3 control-label">密码</label>
                                                    <div class="col-sm-9">
                                                        <input type="password" class="form-control input-mydark" name="password" id="password" placeholder="请输入密码">
                                                    </div>
                                                </div>
                                                <div class="form-group pt-lg pb-lg mb-lg">
                                                    <div class="col-sm-6">
                                                        <button id="Login" type="submit" class="btn btn-mydark width-p100">login</button>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <button type="reset" class="btn btn-mydark width-p100">reset</button>
                                                    </div>
                                                </div>
                                            </form> 
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-none tab-pane fade" id="tbregister">
                                    <div id="register" class="theme-orange-border col-lg-12 col-md-12 col-sm-12 col-xs-12 p-none">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center theme-orange-bg login-box-height pt-xlg">
                                            <h1 class="m-none mt-xlg pt-xlg text-white">REGISTER</h1>
                                            <p class="pt-sm text-white">&lt;&lt;LOGIN</p>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 bg-grey">
                                            <form action="content/register.jsp" method="post" onsubmit="return register_True();" class="form-horizontal">
                                                <div class="form-group mt-md pt-md">
                                                    <label for="remail" class="col-sm-3 control-label">邮箱</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control input-mydark" name="email" id="remail" placeholder="请输入邮箱">
                                                    </div>
                                                </div>
                                                <div class="form-group mt-md pt-md">
                                                    <label for="rusername" class="col-sm-3 control-label">用户名</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control input-mydark" name="name" id="rusername" placeholder="请输入用户名">
                                                    </div>
                                                </div>
                                                <div class="form-group mt-md pt-md">
                                                    <label for="rpassword" class="col-sm-3 control-label">密码</label>
                                                    <div class="col-sm-9">
                                                        <input type="password" class="form-control input-mydark" name="password" id="rpassword" placeholder="请输入密码">
                                                    </div>
                                                </div>
                                                <div class="form-group mt-md pt-md">
                                                    <label for="rrepassword" class="col-sm-3 control-label">*密码</label>
                                                    <div class="col-sm-9">
                                                        <input type="password" class="form-control input-mydark" name="repassword" id="rrepassword" placeholder="请再次输入密码">
                                                    </div>
                                                </div>
                                                <div class="form-group pt-lg pb-lg mb-lg">
                                                    <div class="col-sm-6">
                                                        <button id="Register" type="submit" class="btn btn-mydark width-p100">register</button>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <button type="reset" class="btn btn-mydark width-p100">reset</button>
                                                    </div>
                                                </div>
                                            </form> 
                                        </div>
                                    </div>
                                </div>
                            </div>  
                        </div>
                    </div>
                </div> 
            </div>
            <div id="footContent">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-none text-center">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 bg-mydark text-md pt-sm pb-sm">
                        <a class="no-underline text-white ml-md mr-md" href="content/about.jsp">关于我们</a>
                        <a class="no-underline text-white ml-md mr-md" href="content/about.jsp">网站介绍</a>
                        <a class="no-underline text-white ml-md mr-md" href="content/about.jsp">网站未来</a>
                        <a class="no-underline text-white ml-md mr-md" href="content/about.jsp">联系方式</a>
                    </div>
                    <div class="col-lg-offset-1 col-lg-10 col-md-offset-1 col-md-10 col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10 pt-sm pb-sm">
                        <a class="no-underline" href="javascript:;">@本网站版权由jude所有  2015-2018</a>
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
    <script src="content/assets/js/log_reg.js"></script>
    <!-- add js -->
    <script src="assets/vendor/swiper/js/swiper.jquery.min.js"></script>
    <script>
    $(function(){     
    });
    </script>
  </body>
</html>
