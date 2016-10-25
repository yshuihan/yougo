<%@ page language="java" import="java.util.*,java.lang.*" pageEncoding="utf-8"%>
<%@page import="com.jdbc.Product"%>
<%@page import="com.jdbc.Style"%>
<%@page import="com.jdbc.Protype"%>
<%@page import="com.jdbc.Proimages"%>
<%@page import="com.jdbc.Evaluation"%>
<%@page import="com.jdbc.User"%>
<%@page import="com.jdbc.Order"%>
<%@page import="com.jdbc.Orderdetail"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>优购网-yougo-detail</title>
    
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
    <link rel="stylesheet" href="assets/vendor/swiper/css/swiper.min.css">
	<style type="text/css">
	.swiper-wrapper {
	    height: 65px;
	}
	.btn-xs, .btn-group-xs>.btn {
	    padding: 4px 6px;
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
                <jsp:useBean id="productDaoImpl" class="com.jdbc.ProductDaoImpl" scope="request"></jsp:useBean>
                <jsp:useBean id="styleDaoImpl" class="com.jdbc.StyleDaoImpl" scope="request"></jsp:useBean>
                <jsp:useBean id="proimagesDaoImpl" class="com.jdbc.ProimagesDaoImpl" scope="request"></jsp:useBean>
                <jsp:useBean id="protypeDaoImpl" class="com.jdbc.ProtypeDaoImpl" scope="request"></jsp:useBean>
                <jsp:useBean id="evaluationDaoImpl" class="com.jdbc.EvaluationDaoImpl" scope="request"></jsp:useBean>
                <jsp:useBean id="userDaoImpl" class="com.jdbc.UserDaoImpl" scope="request"></jsp:useBean>
                <jsp:useBean id="orderDaoImpl" class="com.jdbc.OrderDaoImpl" scope="request"></jsp:useBean>
                <jsp:useBean id="orderdetailImpl" class="com.jdbc.OrderdetailImpl" scope="request"></jsp:useBean>
			    <%
			    	String prid=request.getParameter("pid");
			    	String proname="",styleid="";
			    	Product pd;
			    	Collection<Style> clsty;
			    	Collection<Proimages> cpis;
			    	Iterator<Style> styiter;
			    	Iterator<Proimages> pisiter;
			    	Protype ptp;
			    	if(prid==null){
			    		response.sendRedirect("classify.jsp");
			    	}else{
				    	short pid=Short.parseShort(prid);
				    	pd=productDaoImpl.findProduct(pid);
				    	clsty=styleDaoImpl.findStyleByProid(pid);
						styiter=clsty.iterator(); 
						cpis=proimagesDaoImpl.findProimagesByproid(pid);
						pisiter=cpis.iterator();
						short protypeid=pd.getTypeid();
						ptp=protypeDaoImpl.findProtype(protypeid);
						proname=pd.getName();
						Long clnum=pd.getClicknum();
						clnum++;
						int cl=productDaoImpl.updateclicknum(clnum, Short.parseShort(prid));
						//out.print(cl);
						
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
                    <div id="detailProduct" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-none mt-lg">
                        <div id="productContent" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mb-lg">
                            <div id="imagesShow" class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 ml-md p-none box-shadow">
                                    <img id="proImage" class="img-responsive" src="<%=pd.getIndeximage() %>">
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9 p-none mt-md box-shadow">
                                    <div class="swiper-container">
                                        <div class="swiper-wrapper">
                                        	<%
	                                   		while(pisiter.hasNext()){ 
			      								Proimages pis=(Proimages)pisiter.next();
	                                    	 %>
                                            <div class="swiper-slide col-lg-4 col-md-4 col-sm-4 col-xs-4 p-none p-xs">
                                                <img class="img-responsive images-show" alt="<%=pis.getImagealt() %>" src="<%=pis.getImagesrc() %>">
                                            </div>
                                            <%
                                            }
                                             %>
                                        </div>
                                        <!-- Add Arrows -->
                                        <div class="swiper-button-next"></div>
                                        <div class="swiper-button-prev"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
	                            <form class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-none" action="content/createOrder.jsp" method="post">
	                                <h3><a class="no-underline text-dark" href="content/detail.jsp?pid=<%=pd.getId() %>"><%=pd.getName() %></a></h3>
	                                <div class="text-md mt-sm">价格：
	                                    <span class="text-lg mr-lg text-orange">¥<span><%=pd.getPrice() %></span></span>
	                                    <del class="text-sm">¥<span><%=pd.getOldprice() %></span></del>
	                                </div>
	                                <div class="text-md mb-md mt-sm">选择款式：
	                                    <ul class="no-lsitview mt-md">
	                                    	<%
	                                   		while(styiter.hasNext()){ 
			      								Style sty=(Style)styiter.next();
			      								styleid=sty.getId().toString();
	                                    	 %>
	                                        <li class="styl-id style-list float-left border-mydark-blod ml-md mt-md" styleValue="<%=styleid %>">
	                                            <%
	                                            if(sty.getImage()!=null &&!sty.getImage().equals("")){
	                                            %>
	                                            <img class="detail-img-size" src="<%=sty.getImage() %>" alt="">
	                                            <%} %>
	                                            <span class="text-sm pr-sm p-md"><%=sty.getName() %></span>
	                                        </li>
	                                        <%
	                                        }
	                                         %>
	                                    </ul>
	                                </div>
	                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pt-lg mt-lg">
	                                    <div class="col-lg-4 col-md-7 col-sm-7 col-xs-7">
	                                        <input id="buyNum" name="pronum" class="col-lg-5 col-md-4 col-sm-4 col-xs-5 form-control text-center input-lg input-mydark input-num" value="1" />
	                                            <button id="numAdd" type="button" class="btn btn-success btn-xs btn-num"><span class="glyphicon glyphicon-plus"></span></button><br/>
	                                            <button id="numMinus" type="button" class="btn btn-success btn-xs btn-num"><span class="glyphicon glyphicon-minus"></span></button>
	                                    </div>
	                                    <input id="iptStid" type="text" class="form-control input-mydark" name="styleid"  value="" style="display: none;">
	                                    <input type="text" class="form-control input-mydark" name="pid"  value="<%=pid %>" style="display: none;">
	                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-6">
	                                        <button type="submit" class="btn btn-success width-p100 mt-md"><span class="glyphicon glyphicon-plus mr-sm"></span>立即购买</button>
	                                    </div>
	                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-6">
	                                        <button type="submit" name="addshop" class="btn btn-success width-p100 mt-md"><span class="glyphicon glyphicon-shopping-cart mr-sm"></span>加入购物车</button>
	                                    </div>
	                                </div>
	                            </form>
                            </div>
                        </div>
                        <%
                        String theUrl="content/detail.jsp?pid="+prid;
                         %>
                        <div id="detailContent" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-none mt-lg pt-lg">
                            <ul id="myTab" class="nav nav-tabs">
                                <li id="tbdetail" class="active"><a href="<%=theUrl+"&tabtp=detail" %>"><h4 class="m-none mt-xs mb-xs">商品详情</h4></a></li>
                                <li id="tbevaluation"><a href="<%=theUrl+"&tabtp=evaluation" %>"><h4 class="m-none mt-xs mb-xs">商品评价</h4></a></li>
                            </ul>
                            <div id="myTabContent" class="tab-content">
                                <div class="tab-pane pt-lg pl-sm pr-sm pb-md fade in active" id="detail">
                                    <div id="detailMessage" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-sm pt-md pb-lg mb-lg border-bottom-mydark">
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                            <p class="">商品名称：<span></span><%=pd.getName() %></p>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                            <p class="">商品编号：<span></span><%=pd.getProcode() %></p>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                            <p class="">品牌：<span></span>Apple</p>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                            <p class="">上架时间：<span></span><%=pd.getGrounding() %></p>
                                        </div>
                                    </div>
                                    <h3 class="text-center pt-lg">相关参数</h3>
                                    <div id="proParameters" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center text-sm pt-lg pb-lg">
                                         <%=pd.getParameter() %>
                                    </div>
                                </div>
                                <%
                                String content="",createtime="",evauser="",promess="";
                                short star=0;
                                String tabtp=request.getParameter("tabtp");
                                int pagecount = 5;
			                	String pagenum=request.getParameter("page");
			                	if(pagenum==null){
			                		pagenum="1";
			                	}
			                	int start=(Integer.parseInt(pagenum)-1)*pagecount;
			                	String limited="limit " + start + "," + pagecount;
			                	String str,query;
			                	str="select * from evaluation where proid=" + pid+ " order by id ";
			                	query=str+limited;
						    	Collection<Evaluation> ceva=evaluationDaoImpl.getEvaluation(query);
								Iterator<Evaluation> evaiter=ceva.iterator(); 
								int allcount = evaluationDaoImpl.evaluationNum(str);
								int allpage =1;
								if(allcount%pagecount==0)
								{
									allpage = allcount/pagecount;
								}else{
									allpage = allcount/pagecount+1;
								}
                                 %>
                                <div class="tab-pane pt-lg pl-sm pr-sm pb-md fade" id="evaluation">
                                     <div id="evaContent" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-sm pt-lg pb-lg">
                                       <%
                                       if(tabtp!=null &&tabtp.equals("evaluation")){
		                                	if(ceva.size()>0){
                                        %>
                                       <div class="table-responsive">
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th class="col-lg-4 col-md-4 col-sm-4 col-xs-4">评价心得</th>
                                                        <th class="col-lg-2 col-md-2 col-sm-2 col-xs-2">顾客满意度</th>
                                                        <th class="col-lg-2 col-md-2 col-sm-2 col-xs-2">购买信息</th>
                                                        <th class="col-lg-2 col-md-2 col-sm-2 col-xs-2">评论者</th>
                                                        <th class="col-lg-2 col-md-2 col-sm-2 col-xs-2">评价时间</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <%
                                                while(evaiter.hasNext()){ 
  													Evaluation eva=(Evaluation)evaiter.next();
  													content=eva.getContent();
  													createtime=eva.getCreatetime();
  													star =eva.getStar();
  													User usr=userDaoImpl.findUser(eva.getUserid());
  													evauser=usr.getName();
  													promess=proname+"  ";
  													
                                                 %>
                                                    <tr>
                                                       <td class="line-td pt-lg pb-lg"><%=content %></td>
                                                       <td class="line-td pt-lg pb-lg">
                                                       <%
                                                       for(int i=0;i<5;i++){
                                                 			if(i<star){
                                                        %>
                                                           <span class="glyphicon glyphicon-star text-orange"></span>
                                                        <%
                                                       		}else{
                                                       		%>
                                                       		<span class="glyphicon glyphicon-star"></span>
                                                       		<%
                                                       		}
                                                       }
                                                        %>
                                                       </td>
                                                       <td class="line-td pt-lg pb-lg"><%=promess %></td>
                                                       <td class="line-td pt-lg pb-lg"><%=evauser %></td>
                                                       <td class="line-td pt-lg pb-lg"><%=createtime %></td> 
                                                    </tr>
                                                <% } %>
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
			                        		String pageUrl = "content/detail.jsp?pid="+prid+"&tabtp=evaluation";
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
				                                <li><a href="<%=pageUrl+"&page="+k%>">&laquo;</a></li>
				                                <%} %>
				                                <%
				                                for(int i=1;i<=licount;i++){
				                                	if(pageNow==i){ 
				                                 %>
			                                    		<li class="active"><a href="javascript:;"><%=i %></a></li>
					                                <%
					                                }else{
					                                %>
				                                		<li><a href="<%=pageUrl+"&page="+i%>"><%=i %></a></li>
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
				                                <li><a href="<%=pageUrl+"&page="+k%>">&raquo;</a></li>
				                                <%} %>
			                                </ul>  
			                            </div>
			                        </div>
                                        <%
                                        	}else{
                                        		%>
                                        		<h4 class="text-orange text-center mt-md">暂无相关评价！</h4>
                                        		<%
                                        	}
                                         }
                                         %>
                                    </div>
                                </div>
                            </div>
                        </div> 
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
    <script src="content/assets/js/detail_js.js"></script>
    <!-- add js -->
    <script src="assets/vendor/swiper/js/swiper.jquery.min.js"></script>
    <script>
    $(function(){      
         
    });  
    function addShop(){
        location.href="content/shop.jsp";
    }
    function buyNow(){
        location.href="content/createOrder.jsp";
    }
    </script>
  </body>
</html>
