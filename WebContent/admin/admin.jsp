<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>yougo-admin</title>
    
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
    <!-- add css -->
    <link rel="stylesheet" href="assets/vendor/datetimepicker/css/jquery.datetimepicker.css">
    <link rel="stylesheet" href="assets/vendor/jquery-Upload/css/fileinput.css">

  </head>
  
  <body>
  <%
  String adminid="",adminname="";
  if(session.getAttribute("adminid")==null || session.getAttribute("adminname")==null ||session.getAttribute("adminid")=="" || session.getAttribute("adminname")=="")
  {
	  response.sendRedirect("/yougo/admin/login.jsp");
  }
  if(session.getAttribute("adminid")!=null && session.getAttribute("adminname")!=null){
      adminid=session.getAttribute("adminid").toString();
	  adminname=session.getAttribute("adminname").toString();
  }
   %>
  	<div id="main" class="row">
            <div class="col-lg-12">
                <div class="panel panel-mydark no-radius">
                   <div class="panel-heading no-radius">
                        <h3 class="panel-title">
                            <a class="no-underline text-white" href="javascript:;">manager-yougo</a>
                            <a id="loginOut" class="no-underline text-white mr-md pull-right" href="admin/login_out.jsp"><span class="glyphicon glyphicon-log-out ml-xs text-white"></span></a>
                        </h3>                        
                    </div>
                    <div class="panel-body width-p100 full-height">
                        <div id="selectMenu" class="col-lg-1 p-none">
                            <ul class="listview no-lsitview p-none">
                                <li class="pt-md pb-md text-md li-style li-stle-bottom">
                                    <a class="no-underline text-white text-bold pt-lg pb-lg pl-xs" href="javascript:;">
                                    用户管理<span class="glyphicon glyphicon-user ml-xs text-white"></span>
                                    </a>
                                    <ul class="p-none mt-md listselect no-lsitview text-center">
                                        <li class="li-stle-bottom text-sm pt-xs pb-xs">
                                        <a class="no-underline text-muted pt-sm pb-sm pl-xs" href="admin/admin.jsp?list=0">用户信息查看<span class="glyphicon glyphicon-zoom-in ml-xs"></span></a>
                                        </li>
                                        <li class="li-stle-bottom text-sm pt-xs pb-xs">
                                            <a class="no-underline text-muted pt-sm pb-sm pl-xs" href="admin/admin.jsp?list=1">用户物流地址<span class="glyphicon glyphicon-plus ml-xs"></span></a>
                                        </li>
                                    </ul> 
                                </li> 
                                <li class="pt-md pb-md text-md li-style li-stle-bottom">
                                    <a class="no-underline text-white text-bold pt-lg pb-lg pl-xs" href="javascript:;">
                                        商品管理<span class="glyphicon glyphicon-th-large ml-xs text-white"></span>
                                    </a>
                                    <ul class="p-none mt-md listselect no-lsitview text-center">
                                        <li class="li-stle-bottom text-sm pt-xs pb-xs">
                                            <a class="no-underline text-muted pt-sm pb-sm pl-xs" href="admin/admin.jsp?list=2">商品信息管理<span class="glyphicon glyphicon-zoom-in ml-xs"></span></a>
                                        </li>
                                        <li class="li-stle-bottom text-sm pt-xs pb-xs">
                                            <a class="no-underline text-muted pt-sm pb-sm pl-xs" href="admin/admin.jsp?list=3">商品信息添加<span class="glyphicon glyphicon-plus ml-xs"></span></a>
                                        </li>
                                    </ul> 
                                </li>
                                <li class="pt-md pb-md text-md li-style li-stle-bottom">
                                    <a class="no-underline text-white text-bold pt-lg pb-lg pl-xs" href="javascript:;">
                                        订单管理<span class="glyphicon glyphicon-shopping-cart ml-xs text-white"></span>
                                    </a>
                                    <ul class="p-none mt-md listselect no-lsitview text-center">
                                        <li class="li-stle-bottom text-sm pt-xs pb-xs">
                                            <a class="no-underline text-muted pt-sm pb-sm pl-xs" href="admin/admin.jsp?list=4">订单信息查看<span class="glyphicon glyphicon-zoom-in ml-xs"></span></a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="pt-md pb-md text-md li-style li-stle-bottom">
                                    <a class="no-underline text-white text-bold pt-lg pb-lg pl-xs" href="javascript:;">
                                        评价管理<span class="glyphicon glyphicon-list-alt ml-xs text-white"></span>
                                    </a>
                                    <ul class="p-none mt-md listselect no-lsitview text-center">
                                        <li class="li-stle-bottom text-sm pt-xs pb-xs">
                                            <a class="no-underline text-muted pt-sm pb-sm pl-xs" href="admin/admin.jsp?list=5">评价信息查看<span class="glyphicon glyphicon-zoom-in ml-xs"></span></a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="pt-md pb-md text-md li-style">
                                    <a class="no-underline text-white text-bold pt-lg pb-lg pl-xs" href="javascript:;">
                                        个人管理<span class="glyphicon glyphicon-header ml-xs text-white"></span>
                                    </a>
                                    <ul class="p-none mt-md listselect no-lsitview text-center">
                                        <li class="li-stle-bottom text-sm pt-x p-sms pb-xs">
                                            <a class="no-underline text-muted pt-sm pb-sm pl-xs" href="admin/admin.jsp?list=6">管理信息查看<span class="glyphicon glyphicon-zoom-in ml-xs"></span></a>
                                        </li>
                                        <li class="li-stle-bottom text-sm pt-xs pb-xs">
                                            <a class="no-underline text-muted pt-sm pb-sm pl-xs" href="admin/admin.jsp?list=7">管理信息修改<span class="glyphicon glyphicon-record ml-xs"></span></a>
                                        </li>
                                    </ul> 
                                </li>
                            </ul>
                        </div>
                        <%
                        String[] framearr = new String[]{"usermessage.jsp","usermessage_manage.jsp",
						"product_manage.jsp","product_add.jsp","order_message.jsp",
						"evaluation.jsp","admin_message.jsp","admin_pd_edit.jsp"};
                         String list=request.getParameter("list");
					   	 if(list==null){
					   		 list="0";
					   	 }
                         %>
                        <div id="managerContent" class="col-lg-11 p-none">
                            <div class="absolute tp-index ab-left-10">
                                <span class="glyphicon glyphicon-tags text-lg text-white"></span>
                            </div>
                            <div class="panel panel-mydark no-radius no-border">
                                <div class="panel-heading no-radius">
                                    <h3 id="managerTitle" class="panel-title">
                                        用户管理<span class="glyphicon glyphicon-user ml-xs text-white"></span>
                                    </h3>
                                </div>
                                <div id="managerView" class="panel-body">
                                 	<div class="manage-include col-lg-12">
                                    	<jsp:include page="<%=framearr[Integer.parseInt(list)] %>"></jsp:include>
                                    </div>
                                    <%-- <div class="manage-include col-lg-12">
                                    	<jsp:include page="usermessage.jsp"></jsp:include>
                                    </div>
                                    <div class="manage-include col-lg-12">
                                    	<jsp:include page="usermessage_manage.jsp"></jsp:include>
                                    </div>
                                    <div class="manage-include col-lg-12">
                                    	<jsp:include page="product_manage.jsp"></jsp:include>
                                    </div>
                                    <div class="manage-include col-lg-12">
                                    	<jsp:include page="product_add.jsp"></jsp:include>
                                    </div>
                                    <div class="manage-include col-lg-12">
                                    	<jsp:include page="order_message.jsp"></jsp:include>
                                    </div>
                                    <div class="manage-include col-lg-12">
                                    	<jsp:include page="evaluation.jsp"></jsp:include>
                                    </div>
                                    <div class="manage-include col-lg-12">
                                    	<jsp:include page="admin_message.jsp"></jsp:include>
                                    </div>
                                    <div class="manage-include col-lg-12">
                                    	<jsp:include page="admin_pd_edit.jsp"></jsp:include>
                                    </div> --%>
                                </div>
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
    <script src="admin/assets/js/manager_js.js"></script>
    <!-- add js -->
    <script src="assets/vendor/datetimepicker/js/jquery.datetimepicker.js"></script>
    <script src="assets/vendor/jquery-Upload/js/fileinput.js"></script>
    <script src="assets/vendor/jquery-Upload/js/fileinput_locale_zh.js"></script>
    <script type="text/javascript">
        $(function(){
            $('#downTime').datetimepicker({ 
			     format: "20y-m-d h:i:s" 
			});
            $('#upTime').datetimepicker({ 
			     format: "20y-m-d h:i:s" 
			});
            $('#thedownTime').datetimepicker({ 
			     format: "20y-m-d h:i:s" 
			});
            $('#theupTime').datetimepicker({ 
			     format: "20y-m-d h:i:s" 
			});
        });
    </script>
  </body>
</html>
