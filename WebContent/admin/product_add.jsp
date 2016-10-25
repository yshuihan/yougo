<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jdbc.Product"%>
<%@page import="com.jdbc.Protype"%>
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<jsp:useBean id="protypeDaoImpl" class="com.jdbc.ProtypeDaoImpl" scope="request"></jsp:useBean>
  	<jsp:useBean id="productDaoImpl" class="com.jdbc.ProductDaoImpl" scope="request"></jsp:useBean>
    <%
    String indeximage="";
    String filept="",message="",result="f";
    if(session.getAttribute("message")!=null){
  		message=session.getAttribute("message").toString();
    }
    if(session.getAttribute("filept")!=null){
  		filept=session.getAttribute("filept").toString();
    }
    if(request.getAttribute("result")!=null){
  		result=request.getAttribute("result").toString();
    }
    if(result.equals("t")){
    	indeximage=filept;
    }
    %>
    <div class="manage_list col-lg-10 col-lg-offset-1">
	    <h3 class="text-center pb-md">商品添加</h3>
	    <form id="" method="POST" action="${pageContext.request.contextPath}/servlet/UploadHandleServlet"    ENCTYPE="multipart/form-data" class="form-horizontal col-lg-6 col-lg-offset-3 mt-md" role="form">
            <div class="form-group mt-md pt-md">
	            <label for="proName" class="col-sm-3 control-label">请先上传商品图片（在添加商品信息）：</label>
	            <div class="col-sm-9">
	                <input id="fileImage" class="file  input-mydark" name="file" type="file"  multiple data-max-file-count="1" placeholder="请选择图片">
                	<input type="hidden" name="uploadtype"  value="addproiamge">
	            </div>
	        </div>
        </form>
	    <form action="admin/productadd_cl.jsp" method="post" class="form-horizontal col-lg-6 col-lg-offset-3" role="form">
	        <div class="form-group mt-md pt-md">
	            <label for="proName" class="col-sm-3 control-label">商品名称</label>
	            <div class="col-sm-9">
	                <input type="text" class="form-control input-mydark" name="name" placeholder="请输入商品名称">
	            </div>
	        </div>
	        <div class="form-group mt-md pt-md">
	        <%
				String ptpstr="select * from protype"+" order by id";
				Collection<Protype> cprtp=protypeDaoImpl.getProtype(ptpstr);
				Iterator<Protype> prtpiter=cprtp.iterator(); 
			%>
	            <label for="proType" class="col-sm-3 control-label">商品类型</label>
	            <div class="col-sm-9">
	                <select id="proType" name="protypeid" class="form-control input-mydark">
	                		<%
	                        while(prtpiter.hasNext()){ 
						   		Protype prtp=(Protype)prtpiter.next();
	                        %>
	                        	<option value="<%=prtp.getId() %>"><%=prtp.getType() %></option>
	                        <%} %>
	                </select>
	            </div>
	        </div>
	        <div class="form-group mt-md pt-md">
                <label for="theprice" class="col-sm-3 control-label">商品编号</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control input-mydark" name="procode" value="" placeholder="请输入商品编号">
                </div>
            </div>
	        <div class="form-group mt-md pt-md">
                <label for="theprice" class="col-sm-3 control-label">现价</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control input-mydark" name="price" value="" placeholder="请输入现价">
                </div>
            </div>
            <div class="form-group mt-md pt-md">
                <label for="theprice" class="col-sm-3 control-label">原价</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control input-mydark" name="oldprice" value="" placeholder="请输入原价">
                </div>
            </div>
            <div class="form-group mt-md pt-md">
                <label for="theprice" class="col-sm-3 control-label">折扣</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control input-mydark" name="discount" value="" placeholder="请输入折扣">
                </div>
            </div>
	        <div class="form-group mt-md pt-md">
	            <label for="proParameter" class="col-sm-3 control-label">商品参数</label>
	            <div class="col-sm-9">
	                <textarea name="parameter" class="form-control input-mydark" rows="3"></textarea>
	            </div>
	        </div>
	        <div class="form-group mt-md pt-md">
	            <label for="upTime" class="col-sm-3 control-label">上架时间</label>
	            <div class="col-sm-9">
	                <input type="text" class="form-control input-mydark" id="upTime" name="upTime" placeholder="请选择上架时间">
	            </div>
	        </div>
	        <div class="form-group mt-md pt-md">
	            <label for="downTime" class="col-sm-3 control-label">下架时间</label>
	            <div class="col-sm-9">
	                <input type="text" class="form-control input-mydark" id="downTime" name="downTime" placeholder="请选择下架时间">
	            </div>
	        </div>
	        <div class="form-group mt-md pt-md">
                <label for="thedownTime" class="col-sm-3 control-label">库存</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control input-mydark"  name="allcount" value="" placeholder="请输入库存">
                </div>
            </div>
	        <div class="form-group mt-md pt-md">
	            <label for="fileImages" class="col-sm-3 control-label">商品图片</label>
	            <input type="hidden" name="indexiamge" value="<%=indeximage %>" />
	            <div class="col-sm-9">
	                <img class="img-limit-size img-circle" src="<%=indeximage %>">
	            </div>
	        </div>
	        <div class="form-group mt-md pt-md">
	            <div class="col-sm-6">
	                <button type="submit" class="btn btn-mydark width-p100">submit</button>
	            </div>
	            <div class="col-sm-6">
	                <button type="reset" class="btn btn-mydark width-p100">reset</button>
	            </div>
	        </div>
	    </form>
	</div>
  </body>
</html>
