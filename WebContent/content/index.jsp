<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>优购网-yougo-index</title>
    
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
	<style type="text/css">
	.swiper-wrapper {
	    height: 407.625px;
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
	                         <%
	                         }else{ 
	                         %>
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
                <div id="mainContent" class="height-size">
                    <div id="carousel" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-none">
                        <!-- Swiper -->
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <img class="img-responsive" src="content/assets/images/photo/k1.jpg"/>
                                </div>
                                <div class="swiper-slide">
                                    <img class="img-responsive" src="content/assets/images/photo/k2.jpg"/>
                                </div>
                                <div class="swiper-slide">
                                    <img class="img-responsive" src="content/assets/images/photo/k3.jpg"/>
                                </div>
                            </div>
                            <!-- Add Pagination -->
                            <div class="swiper-pagination"></div>
                            <!-- Add Arrows -->
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>
                        </div>
                    </div>
                    <div id="animationContent" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-none relative onshow">
                        <div class="col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4 p-lg onshow" id="imgComputer">
                            <img class="img-responsive" src="content/assets/images/photo/top-computer.png" alt="">
                        </div>
                        <div class="col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4 p-lg absolute shopcart-ani onshow" id="imgShopCart">
                            <img class="img-responsive" src="content/assets/images/photo/shopcart.png" alt="">
                        </div>
                        <div class="col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4 p-lg absolute Mac-ani onshow" id="imgMac">
                            <img class="img-responsive" src="content/assets/images/photo/mac.png" alt="">
                        </div>
                        <div class="col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4 p-lg absolute Iphone-ani onshow" id="imgIphone">
                            <img class="img-responsive" src="content/assets/images/photo/iphone.png" alt="">
                        </div>
                        <div class="col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4 p-lg absolute Ipad-ani onshow" id="imgIpad">
                            <img class="img-responsive" src="content/assets/images/photo/ipad.png" alt="">
                        </div>
                        <div class="col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4 p-lg absolute text-ani onshow" id="imgTest">
                            <h2 class=""><a class="text-dark go-shop" href="content/classify.jsp?page=1">开始购物<span class="glyphicon glyphicon-shopping-cart ml-xs"></span></a></h2>
                        </div>
                    </div>
                    <div id="newContent" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 grey-bg">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 bgimg-cover newpro-height relative" style="background-image:url(content/assets/images/photo/hero_large1.png)">
                            <div class="text-center absolute newpro-position1">
                                <a href="content/detail.jsp?pid=14"><h4>iPad mini4</h4></a>
                                <p>小身型，大有身手！</p>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 bgimg-cover newpro-height relative" style="background-image:url(content/assets/images/photo/hero_large2.jpg)">
                            <div class="text-center absolute newpro-position2">
                                <a href="content/detail.jsp?pid=14"><h4>IOS10</h4></a>
                                <p>现已推出</p>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 bgimg-cover newpro-height relative" style="background-image:url(content/assets/images/photo/hero_large3.png)">
                            <div class="text-center absolute newpro-position3">
                                <h4>全新Apple Pencil</h4>
                                <p>为iPad Pro而来</p>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 bgimg-cover newpro-height relative" style="background-image:url(content/assets/images/photo/hero_large4.jpg)">
                            <div class="text-center absolute newpro-position4">
                                <h4>iMac</h4>
                                <p>Retina的大作，一款又一款！</p>
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
    <script src="content/assets/js/nav_list.js"></script>
    <!-- add js -->
    <script src="assets/vendor/swiper/js/swiper.jquery.min.js"></script>
    <script>
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        slidesPerView: 1,
        paginationClickable: true,
        spaceBetween: 30,
        loop: true,
        autoplay: 3000
    });
    </script>
  </body>
</html>
