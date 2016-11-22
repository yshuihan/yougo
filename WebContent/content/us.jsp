<%@page import="com.yougo.impl.UserDaoImpl"%>
<%@ page language="java" import="java.util.*,java.text.*"
	pageEncoding="utf-8"%>
<%@page import="com.yougo.bean.User"%>
<%@page import="com.yougo.bean.Address"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>优购网-yougo-us</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- css vendor -->
<link rel="stylesheet"
	href="assets/vendor/bootstrap/css/bootstrap.min.css">
<!-- common css -->
<link rel="stylesheet" href="assets/css/common.css">
<link rel="stylesheet" href="content/assets/css/reset.css">
<link rel="stylesheet" href="assets/css/style.css">
<!-- person css -->
<link rel="stylesheet" href="content/assets/css/theme_yougo.css">
<!-- add css -->
<link rel="stylesheet"
	href="assets/vendor/datetimepicker/css/jquery.datetimepicker.css">
<link rel="stylesheet"
	href="assets/vendor/jquery-Upload/css/fileinput.css">
<style>
</style>
</head>

<body>
	<jsp:useBean id="userDaoImpl" class="com.yougo.impl.UserDaoImpl"
		scope="request"></jsp:useBean>
	<jsp:useBean id="adressDaoImpl" class="com.yougo.impl.AddressDaoImpl"
		scope="request"></jsp:useBean>
	<%
		String loginid="",loginname="",headimage="",oldPd="";
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
	<div id="main" class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div id="headContent"
				class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-none">
				<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-white text-lg theme-bg search-line-height">
					<div id="logo"
						class="col-lg-1 col-md-1 col-sm-1 col-xs-2 p-none pt-xs">
						<a class="no-underline" href="content/index.jsp"> <img
							class="img-responsive logo-size pull-right"
							src="assets/images/apple_icon.png" alt="优购网-yougo" />
						</a>
					</div>
					<div id="logReg"
						class="col-lg-2 col-md-2 col-sm-3 col-xs-3 mt-md mb-sm">
						<ul class="no-lsitview">
							<li class="float-left dropdown"><a
								class="no-underline pt-lg pb-md pl-md pr-md nav-hover dropdown-toggle"
								data-toggle="dropdown" href="javascript:;"><%=loginname%><b
									class="caret"></b></a>
								<ul class="dropdown-menu">
									<li><a href="content/us.jsp">个人设置</a></li>
									<li class="divider"></li>
									<li><a href="content/login_out.jsp">退出</a></li>
								</ul></li>
						</ul>
					</div>
					<div id="shopList"
						class="col-lg-3 col-lg-offset-0 col-md-3 col-md-offset-0 col-sm-4 col-sm-offset-0 col-xs-4 col-xs-offset-0 mt-md mb-sm pull-right">
						<ul class="no-lsitview">
							<li class="float-left"><a
								class="no-underline pt-lg pb-md pl-md pr-md nav-hover"
								href="content/order.jsp">我的订单</a></li>
							<li class="float-left"><a
								class="no-underline pt-lg pb-md pl-md pr-md nav-hover"
								href="content/shop.jsp">购物车</a></li>
						</ul>
					</div>
					<div id="search"
						class="col-lg-3 col-lg-offset-3 col-md-3 col-md-offset-3 col-sm-3 col-sm-offset-1 col-xs-3 col-xs-offset-0 mt-md mb-sm pull-left">
						<form action="content/search.jsp" method="get"
							accept-charset="utf-8">
							<div class="form-group m-none">
								<input id="searchInput" type="text" autocomplete="off"
									class="form-control onshow search-circle input-mydark search-input input-md pull-right text-md theme-bg text-white"
									name="pro"
									style="background-image: url(content/assets/images/Search_plus1.png); background-repeat: no-repeat; background-position: 95% 50%;">
							</div>
						</form>
					</div>
				</div>
			</div>
			<div id="mainContent"
				class="col-lg-offset-1 col-lg-10 col-md-offset-1 col-md-10 col-sm-offset-0 col-sm-12 col-xs-offset-0 col-xs-12 p-none mt-lg">
				<div id="subNavigation"
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center text-white border-bottom-mydark mb-md">
					<a class="no-underline text-white"
						href="content/classify.jsp?page=1"><h2
							class="col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark m-none pt-xlg pb-xs">APPLE</h2></a>
					<a
						class="no-underline col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark text-lg pt-sm pb-sm mt-lg"
						href="content/classify.jsp?typeid=1&page=1">iPhone</a> <a
						class="no-underline col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark text-lg pt-sm pb-sm mt-lg"
						href="content/classify.jsp?typeid=2&page=1">Mac</a> <a
						class="no-underline col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark text-lg pt-sm pb-sm mt-lg"
						href="content/classify.jsp?typeid=3&page=1">iPad</a> <a
						class="no-underline col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark text-lg pt-sm pb-sm mt-lg"
						href="content/classify.jsp?typeid=4&page=1">iWatch</a> <a
						class="no-underline col-lg-2 col-md-2 col-sm-2 col-xs-2 bg-mydark text-lg pt-sm pb-sm mt-lg"
						href="content/classify.jsp?typeid=5&page=1">配件</a>
				</div>
				<div id="usSet"
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt-lg pb-lg mb-lg relative">
					<h3>个人设置</h3>
					<div class="col-lg-2 col-md-2 col-sm-3 col-xs-4 p-none mt-xs">
						<ul
							class="p-none mt-md listselect no-lsitview ul-borer bg-mydark text-center pt-xs pb-xs">
							<li class="list-bottom text-md pt-xs pb-xs"><a
								class="no-underline text-muted pt-sm pb-sm pl-xs usselect"
								href="content/us.jsp?list=0">个人信息</a></li>
							<li class="list-bottom text-md pt-xs pb-xs"><a
								class="no-underline text-muted pt-sm pb-sm pl-xs usselect"
								href="content/us.jsp?list=1">物流地址</a></li>
							<li class="list-bottom text-md pt-xs pb-xs"><a
								class="no-underline text-muted pt-sm pb-sm pl-xs usselect"
								href="content/us.jsp?list=2">头像设置</a></li>
							<li class="text-md pt-xs pb-xs"><a
								class="no-underline text-muted pt-sm pb-sm pl-xs usselect"
								href="content/us.jsp?list=3">密码修改</a></li>
						</ul>
					</div>
					<div id="usContent"
						class="col-lg-10 col-md-10 col-sm-9 col-xs-8 height-min-limited">
						<%
							short usrid=1;
						                            if(!loginid.equals("")){
						                            	usrid= Short.parseShort(loginid);
						                            }
						                            User usr=userDaoImpl.findUser(usrid);
						                            String usrname = usr.getName();
						                            String usremail = usr.getEmail();
						                            String usrphone = usr.getPhone();
						                            String usrqq = usr.getQq();
						                            String usrbirth = usr.getBirthday();
						                            if(usrbirth==null||usrbirth.equals("")){
						                            	usrbirth="2007-12-06";
						                            }
						                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd") ; 
									        Date dt = null ;    
									        try{    
									            dt = sdf.parse(usrbirth) ;       
									        }catch(Exception e){         
									            e.printStackTrace() ;    
									        }
									        usrbirth = sdf.format(dt);
						                            String usradress = usr.getAdress();
						                            headimage=usr.getHeadimage();
						                            oldPd=usr.getPassword();
						%>
						<div id="uslist"
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 uslist pt-xlg">
							<div
								class="col-lg-7 col-md-9 col-sm-10 col-xs-12 col-lg-offset-2 col-md-offset-1 col-sm-offset-0 col-xs-offset-0 text-right">
								<div class="form-group mt-md pt-lg">
									<label for="username" class="col-sm-3 control-label">用户名</label>
									<div class="col-sm-9">
										<p class="text-center"><%=usrname%></p>
									</div>
								</div>
								<div class="form-group mt-md pt-lg">
									<label for="email" class="col-sm-3 control-label">邮箱</label>
									<div class="col-sm-9">
										<p class="text-center"><%=usremail%></p>
									</div>
								</div>
								<div class="form-group mt-md pt-lg">
									<label for="phone" class="col-sm-3 control-label">手机</label>
									<div class="col-sm-9">
										<p class="text-center"><%=usrphone%></p>
									</div>
								</div>
								<div class="form-group mt-md pt-lg">
									<label for="QQ" class="col-sm-3 control-label">QQ</label>
									<div class="col-sm-9">
										<p class="text-center"><%=usrqq%></p>
									</div>
								</div>
								<div class="form-group mt-md pt-lg">
									<label for="birth" class="col-sm-3 control-label">出生日期</label>
									<div class="col-sm-9">
										<p class="text-center"><%=usrbirth%></p>
									</div>
								</div>
								<div class="form-group mt-md pt-lg">
									<label for="adress" class="col-sm-3 control-label">家庭地址</label>
									<div class="col-sm-9">
										<p class="text-center"><%=usradress%></p>
									</div>
								</div>
								<div class="form-group pt-lg pt-lg">
									<div class="col-sm-12">
										<button id="useditbtn" type="button"
											class="btn btn-mydark width-p100">edit</button>
									</div>
								</div>
							</div>
						</div>
						<div id="usmessage"
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pt-xlg">
							<form action="content/usmessage.jsp" method="post"
								onsubmit="return us_Message();"
								class="form-horizontal col-lg-7 col-md-9 col-sm-10 col-xs-12 col-lg-offset-2 col-md-offset-1 col-sm-offset-0 col-xs-offset-0"
								role="form">
								<div class="form-group mt-md pt-md">
									<label for="username" class="col-sm-3 control-label">用户名</label>
									<div class="col-sm-9">
										<input type="text" value="<%=usrname%>" id="usName"
											class="form-control input-mydark" name="name"
											placeholder="请输入用户名">
									</div>
								</div>
								<div class="form-group mt-md pt-md">
									<label for="email" class="col-sm-3 control-label">邮箱</label>
									<div class="col-sm-9">
										<input type="text" value="<%=usremail%>" id="usEmail"
											class="form-control input-mydark" name="email"
											placeholder="请输入邮箱">
									</div>
								</div>
								<div class="form-group mt-md pt-md">
									<label for="phone" class="col-sm-3 control-label">手机</label>
									<div class="col-sm-9">
										<input type="text" value="<%=usrphone%>" id="usPhone"
											class="form-control input-mydark" name="phone"
											placeholder="请输入手机">
									</div>
								</div>
								<div class="form-group mt-md pt-md">
									<label for="QQ" class="col-sm-3 control-label">QQ</label>
									<div class="col-sm-9">
										<input type="text" value="<%=usrqq%>" id="usQq"
											class="form-control input-mydark" name="QQ"
											placeholder="请输入QQ">
									</div>
								</div>
								<div class="form-group mt-md pt-md">
									<label for="birth" class="col-sm-3 control-label">出生日期</label>
									<div class="col-sm-9">
										<input type="text" value="<%=usrbirth%>" id="usBirth"
											class="form-control input-mydark" name="birth"
											placeholder="请选择出生日期">
									</div>
								</div>
								<div class="form-group mt-md pt-md">
									<label for="adress" class="col-sm-3 control-label">家庭地址</label>
									<div class="col-sm-9">
										<input type="text" value="<%=usradress%>" id="usAdress"
											class="form-control input-mydark" name="adress"
											placeholder="请输入家庭地址">
									</div>
								</div>
								<div class="form-group pt-lg pb-lg">
									<div class="col-sm-6">
										<button type="submit" class="btn btn-mydark width-p100">submit</button>
									</div>
									<div class="col-sm-6">
										<button id="usmessage_back" type="reset"
											class="btn btn-mydark width-p100">back</button>
									</div>
								</div>
							</form>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 uslist">
							<div id="userAddress"
								class="col-lg-12 col-md-12 col-sm-12 col-xs-12 table-responsive mt-md">
								<table class="table table-hover">
									<caption>
										<h3 class="text-center pb-md">
											我的物流地址
											<button id="btnAdd" type="button"
												class="btn btn-mydark ml-md"
												onclick="window.location='content/us.jsp?edtp=add'">添加</button>
										</h3>
									</caption>
									<thead>
										<tr>
											<th>ID</th>
											<th>姓名</th>
											<th>电话</th>
											<th>地址</th>
											<th>邮编</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<%
											String str ="select * from adress where userid="+loginid;
	                                        int ad_i=0;
	                                        Collection<Address> cpdtad=adressDaoImpl.getAdresss(str);
											Iterator<Address> cpditerad=cpdtad.iterator(); 
	                                        while(cpditerad.hasNext()){ 
	  											Address ad=(Address)cpditerad.next();
	  											ad_i++;
	  											String pageUrl = "content/us.jsp?edtp=edit&";
										%>
										<tr>
											<td class="line-td"><%=ad_i%></td>
											<td class="line-td"><%=ad.getName()%></td>
											<td class="line-td"><%=ad.getPhone()%></td>
											<td class="line-td"><%=ad.getAdress()%></td>
											<td class="line-td"><%=ad.getCode()%></td>
											<td class="line-td">
												<button type="button"
													class="btn btn-mydark width-p100 btn-edit"
													onclick="window.location='<%=pageUrl+"adid="+ad.getId()%>'">修改</button>
											</td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
							<%
								String adid=request.getParameter("adid");
							                                String name="",phone="",address="",code="";
								     						if(adid!=null && !adid.equals("")){
								     						Address addr=adressDaoImpl.findAdress(Short.parseShort(adid));
								     							name=addr.getName();
								     							phone=addr.getPhone();
								     							address=addr.getAdress();
								     							code=addr.getCode();
								     						}
							%>
							<div id="addeditAddress"
								class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pb-md">
								<div class="pt-sm pb-sm bg-mydark text-center text-white">
									<h3>添加地址</h3>
								</div>
								<div class="pt-md pb-md">
									<form action="content/addressControl.jsp" method="post"
										onsubmit="return address_form();"
										class="form-horizontal col-lg-7 col-md-9 col-sm-10 col-xs-12 col-lg-offset-2 col-md-offset-1 col-sm-offset-0 col-xs-offset-0"
										role="form">
										<div class="form-group mt-md pt-md">
											<label for="userName" class="col-sm-3 control-label">姓名</label>
											<div class="col-sm-9">
												<input type="text" class="form-control input-mydark"
													name="name" value="<%=name %>" id="userName"
													placeholder="请输入姓名">
											</div>
										</div>
										<div class="form-group mt-md pt-md">
											<label for="phone" class="col-sm-3 control-label">电话</label>
											<div class="col-sm-9">
												<input type="text" class="form-control input-mydark"
													name="phone" value="<%=phone %>" id="phone"
													placeholder="请输入电话">
											</div>
										</div>
										<div class="form-group mt-md pt-md">
											<label for="address" class="col-sm-3 control-label">地址</label>
											<div class="col-sm-9">
												<input type="text" class="form-control input-mydark"
													name="address" value="<%=address %>" id="address"
													placeholder="请输入地址">
											</div>
										</div>
										<div class="form-group mt-md pt-md">
											<label for="code" class="col-sm-3 control-label">邮编</label>
											<div class="col-sm-9">
												<input type="text" class="form-control input-mydark"
													name="code" value="<%=code %>" id="code"
													placeholder="请输入邮编">
											</div>
										</div>
										<input type="text" class="form-control input-mydark"
											name="adid" value="<%=adid %>" style="display: none;">
										<input type="text" class="form-control input-mydark"
											name="addtp" id="addtype" value="add" style="display: none;">
										<div class="form-group mt-md pt-md">
											<div class="col-sm-6">
												<button id="btnSubmit" type="submit"
													class="btn btn-mydark width-p100">submit</button>
											</div>
											<div class="col-sm-6">
												<button type="reset" class="btn btn-mydark width-p100">reset</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 uslist pt-xlg">
							<div
								class="col-lg-7 col-md-9 col-sm-10 col-xs-12 col-lg-offset-2 col-md-offset-1 col-sm-offset-0 col-xs-offset-0 mb-lg">
								<div class="col-sm-12 mt-md">
									<img class="img-limit-size img-circle" src="<%=headimage %>">
								</div>
								<div class="col-sm-6 mt-md text-lg">
									用户名：<span class="ml-md"><%=loginname %></span>
								</div>
								<div class="col-sm-6 mt-md">
									<button id="editImage" type="button"
										class="btn btn-mydark width-p100">修改头像</button>
								</div>
								<%-- <%
                                   	String message="";
									if(session.getAttribute("message")!=null){
									  	message=session.getAttribute("message").toString();
									}
                                    %>
                                    <p class="mt-lg pt-md text-red"><%=message %></p> --%>
							</div>
							<form id="uploadImage" method="POST"
								action="${pageContext.request.contextPath}/servlet/UploadHandleServlet"
								ENCTYPE="multipart/form-data"
								class="form-horizontal col-lg-7 col-md-9 col-sm-10 col-xs-12 col-lg-offset-2 col-md-offset-1 col-sm-offset-0 col-xs-offset-0 mt-md"
								role="form">
								<div class="form-group">
									<input id="fileImage" class="file  input-mydark" name="file"
										type="file" multiple data-max-file-count="1"
										placeholder="请选择图片"> <input type="hidden"
										name="uploadtype" value="useriamge">
								</div>
							</form>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 uslist pt-xlg">
							<form action="content/pdedit.jsp" method="post"
								onsubmit="return pd_edit();"
								class="form-horizontal col-lg-7 col-md-9 col-sm-10 col-xs-12 col-lg-offset-2 col-md-offset-1 col-sm-offset-0 col-xs-offset-0"
								role="form">
								<div class="form-group">
									<label for="oldPassword" class="col-sm-3 control-label">旧密码</label>
									<div class="col-sm-9">
										<input type="password" jspValue="<%=oldPd %>"
											class="form-control input-mydark" id="oldPassword"
											placeholder="请输入旧密码">
									</div>
								</div>
								<div class="form-group">
									<label for="newPassword" class="col-sm-3 control-label">新密码</label>
									<div class="col-sm-9">
										<input type="password" class="form-control input-mydark"
											name="password" id="newPassword" placeholder="请输入新密码">
									</div>
								</div>
								<div class="form-group">
									<label for="rePassword" class="col-sm-3 control-label">密码重复</label>
									<div class="col-sm-9">
										<input type="password" class="form-control input-mydark"
											id="rePassword" placeholder="请再次输入密码">
									</div>
								</div>
								<div class="form-group pt-lg pb-lg">
									<div class="col-sm-6">
										<button type="submit" class="btn btn-mydark width-p100">submit</button>
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
			<div id="footContent">
				<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-none mt-xlg text-center">
					<div
						class="col-lg-12 col-md-12 col-sm-12 col-xs-12 bg-mydark text-md pt-sm pb-sm">
						<a class="no-underline text-white ml-md mr-md"
							href="content/about.jsp">关于我们</a> <a
							class="no-underline text-white ml-md mr-md"
							href="content/about.jsp">网站介绍</a> <a
							class="no-underline text-white ml-md mr-md"
							href="content/about.jsp">网站未来</a> <a
							class="no-underline text-white ml-md mr-md"
							href="content/about.jsp">联系方式</a>
					</div>
					<div
						class="col-lg-offset-1 col-lg-10 col-md-offset-1 col-md-10 col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10 pt-sm pb-sm">
						<a class="no-underline" href="javascript:;">@本网站版权由jude所有
							2015-2018</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%}else{ 
		//response.sendRedirect("log_reg.jsp?type=login");
		%>
	<%} %>
	<!-- js vendor -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!-- person js -->
	<script src="content/assets/js/yougo_js.js"></script>
	<script src="content/assets/js/us_js.js"></script>
	<!-- add js -->
	<script src="assets/vendor/datetimepicker/js/jquery.datetimepicker.js"></script>
	<script src="assets/vendor/jquery-Upload/js/fileinput.js"></script>
	<script src="assets/vendor/jquery-Upload/js/fileinput_locale_zh.js"></script>
	<script>
		$(function() {
			$('#usBirth').datetimepicker({
				format : "20y-m-d h:i:s"
			});
		});
	</script>
</body>
</html>
