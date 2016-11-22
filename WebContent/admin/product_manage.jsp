<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.yougo.bean.Product"%>
<%@page import="com.yougo.bean.Protype"%>
<%@page import="com.yougo.bean.Style"%>
<%@page import="com.yougo.bean.Proimages"%>
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
  <jsp:useBean id="protypeDaoImpl" class="com.yougo.impl.ProtypeDaoImpl" scope="request"></jsp:useBean>
  <jsp:useBean id="productDaoImpl" class="com.yougo.impl.ProductDaoImpl" scope="request"></jsp:useBean>
  <jsp:useBean id="styleDaoImpl" class="com.yougo.impl.StyleDaoImpl" scope="request"></jsp:useBean>
  <jsp:useBean id="proimagesDaoImpl" class="com.yougo.impl.ProimagesDaoImpl" scope="request"></jsp:useBean>
  <%
    	String lpt="";
    	String pttpOption="";
    	String[] ptpname;
    	String btntp=request.getParameter("btntp");
    	String protypeid=request.getParameter("protypeid");
    	if(protypeid==null){
	   		protypeid="0";
	   	}
    	if(!protypeid.equals("0")){
    		lpt=" where typeid="+ protypeid;
    	}
    	
    	int pagecount = 5;
	    String pagenum=request.getParameter("page");
	    String list=request.getParameter("list");
	    if(pagenum==null){
	   		pagenum="1";
	   	}
	   	if(list==null){
	   		list="1";
	   	}
	   	int start=(Integer.parseInt(pagenum)-1)*pagecount;
	   	String limited="limit " + start + "," + pagecount;
	   	String pdstr="select * from product "+lpt+" order by id "+limited;
	   	String pdquery="select * from product "+lpt+" order by id ";
	   	Collection<Product> cpd=productDaoImpl.getProduct(pdstr);
	   	Iterator<Product> pditer=cpd.iterator(); 
	   	int allcount = productDaoImpl.productNum(pdquery);
	   	int allpage =1;
		if(allcount%pagecount==0)
		{
			allpage = allcount/pagecount;
		}else{
			allpage = allcount/pagecount+1;
		}
	%>
  <div class="manage_list col-lg-10 col-lg-offset-1">
	    <h3 class="text-center pb-md">商品信息管理</h3>
	    <div class="btn-group select-edit col-lg-6 col-lg-offset-0 p-none mb-lg">
	        <button type="button" class="btn btn-mydark dropdown-btn-radius" data-toggle="dropdown" style="border-top-right-radius: 5px;border-bottom-right-radius: 5px;">
        		商品类型<span class="caret ml-sm"></span></button>
        	<%
				String ptpstr="select * from protype"+" order by id";
				Collection<Protype> cprtp=protypeDaoImpl.getProtype(ptpstr);
				Iterator<Protype> prtpiter=cprtp.iterator(); 
			%>
	        <ul class="dropdown-menu" role="menu">
	        	<li class=""><a href="admin/admin.jsp?list=2&protypeid=0">所有</a></li>
	        	<li class="divider"></li>
	        <%
       		while(prtpiter.hasNext()){ 
				Protype prtp=(Protype)prtpiter.next();
            %>
	            <li class=""><a href="admin/admin.jsp?list=2&protypeid=<%=prtp.getId() %>"><%=prtp.getType() %></a></li>
	            <li class="divider"></li>
            <%} %>
	        </ul>
	    </div>
	    <%
	    if(cpd.size()>0){
	    %>
	    <div class="table-responsive table-auto">
	        <table class="table table-hover">
	            <caption><h3 class="text-center pb-md"></h3></caption>
	            <thead>
	                <tr>
	                    <th>ID</th>
	                    <th>商品名称</th>
	                    <th>商品图片</th>
	                    <th>商品类型</th>
	                    <th>商品编号</th>
	                    <th>商品现价</th>
	                    <th>商品原价</th>
	                    <th>商品折扣</th>
	                    <th>上架状态</th>
	                    <th>上架时间</th>
	                    <th>下架时间</th>
	                    <th>点击量</th>
	                    <th>销售量</th>
	                    <th>库存</th>
	                    <th>商品款式</th>
	                    <th>商品图片组</th>
	                    <th>修改</th>
	                    <th>商品图片</th>
	                    <th>删除</th>
	                </tr>
	            </thead>
	            <tbody>
	            <%
           		while(pditer.hasNext()){ 
					Product pd=(Product)pditer.next();
	            %>
	                <tr>
	                    <td class="line-td"><%=pd.getId() %></td>
	                    <td class="line-td"><%=pd.getName() %></td>
	                    <td class="line-td">
							<div class="circle bgimg-cover tb-head-size mt-md" style="background-image: url(<%=pd.getIndeximage() %>);"></div>
						</td>
	                    <td class="line-td">
	                    <%
	                    if(pd.getTypeid()!=null){
		                    Protype opttp=protypeDaoImpl.findProtype(pd.getTypeid());
		                    out.print(opttp.getType());
	                    }
	                    %>
	                    </td>
	                    <td class="line-td"><%=pd.getProcode() %></td>
	                    <td class="line-td"><%=pd.getPrice() %></td>
	                    <td class="line-td"><%=pd.getOldprice() %></td>
	                    <td class="line-td"><%=pd.getDiscount() %></td>
	                    <td class="line-td"><%=pd.getGroundingstate() %></td>
	                    <td class="line-td"><%=pd.getGrounding() %></td>
	                    <td class="line-td"><%=pd.getUndercarriage() %></td>
	                    <td class="line-td"><%=pd.getClicknum() %></td>
	                    <td class="line-td"><%=pd.getSalenum() %></td>
	                    <td class="line-td"><%=pd.getAllocunt() %></td>
	                    <td class="line-td">
	                        <button type="button" onclick="window.location='admin/admin.jsp?list=2&btntp=style&protypeid=<%=protypeid %>&pid=<%=pd.getId() %>'" class="btn btn-mydark">查看</button>
	                    </td>
	                    <td class="line-td">
	                        <button type="button" onclick="window.location='admin/admin.jsp?list=2&btntp=images&protypeid=<%=protypeid %>&pid=<%=pd.getId() %>'" class="btn btn-mydark">查看</button>
	                    </td>
	                    <td class="line-td">
	                        <button type="button" class="btn btn-mydark" onclick="window.location='admin/admin.jsp?list=2&btntp=pddl&protypeid=<%=protypeid %>&pid=<%=pd.getId() %>'">修改</button>
	                    </td>
	                    <td class="line-td">
	                        <button type="button" class="btn btn-mydark" onclick="window.location='admin/admin.jsp?list=2&btntp=pdimgdl&protypeid=<%=protypeid %>&pid=<%=pd.getId() %>'">修改</button>
	                    </td>
	                    <td class="line-td">
	                        <button type="button" class="btn btn-mydark" onclick="window.location='admin/product_dl.jsp?pid=<%=pd.getId() %>'">删除</button>
	                    </td>
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
	    		String pageUrl = "admin/admin.jsp?";
	    		if(list!=null){
           			pageUrl+="list="+list+"&";
           		}
           		if(protypeid!=null){
           			pageUrl+="protypeid="+protypeid+"&";
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
			<h4 class="text-center text-orange mt-lg">暂无商品!</h4>
			<%
		} %>
		<%
		if(btntp!=null && btntp.equals("style")){
			String pid=request.getParameter("pid");
	    	if(pid!=null&&!pid.equals("")){
		   		String stystr="select * from style where proid="+pid +" order by id";
				Collection<Style> csty=styleDaoImpl.getStyle(stystr);
				Iterator<Style> styiter=csty.iterator();
				if(csty.size()>0){
		%>
		<h3 class="text-center mt-md pb-md">商品编号<%=pid %>的款式<button type="button" class="btn btn-mydark ml-md" onclick="window.location='admin/admin.jsp?list=2&btntp=styleadd&protypeid=<%=protypeid %>&pid=<%=pid %>'">添加新款式</button></h3>
	    <div id="proStyle" class="table-responsive">
	        <table class="table table-hover">
	            <caption></caption>
	            <thead>
	                <tr>
	                    <th>ID</th>
	                    <th>款式名</th>
	                    <th>款式图片</th>
	                    <th>修改</th>
	                    <th>删除</th>
	                </tr>
	            </thead>
	            <tbody>
	            <%
	            while(styiter.hasNext()){ 
					Style sty=(Style)styiter.next();
	            %>
	                <tr>
	                    <td class="line-td"><%=sty.getId() %></td>
	                    <td class="line-td"><%=sty.getName() %></td>
	                    <td class="line-td">
	                        <div class="circle bgimg-cover tb-head-size" style="background-image: url(<%=sty.getImage() %>);"></div>
	                    </td>
	                    <td class="line-td">
	                        <button type="button" class="btn btn-mydark" onclick="window.location='admin/admin.jsp?list=2&btntp=styleedit&protypeid=<%=protypeid %>&styid=<%=sty.getId() %>'">修改</button>
	                    </td>
	                    <td class="line-td">
	                        <button type="button" class="btn btn-mydark" onclick="window.location='admin/style_dl.jsp?sid=<%=sty.getId() %>'">删除</button>
	                    </td>
	                </tr>
	            <%} %>
	            </tbody>
	        </table>
	    </div> 
	    <%}else{ %>
	    	<h4 class="text-center text-orange mt-lg">该商品暂无相关款式!</h4>
		<%}} }%>
		<%
		if(btntp!=null && btntp.equals("images")){
			String pid=request.getParameter("pid");
	    	if(pid!=null&&!pid.equals("")){
		   		String pogsstr="select * from proimages where proid="+pid +" order by id";
				Collection<Proimages> cprig=proimagesDaoImpl.getProimages(pogsstr);
				Iterator<Proimages> prigiter=cprig.iterator();
				if(cprig.size()>0){
		%>
		<h3 class="text-center pb-md mt-md">商品编号<%=pid %>的图片组<button type="button" class="btn btn-mydark ml-md" onclick="window.location='admin/admin.jsp?list=2&btntp=imgadd&protypeid=<%=protypeid %>&pid=<%=pid %>'">添加新图片</button></h3>
	    <div id="userAddress" class="table-responsive">
	        <table class="table table-hover">
	            <caption></caption>
	            <thead>
	                <tr>
	                    <th>ID</th>
	                    <th>图片</th>
	                    <th>alt</th>
	                    <th>删除</th>
	                </tr>
	            </thead>
	            <tbody>
	            <%
	            while(prigiter.hasNext()){ 
					Proimages prig=(Proimages)prigiter.next();
	            %>
	                <tr>
	                    <td class="line-td"><%=prig.getId() %></td>
	                    <td class="line-td">
	                        <div class="circle bgimg-cover tb-head-size" style="background-image: url(<%=prig.getImagesrc() %>);"></div>
	                    </td>
	                    <td class="line-td"><%=prig.getImagealt() %></td>
	                    <td class="line-td">
	                        <button type="button" class="btn btn-mydark" onclick="window.location='admin/proimages_dl.jsp?piid=<%=prig.getId() %>'">删除</button>
	                    </td>
	                </tr>
	            <%} %>
	            </tbody>
	        </table>
	    </div> 
		 <%}else{ %>
	    	<h4 class="text-center text-orange mt-lg">该商品暂无相关图片!</h4>
		<%}} }%>
		<%
		if(btntp!=null && btntp.equals("pddl")){
			String pid=request.getParameter("pid");
	    	if(pid!=null&&!pid.equals("")){
		   		Product opd=productDaoImpl.findProduct(Short.parseShort(pid));
		%>
	    <div id="proconedit" class=" col-lg-12 p-none text-center mt-md mb-md">
	        <div class="pt-md pb-md bg-mydark text-white">
	            <h3>商品修改</h3>
	        </div>
	        <div class="pt-md pb-md">
	            <form action="admin/product_edit.jsp" method="post" class="form-horizontal col-lg-8 col-lg-offset-2" role="form">
	            	<input type="hidden" name="id" value="<%=opd.getId() %>" />
	                <div class="form-group mt-md pt-md">
	                    <label for="theproName" class="col-sm-3 control-label">商品名称</label>
	                    <div class="col-sm-9">
	                        <input type="text" class="form-control input-mydark" name="name" value="<%=opd.getName() %>" placeholder="请输入商品名称">
	                    </div>
	                </div>
	                <div class="form-group mt-md pt-md">
	                    <label for="theproType" class="col-sm-3 control-label">商品类型</label>
	                    <div class="col-sm-9">
	                    <%
	                    String newptpstr="select * from protype"+" order by id";
						Collection<Protype> newcprtp=protypeDaoImpl.getProtype(newptpstr);
						Iterator<Protype> newprtpiter=newcprtp.iterator(); 
	                    %>
	                        <select id="theproType" name="protypeid" class="form-control input-mydark">
	                        <%
	                        while(newprtpiter.hasNext()){ 
						   		Protype newprtp=(Protype)newprtpiter.next();
						   		String sltd="";
						   		if(newprtp.getId()==opd.getTypeid()){
						   			sltd="selected='true'";
						   		}
	                        %>
	                        	<option value="<%=newprtp.getId() %>" <%=sltd %>><%=newprtp.getType() %></option>
	                        <%} %>
	                        </select>
	                    </div>
	                </div>
	                <div class="form-group mt-md pt-md">
	                    <label for="theprice" class="col-sm-3 control-label">商品编号</label>
	                    <div class="col-sm-9">
	                        <input type="text" class="form-control input-mydark" name="procode" value="<%=opd.getProcode() %>" placeholder="请输入商品编号">
	                    </div>
	                </div>
	                <div class="form-group mt-md pt-md">
	                    <label for="theprice" class="col-sm-3 control-label">现价</label>
	                    <div class="col-sm-9">
	                        <input type="text" class="form-control input-mydark" name="price" value="<%=opd.getPrice() %>" placeholder="请输入现价">
	                    </div>
	                </div>
	                <div class="form-group mt-md pt-md">
	                    <label for="theprice" class="col-sm-3 control-label">原价</label>
	                    <div class="col-sm-9">
	                        <input type="text" class="form-control input-mydark" name="oldprice" value="<%=opd.getOldprice() %>" placeholder="请输入原价">
	                    </div>
	                </div>
	                <div class="form-group mt-md pt-md">
	                    <label for="theprice" class="col-sm-3 control-label">折扣</label>
	                    <div class="col-sm-9">
	                        <input type="text" class="form-control input-mydark" name="discount" value="<%=opd.getDiscount() %>" placeholder="请输入折扣">
	                    </div>
	                </div>
	                <div class="form-group mt-md pt-md">
	                    <label for="theproParameter" class="col-sm-3 control-label">商品参数</label>
	                    <div class="col-sm-9">
	                        <textarea name="parameter" class="form-control input-mydark" rows="6"><%=opd.getParameter() %></textarea>
	                    </div>
	                </div>
	                <div class="form-group mt-md pt-md">
	                    <label for="theupTime" class="col-sm-3 control-label">上架时间</label>
	                    <div class="col-sm-9">
	                        <input type="text" class="form-control input-mydark" id="theupTime" name="upTime" value="<%=opd.getGrounding() %>" placeholder="请选择上架时间">
	                    </div>
	                </div>
	                <div class="form-group mt-md pt-md">
	                    <label for="thedownTime" class="col-sm-3 control-label">下架时间</label>
	                    <div class="col-sm-9">
	                        <input type="text" class="form-control input-mydark" id="thedownTime" name="downTime" value="<%=opd.getUndercarriage() %>" placeholder="请选择下架时间">
	                    </div>
	                </div>
	                <div class="form-group mt-md pt-md">
	                    <label for="thedownTime" class="col-sm-3 control-label">库存</label>
	                    <div class="col-sm-9">
	                        <input type="text" class="form-control input-mydark"  name="allcount" value="<%=opd.getAllocunt() %>" placeholder="请输入库存">
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
	    </div>
	     <%} }%>
	     <%
		if(btntp!=null && btntp.equals("pdimgdl")){
			String pid=request.getParameter("pid");
	    	if(pid!=null&&!pid.equals("")){
		   		Product opd=productDaoImpl.findProduct(Short.parseShort(pid));
		%>
		<div  class=" col-lg-12 p-none text-center mt-md mb-md">
	        <div class="pt-md pb-md bg-mydark text-white mb-lg">
	            <h3>图片修改</h3>
	        </div>
	        <form id="" method="POST" action="${pageContext.request.contextPath}/servlet/UploadHandleServlet"    ENCTYPE="multipart/form-data" class="form-horizontal col-lg-6 col-lg-offset-3 mt-md" role="form">
                <div class="form-group">
                    <input id="fileImage" class="file  input-mydark" name="file" type="file"  multiple data-max-file-count="1" placeholder="请选择图片">
                    <input type="hidden" name="uploadtype"  value="proiamge">
                    <input type="hidden" name="imgid"  value="<%=pid %>">
                </div>
            </form>
        </div>
		<%} }%>
		<%
		if(btntp!=null && btntp.equals("styleadd")){
			String pid=request.getParameter("pid");
	    	if(pid!=null&&!pid.equals("")){
		%>
	    <div class="col-lg-12 p-none text-center mt-md mb-md">
	        <div class="pt-md pb-md bg-mydark text-white">
	            <h3>款式添加</h3>
	        </div>
	        <div class="pt-md pb-md">
	            <form method="POST" action="${pageContext.request.contextPath}/servlet/UploadHandleServlet"    ENCTYPE="multipart/form-data" class="form-horizontal col-lg-offset-3 col-lg-6 mt-md" role="form">
	                <input type="hidden" name="imgid" value="<%=pid %>" />
	                <input type="hidden" name="uploadtype"  value="styimage">
	                <div class="form-group mt-lg pt-lg">
	                    <label for="thestyleName" class="col-sm-3 control-label">款式名称</label>
	                    <div class="col-sm-9">
	                        <input type="text" class="form-control input-mydark" name="stylename" placeholder="请输入">
	                    </div>
	                </div>
	                <div class="form-group mt-md pt-md">
	                    <label for="thestylePicture" class="col-sm-3 control-label">款式图片</label>
	                    <div class="col-sm-9">
	                        <input id="thestylePicture" class="file  input-mydark" name="file" type="file"  multiple data-max-file-count="1" placeholder="请选择图片">
	                    </div>
	                </div>
	                <div class="form-group mt-md pt-md">
	                    <!-- <div class="col-sm-6">
	                        <button type="submit" class="btn btn-mydark width-p100">submit</button>
	                    </div> -->
	                    <div class="col-sm-9 col-sm-offset-3">
	                        <button type="reset" class="btn btn-mydark width-p100">reset</button>
	                    </div>
	                </div>
	            </form>
	        </div>
	    </div>
	    <%} }%>
	    <%
		if(btntp!=null && btntp.equals("styleedit")){
			String styid=request.getParameter("styid");
	    	if(styid!=null&&!styid.equals("")){
	    		Style sty=styleDaoImpl.findStyle(Short.parseShort(styid));
		%>
	    <div class="col-lg-12 p-none text-center mt-md mb-md">
	        <div class="pt-md pb-md bg-mydark text-white">
	            <h3>款式修改</h3>
	        </div>
	        <div class="pt-md pb-md">
	            <form method="POST" action="${pageContext.request.contextPath}/servlet/UploadHandleServlet"    ENCTYPE="multipart/form-data" class="form-horizontal col-lg-offset-3 col-lg-6 mt-md" role="form">
	                <input type="hidden" name="imgid" value="<%=styid %>" />
	                <input type="hidden" name="uploadtype"  value="styedimage">
	                <div class="form-group mt-lg pt-lg">
	                    <label for="thestyleName" class="col-sm-3 control-label">款式名称</label>
	                    <div class="col-sm-9">
	                        <input type="text" class="form-control input-mydark" name="stylename" value="<%=sty.getName() %>" placeholder="请输入">
	                    </div>
	                </div>
	                <div class="form-group mt-md pt-md">
	                    <label for="thestylePicture" class="col-sm-3 control-label">款式图片</label>
	                    <div class="col-sm-9">
	                        <input id="thestylePicture" class="file  input-mydark" name="file" type="file"  multiple data-max-file-count="1" placeholder="请选择图片">
	                    </div>
	                </div>
	                <div class="form-group mt-md pt-md">
	                    <!-- <div class="col-sm-6">
	                        <button type="submit" class="btn btn-mydark width-p100">submit</button>
	                    </div> -->
	                    <div class="col-sm-9 col-sm-offset-3">
	                        <button type="reset" class="btn btn-mydark width-p100">reset</button>
	                    </div>
	                </div>
	            </form>
	        </div>
	    </div>
	    <%} }%>
	    <%
		if(btntp!=null && btntp.equals("imgadd")){
			String pid=request.getParameter("pid");
	    	if(pid!=null&&!pid.equals("")){
		%>
	    <div class="col-lg-12 p-none text-center mt-md mb-md">
	        <div class="pt-md pb-md bg-mydark text-white">
	            <h3>图片添加</h3>
	        </div>
	        <div class="pt-md pb-md">
	            <form method="POST" action="${pageContext.request.contextPath}/servlet/UploadHandleServlet"    ENCTYPE="multipart/form-data" class="form-horizontal col-lg-offset-3 col-lg-6 mt-md" role="form">
	                <input type="hidden" name="imgid" value="<%=pid %>" />
	                <input type="hidden" name="uploadtype"  value="imgimage">
	                <div class="form-group mt-lg pt-lg">
	                    <label for="thestyleName" class="col-sm-3 control-label">图片Alt</label>
	                    <div class="col-sm-9">
	                        <input type="text" class="form-control input-mydark" name="stylename" placeholder="请输入">
	                    </div>
	                </div>
	                <div class="form-group mt-md pt-md">
	                    <label for="thestylePicture" class="col-sm-3 control-label">商品图片</label>
	                    <div class="col-sm-9">
	                        <input id="thestylePicture" class="file  input-mydark" name="file" type="file"  multiple data-max-file-count="1" placeholder="请选择图片">
	                    </div>
	                </div>
	                <div class="form-group mt-md pt-md">
	                    <!-- <div class="col-sm-6">
	                        <button type="submit" class="btn btn-mydark width-p100">submit</button>
	                    </div> -->
	                    <div class="col-sm-9 col-sm-offset-3">
	                        <button type="reset" class="btn btn-mydark width-p100">reset</button>
	                    </div>
	                </div>
	            </form>
	        </div>
	    </div>
	    <%} }%>
	</div>
  </body>
</html>
