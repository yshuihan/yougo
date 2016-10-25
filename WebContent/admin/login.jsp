<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>yougo-admin-login</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- css vendor -->
	<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
	<!-- common css -->
	<link rel="stylesheet" href="assets/css/common.css">
	<link rel="stylesheet" href="admin/assets/css/reset.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<!-- person css -->
	<link rel="stylesheet" href="admin/assets/css/manager_css.css">
  </head>
  
  <body>
    <div id="main" class="row">
		<div class="col-lg-12">
			<div class="panel panel-mydark no-radius">
				<div class="panel-heading no-radius">
					<h3 class="panel-title">
						<a class="no-underline text-white" href="javascript:;">manager-yougo</a>
					</h3>
				</div>
				<div class="panel-body width-p100 full-height pt-xlg">
					<div id="login" class="col-lg-offset-4 col-lg-4 mt-xlg pt-xlg">
						<div
							class="col-lg-12 text-center bg-mydark login-height pt-xlg text-white">
							<h1 class="m-none mt-xlg pt-xlg">LOGIN</h1>
						</div>
						<div class="col-lg-12 bg-grey">
							<form action="admin/login_ok.jsp" class="form-horizontal" role="form">
								<div class="form-group mt-md pt-md">
									<label for="email" class="col-sm-3 control-label">邮箱</label>
									<div class="col-sm-9">
										<input type="text" class="form-control input-mydark"
											id="email" name="email" placeholder="请输入邮箱">
									</div>
								</div>
								<div class="form-group mt-md pt-md">
									<label for="password" class="col-sm-3 control-label">密码</label>
									<div class="col-sm-9">
										<input type="password" class="form-control input-mydark"
											id="password" name="password" placeholder="请输入密码">
									</div>
								</div>
								<div class="form-group pt-lg pb-lg">
									<div class="col-sm-6">
										<button type="submit" class="btn btn-mydark width-p100">login</button>
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
	<!-- js vendor -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!-- person js -->
  </body>
</html>
