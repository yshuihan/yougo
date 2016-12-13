<%@page import="javax.print.attribute.standard.PDLOverrideSupported"%>
<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="utf-8"%>
<%@page import="com.yougo.bean.Product"%>
<%@page import="com.yougo.bean.Style"%>
<%@page import="com.yougo.bean.Order"%>
<%@page import="com.yougo.bean.Orderdetail"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>优购网-yougo-order</title>
    
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
	                         	                         	//response.sendRedirect("log_reg.jsp?type=login");
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
                <div id="mainContent" class="col-lg-offset-1 col-lg-10 col-md-offset-1 col-md-10 col-sm-offset-0 col-sm-12 col-xs-offset-0 col-xs-12 p-none pt-xlg mt-lg">
                    <div id="subNavigation" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center text-white border-bottom-mydark mb-md">
                        <a class="no-underline text-white" href="content/classify.jsp?page=1"><h2 class="col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark m-none pt-xlg pb-xs">APPLE</h2></a>
                        <a class="no-underline col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark text-lg pt-sm pb-sm mt-lg" href="content/classify.jsp?typeid=1&page=1">iPhone</a>
                        <a class="no-underline col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark text-lg pt-sm pb-sm mt-lg" href="content/classify.jsp?typeid=2&page=1">Mac</a>
                        <a class="no-underline col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark text-lg pt-sm pb-sm mt-lg" href="content/classify.jsp?typeid=3&page=1">iPad</a>
                        <a class="no-underline col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark text-lg pt-sm pb-sm mt-lg" href="content/classify.jsp?typeid=4&page=1">iWatch</a>
                        <a class="no-underline col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark text-lg pt-sm pb-sm mt-lg" href="content/classify.jsp?typeid=5&page=1">配件</a>
                    </div>
                    <jsp:useBean id="productServiceImpl" class="com.yougo.serviceImpl.ProductServiceImpl" scope="request"></jsp:useBean>
               		<jsp:useBean id="styleServiceImpl" class="com.yougo.serviceImpl.StyleServiceImpl" scope="request"></jsp:useBean>
                    <jsp:useBean id="orderServiceImpl" class="com.yougo.serviceImpl.OrderServiceImpl" scope="request"></jsp:useBean>
					<jsp:useBean id="orderDetailServiceImpl" class="com.yougo.serviceImpl.OrderDetailServiceImpl" scope="request"></jsp:useBean>
                    <%
                    int pagecount = 4;
                	String pagenum=request.getParameter("page");
                	if(pagenum==null){
                		pagenum="1";
                	}
                	int start=(Integer.parseInt(pagenum)-1)*pagecount;
                	String limited="limit " + start + "," + pagecount;
                    String list="0",state="";	
                    if(request.getParameter("list")!=null&&!request.getParameter("list").equals("")){
                    	list=request.getParameter("list");
                    }
                    if(list.equals("1")){
                    	state=" and state!='已签收'";
                    }
                    if(list.equals("2")){
                    	state=" and state='已签收'";
                    }
                    String odstr="select * from orders where userid="+loginid+state+" order by createtime desc "; 
                    String odquery="select * from orders where userid="+loginid+state+" order by createtime desc "+limited; 
                    Collection<Order> cordr=orderServiceImpl.getOrder(odquery);
					Iterator<Order> ordriter=cordr.iterator(); 
					int allcount = orderServiceImpl.orderNum(odstr);
					int allpage =1;
					if(allcount%pagecount==0)
					{
						allpage = allcount/pagecount;
					}else{
						allpage = allcount/pagecount+1;
					}
                    %>
                    <div id="orderList" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt-lg pb-lg mb-lg relative">
                       <h3>我的订单</h3> 
                       <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3 p-none mt-lg">
                            <ul class="p-none mt-md listselect no-lsitview ul-borer bg-mydark text-center pt-xs pb-xs">
                                <li class="list-bottom text-md pt-xs pb-xs">
                                    <a class="no-underline text-muted pt-sm pb-sm pl-xs" href="content/order.jsp?list=0">所以订单</a>
                                </li>
                                <li class="list-bottom text-md pt-xs pb-xs">
                                    <a class="no-underline text-muted pt-sm pb-sm pl-xs" href="content/order.jsp?list=1">未签收</a>
                                </li>
                                <li class="text-md pt-xs pb-xs">
                                    <a class="no-underline text-muted pt-sm pb-sm pl-xs" href="content/order.jsp?list=2">已签收</a>
                                </li>
                            </ul> 
                       </div>
                        <div class="col-lg-10 col-md-10 col-sm-10 border-top-mydark col-xs-9 mt-lg">
                        <%
                        if(cordr.size()>0){
                        %>
                            <div class="table-responsive col-lg-12 col-md-12 col-sm-12 col-xs-12 pt-md">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>订单号</th>
                                            <th></th>
                                            <th>商品名称</th>
                                            <th>款式</th>
                                            <th>单价</th>
                                            <th>数量</th>
                                            <th>总价</th>
                                            <th>状态</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%
		                       		while(ordriter.hasNext()){ 
		  								Order ordr=(Order)ordriter.next();
		  								String odrdtstr="select * from orderdetail where orderid="+ordr.getId()+" order by id";
		  								Collection<Orderdetail> codrdt=orderDetailServiceImpl.getOrderdetail(odrdtstr);
										Iterator<Orderdetail> odrdtiter=codrdt.iterator();
										if(codrdt.size()==1){
											while(odrdtiter.hasNext()){ 
		  										Orderdetail odrdt=(Orderdetail)odrdtiter.next();
		  										Product opd=productServiceImpl.findProduct(odrdt.getProid());
		  										Style osty=styleServiceImpl.findStyle(odrdt.getStyleid());
		  										//out.print(opd.getIndeximage());
		                           	 %>
                                        <tr>
                                            <td class="line-td pt-lg pb-lg">
                                                <input type="checkbox">
                                            </td>
                                            <td class="line-td pt-lg pb-lg"><%=ordr.getOrdernumber() %></td>
                                            <td class="line-td pt-lg pb-lg td-line-height">
                                                <a class="no-underline text-dark" href="content/detail.jsp?pid=<%=odrdt.getProid() %>">
                                                    <div class="circle bgimg-cover tb-pro-size" style="background-image: url(<%=opd.getIndeximage() %>);"></div> 
                                                </a>
                                            </td>
                                            <td class="line-td pt-lg pb-lg"><a class="no-underline text-dark" href="content/detail.jsp?pid=<%=odrdt.getProid() %>"><%=opd.getName() %></a></td>
                                            <td class="line-td pt-lg pb-lg"><%=osty.getName() %></td>
                                            <td class="line-td pt-lg pb-lg"><%=odrdt.getPrice() %></td>
                                            <td class="line-td pt-lg pb-lg"><%=odrdt.getNum() %></td>
                                            <td class="line-td pt-lg pb-lg"><%=odrdt.getPrice()*odrdt.getNum() %></td>
                                            <td class="line-td pt-lg pb-lg"><%=ordr.getState() %></td>
                                            <td class="line-td">
                                            <%
                                            if(ordr.getState().equals("发货中")){
                                            %>
                                                <button type="button" onclick="window.location='content/ordercontrol.jsp?orderid=<%=ordr.getId() %>'" class="btn btn-mydark">签收</button>
                                            <%} %>
                                            <%
                                            if(ordr.getState().equals("已签收")){
                                            %>
                                                <button type="button" onclick="window.location='content/evaluation.jsp?pid=<%=odrdt.getProid() %>'" class="btn btn-mydark">评价</button>
                                            <%} %>
                                            </td> 
                                        </tr>
                                        <%} }%>
                                        <%
                                        if(codrdt.size()>1){
                                        %>
                                        <tr>
                                            <td class="line-td">
                                                <input type="checkbox">
                                            </td>
                                            <td class="line-td"><%=ordr.getOrdernumber() %></td>
                                            <td class="line-td"></td>
                                            <td class="line-td"></td>
                                            <td class="line-td"></td>
                                            <td class="line-td"></td>
                                            <td class="line-td"></td>
                                            <td class="line-td"></td>
                                            <td class="line-td">
                                            <%
                                            if(ordr.getState().equals("发货中")){
                                            %>
                                                <button type="button" onclick="window.location='content/ordercontrol.jsp?orderid=<%=ordr.getId() %>'" class="btn btn-mydark">签收</button>
                                            <%} %>
                                            </td>
                                            <td class="line-td">
                                                <span id="up<%=ordr.getOrdernumber() %>" class="order-up p-md glyphicon glyphicon-chevron-up" listid="<%=ordr.getOrdernumber() %>"></span>
                                                <span id="down<%=ordr.getOrdernumber() %>" class="order-down p-md glyphicon glyphicon-chevron-down" listid="<%=ordr.getOrdernumber() %>"></span>
                                            </td> 
                                            <%
                                            while(odrdtiter.hasNext()){ 
		  										Orderdetail odrdt=(Orderdetail)odrdtiter.next();
		  										Product opd=productServiceImpl.findProduct(odrdt.getProid());
		  										Style osty=styleServiceImpl.findStyle(odrdt.getStyleid());
                                            %>
                                            <tr class="add-pro add-pro<%=ordr.getOrdernumber() %>">
                                                <td class="pt-lg pb-lg"></td>
                                                <td class="pt-lg pb-lg"></td>
                                                <td class="line-td pt-lg pb-lg td-line-height">
                                                    <a class="no-underline text-dark" href="content/detail.jsp?pid=<%=odrdt.getProid() %>">
	                                                    <div class="circle bgimg-cover tb-pro-size" style="background-image: url(<%=opd.getIndeximage() %>);"></div> 
	                                                </a>
                                                </td>
                                                <td class="line-td pt-lg pb-lg"><a class="no-underline text-dark" href="content/detail.jsp?pid=<%=odrdt.getProid() %>"><%=opd.getName() %></a></td>
                                                <td class="line-td pt-lg pb-lg"><%=osty.getName() %></td>
                                                <td class="line-td pt-lg pb-lg"><%=odrdt.getPrice() %></td>
	                                            <td class="line-td pt-lg pb-lg"><%=odrdt.getNum() %></td>
	                                            <td class="line-td pt-lg pb-lg"><%=odrdt.getPrice()*odrdt.getNum() %></td>
	                                            <td class="line-td pt-lg pb-lg"><%=ordr.getState() %></td>
                                                <td class="line-td">
                                                <%
                                                if(ordr.getState().equals("已签收")){
                                                %>
                                                    <button type="button" onclick="window.location='content/evaluation.jsp?pid=<%=odrdt.getProid() %>'" class="btn btn-mydark">评价</button>
                                                <%} %>
                                                </td> 
                                            </tr>
                                            <%} %> 
                                        </tr>
                                        <%} %>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    <%} %>
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
	                        		String pageUrl = "content/order.jsp?";
	                        		if(request.getParameter("list")!=null){
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
						<%}else{
                        	%>
                        	<h4 class="mt-lg text-orange text-center">暂无相关订单！</h4>
                        	<%
                        } %>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 border-top-mydark"></div>
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
            
     <!-- js vendor -->
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- person js -->
    <script src="content/assets/js/yougo_js.js"></script>
    <!-- add js -->
    <script>
    $(function(){      
          
    }); 
    function gotoeva(){
        location.href="content/evaluation.jsp";
    }
    </script>
  </body>
</html>
