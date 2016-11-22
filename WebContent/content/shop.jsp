<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.yougo.bean.Shopcart"%>
<%@page import="com.yougo.bean.Product"%>
<%@page import="com.yougo.bean.Address"%>
<%@page import="com.yougo.bean.Style"%>
<%@page import="com.yougo.bean.Protype"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>优购网-yougo-shop</title>
    
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
    <style>
    .table>tbody>tr>td{
        line-height: 50px;
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
	                        	String loginid="",loginname="";
	                        	                        	                        if(session.getAttribute("loginid")==null || session.getAttribute("loginname")==null ||session.getAttribute("loginid")=="" || session.getAttribute("loginname")=="")
	                        	                        	                       	{
	                        	                        	                        	response.sendRedirect("log_reg.jsp?type=login");
	                        	                        	                        }
	                        	                        	                        if(session.getAttribute("loginid")!=null && session.getAttribute("loginname")!=null){
	                        	                        	                        	loginid=session.getAttribute("loginid").toString();
	                        	                        	                        	loginname=session.getAttribute("loginname").toString();
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
	            <jsp:useBean id="productDaoImpl" class="com.yougo.impl.ProductDaoImpl" scope="request"></jsp:useBean>
    			<jsp:useBean id="shopcartDaoImpl" class="com.yougo.impl.ShopcartDaoImpl" scope="request"></jsp:useBean>
  				<jsp:useBean id="adressDaoImpl" class="com.yougo.impl.AddressDaoImpl" scope="request"></jsp:useBean>
                <jsp:useBean id="styleDaoImpl" class="com.yougo.impl.StyleDaoImpl" scope="request"></jsp:useBean>
                <jsp:useBean id="protypeDaoImpl" class="com.yougo.impl.ProtypeDaoImpl" scope="request"></jsp:useBean>
  				<div id="mainContent" class="col-lg-offset-1 col-lg-10 col-md-offset-1 col-md-10 col-sm-offset-0 col-sm-12 col-xs-offset-0 col-xs-12 p-none pt-xlg mt-lg">
                    <div id="subNavigation" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center text-white border-bottom-mydark mb-md">
                        <a class="no-underline text-white" href="content/classify.jsp?page=1"><h2 class="col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark m-none pt-xlg pb-xs">APPLE</h2></a>
                        <a class="no-underline col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark text-lg pt-sm pb-sm mt-lg" href="content/classify.jsp?typeid=1&page=1">iPhone</a>
                        <a class="no-underline col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark text-lg pt-sm pb-sm mt-lg" href="content/classify.jsp?typeid=2&page=1">Mac</a>
                        <a class="no-underline col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark text-lg pt-sm pb-sm mt-lg" href="content/classify.jsp?typeid=3&page=1">iPad</a>
                        <a class="no-underline col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark text-lg pt-sm pb-sm mt-lg" href="content/classify.jsp?typeid=4&page=1">iWatch</a>
                        <a class="no-underline col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark text-lg pt-sm pb-sm mt-lg" href="content/classify.jsp?typeid=5&page=1">配件</a>
                    </div>
                    <div id="orderList" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt-lg pb-lg mb-lg relative">
                        <h3><span class="glyphicon glyphicon-shopping-cart mr-sm"></span>我的购物车</h3> 
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <%
                            	String addrstr="select * from adress where userid=" + loginid+ " order by id ";
                            	                        Collection<Address> ccaddr=adressDaoImpl.getAdresss(addrstr);
                            					Iterator<Address> addriter=ccaddr.iterator();
                            					String spctstr="select * from shopcart where userid=" + loginid+ " order by id ";
                            					Collection<Shopcart> ccspct=shopcartDaoImpl.getShopcart(spctstr);
                            					Iterator<Shopcart> spctiter=ccspct.iterator();
                            %>
                            <div id="userAddress" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt-md mb-lg">
                                <h4>选择物流地址：</h4>
                                <%
                                	while(addriter.hasNext()){ 
                                	  								Address addr=(Address)addriter.next();
                                %>
                                <a class="no-underline theme-color add-href" addrvalue="<%=addr.getId() %>" href="javascript:;">
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-5 mr-md mt-md theme-orange-border address-list">
                                    <div class="col-lg-11 col-md-11 col-sm-11 col-xs-10 p-none">
                                        <h5><%=addr.getName() %></h5>
                                        <p><%=addr.getCode() %></p>
                                        <p><%=addr.getPhone() %></p>
                                        <p><%=addr.getAdress() %></p>
                                    </div>
                                    <span class="true-address pull-right glyphicon glyphicon-ok"></span>
                                </div>
                            </a>
                            <%} %>
                            </div>
                             <form class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-none" action="content/shopcreate.jsp" method="post"> 
	                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt-lg">
	                                <div class="col-lg-1 col-md-1 col-sm-2 col-xs-3 p-none">
	                                    <span class="mr-sm">全选</span>
	                                    <input id="allselect" type="checkbox">
	                                </div>
	                                <button type="submit" name="empty" class="btn btn-danger pull-right"><span class="glyphicon glyphicon-trash pr-xs"></span>清空</button>
	                                <button type="submit" name="delete" class="btn btn-danger pull-right"><span class="glyphicon glyphicon-remove pr-xs"></span>删除</button>
	                            </div>
	                            <input id="ipaddrid" type="hidden" name="addrid"  value="">
	                            <div class="table-responsive col-lg-12 col-md-12 col-sm-12 col-xs-12 border-top-mydark mt-lg pt-md">
	                                <table class="table table-hover">
	                                    <thead>
	                                        <tr>
	                                            <th></th>
	                                            <th></th>
	                                            <th>商品名称</th>
	                                            <th>款式</th>
	                                            <th>单价</th>
	                                            <th>数量</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                    <%
	                                    if(ccspct.size()>0){
				                       		while(spctiter.hasNext()){ 
				  								Shopcart spct=(Shopcart)spctiter.next();
				  								Product opd=productDaoImpl.findProduct(spct.getProid());
				  								Style osty=styleDaoImpl.findStyle(spct.getStyleid());
			                            %>
	                                        <tr>
	                                            <td class="line-td pt-lg pb-lg">
	                                                <input class="sl-pro" name="spck" value="<%=spct.getId() %>" type="checkbox">
	                                            </td>
	                                            <td class="line-td pt-lg pb-lg td-line-height">
	                                                <a class="no-underline text-dark" href="content/detail.jsp?pid=<%=spct.getProid() %>">
	                                                    <div class="circle bgimg-cover tb-pro-size" style="background-image: url(<%=opd.getIndeximage() %>);"></div> 
	                                                </a>
	                                            </td>
	                                            <td class="line-td pt-lg pb-lg"><a class="no-underline text-dark" href="content/detail.jsp?pid=<%=spct.getProid() %>"><%=opd.getName() %></a></td>
	                                            <td class="line-td pt-lg pb-lg"><%=osty.getName() %></td>
	                                            <td class="line-td pt-lg pb-lg"><%=spct.getPrice() %></td>
	                                            <td class="line-td pt-lg pb-lg">
													<form>
														<button type="button" class="btn-add btn-num-set theme-orange-bg text-center text-white text-lg" onclick="window.location='content/shopnum.jsp?numtp=add&scid=<%=spct.getId() %>&pnum=<%=spct.getNum() %>'">+</button>
														<input class="num-pro ml-md mr-md text-center" name="numpro" type="text" autocomplete="off" scnum="<%=spct.getNum() %>" scid="<%=spct.getId() %>" value="<%=spct.getNum() %>" />
														<button type="button" class="btn-reduce btn-num-set theme-orange-bg text-center text-white text-lg" onclick="window.location='content/shopnum.jsp?numtp=reduce&scid=<%=spct.getId() %>&pnum=<%=spct.getNum() %>'">-</button>
													</form>
												</td>
	                                            <%-- <td class="line-td pt-lg pb-lg"><%=spct.getNum() %></td>  --%>
	                                        </tr>
	                                    <%
	                                    	}
	                                    }else{
	                                    	%>
	                                    	<tr>
	                                    	<td class="line-td pt-lg pb-lg">
                                            </td>
                                            <td class="line-td pt-lg pb-lg">
                                            </td>
	                                    	<td class="line-td pt-lg pb-lg">
	                                    		<h4 class="text-center text-orange">主人我的肚子空空的，好饿啊！有吃的吗?_?<span class="glyphicon glyphicon-cutlery ml-md"></span></h4>
	                                    	</td>
	                                    	</tr>
	                                    	<%
	                                    } 
	                                    %>
	                                    </tbody>
	                                </table>
	                            </div>
	                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 border-top-mydark pt-md pb-md">
	                                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 p-none">
	                                    <textarea name="content" class="form-control mt-md input-mydark" rows="3" placeholder="留言"></textarea>
	                                </div>
	                                <div class="col-lg-offset-2 col-lg-2 col-md-offset-2 col-md-2 col-sm-offset-2 col-sm-2 col-xs-offset-0 col-xs-4 mt-lg text-right">
	                                    <button type="submit" name="clearing" class="btn btn-success"><span class="glyphicon glyphicon-shopping-cart mr-sm"></span>结算</button>
	                                </div>
	                            </div>
                            </form>
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
                            <a class="no-underline" href="javascript:;">@本网站版权由jude所有  2015-2018</a>
                        </div>
                    </div>
                </div>
            </div>
            
     <!-- js vendor -->
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- person js -->
    <script src="content/assets/js/yougo_js.js"></script>
    <!-- add js -->
    <script>
    $(function(){      
          
    });  
    </script>
  </body>
</html>
