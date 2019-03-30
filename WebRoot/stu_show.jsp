<%@page import="com.jspsmart.upload.SmartUpload" pageEncoding="gb2312" contentType="text/html; charset=gb2312" %>
<%@ page language="java" import="java.util.*"
	import="java.util.ArrayList" import="java.util.List"
	import="cn.mldn.lxh.vo.Stu" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<base href="<%=basePath%>">

<title>My JSP starting page</title>

<!-- 引入 Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="js/jquery-3.2.0.min.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="js/bootstrap.min.js"></script>
<!-- HTML5 Shim 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
<!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
<!--[if lt IE 9]>
         <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
         <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
      <![endif]-->

<script>
	$(document).ready(function() {
		$(".upStu").click(function() {
			$("#upStu").modal('show');
		});
		$(".addStu").click(function() {
			$("#addDiv").fadeToggle();
		});
		
		$("table tr .upStu").click(function() {//为表格的行添加点击事件
		    var tr = $(this).parents("tr");//找到tr原色
		    var td = tr.find("td");//找到td元素
		    $("sphoto").val(td[0].innerHTML);
		    $("#stuno").val(td[1].innerHTML);
		    $("#stuname").val(td[2].innerHTML);
		    $("#job").val(td[3].innerHTML);
		    $("#hiredate").val(td[4].innerHTML);
		    $("#sal").val(td[5].innerHTML);
  		});
		
	});
</script>
<jsp:useBean id="stu" class="cn.mldn.lxh.vo.Stu"></jsp:useBean>
<jsp:useBean id="DAO" class="cn.mldn.lxh.factory.DAOFactory"></jsp:useBean>
<%
	SmartUpload smart=new  SmartUpload();
	List<Stu> list = DAO.getIStuDAOInstance().findAll();
	int countStu = list.size();
%>
<style>

</style>
</head>

<body>
<div id="container">
<div id="header">
<ul class="nav nav-pills">

<h1>学生信息管理系统</h1>


	<li class="active"><a href="#">首页 <span class="badge">11</span></a></li>
	<li><a href="#">关于</a></li>
</ul>
</div>
	<table class="table table-hover table-bordered" >
		<tr>
		<td width="150">头像</td>
			<td width="150">学号</td>
			<td width="150">姓名</td>
			<td width="150">身份</td>
			<td width="150">入学日期</td>
			<td width="150">分数</td>
			<td width="300" colspan=2 align="center">操作</td>
		</tr>
		<%
			for (int i = 0; i < countStu; i++) {
		%>
		<tr>
		<td><img src="<%=list.get(i).getSphoto() %>" width="130" />
		
		</td>
			<td><%=list.get(i).getStuno()%></td>
			<td><%=list.get(i).getStuname()%></td>
			<td><%=list.get(i).getStuidentity()%></td>
			<td><%=list.get(i).getHiredate()%></td>
			<td><%=list.get(i).getScore()%></td>
			<td class="upStu"><input type="button" class="btn btn-success" value="修改"></td>  
			<td><a href="stu_delete.jsp?stuno=<%=list.get(i).getStuno()%>"><input type="button" class="btn btn-danger" value="删除"></a></td>
		</tr>
		
		<%
			}
		%>
		<tr>
<td colspan="8">
<ul class="pagination">
	<li><a href="#">&laquo;</a></li>
	<li><a href="#">1</a></li>
	<li><a href="#">2</a></li>
	<li><a href="#">3</a></li>
	<li><a href="#">4</a></li>
	<li><a href="#">5</a></li>
	<li><a href="#">&raquo;</a></li>
</ul>
</td>
		</tr>
	</table>
	
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#addStu">
	新增
</button>


<!-- 模态框（Modal） -->
<div class="modal fade" id="addStu" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-

hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-

hidden="true">
				</button>
				<h4 class="modal-title" id="myModalLabel">
					新增学生
				</h4>
			</div>
			<form  class="bs-example bs-example-form" role="form" action="stu_insert.jsp" 

method="post" name="form1" enctype="multipart/form-data" >
			<div class="modal-body">
		<div class="input-group">
			<span class="input-group-addon">学号</span>
			<input type="text" name="stuno"  class="form-control">
		</div>
		<div class="input-group">
		<span class="input-group-addon">姓名</span>
			<input type="text"  name="stuname"class="form-control" >
		</div>
		<div class="input-group">
		<span class="input-group-addon">身份</span>
			<input type="text"  name="job" class="form-control">
		</div>
		
		<div class="input-group">
		<span class="input-group-addon">入学日期</span>
			<input type="text"  name="hiredate"  class="form-control" >
		</div>
		
		<div class="input-group">
		<span class="input-group-addon">分数</span>
			<input type="text" name="sal"  class="form-control" >
		</div>
		<div class="input-group">
		<span class="input-group-addon">照片</span>
			<input type="file" name="sphoto"  class="form-control" >
		</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">
					关闭
				</button>
				<button type="submit" class="btn btn-primary">
					提交
				</button>
			</div>
				</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- 修改信息模态框（Modal） -->
<div class="modal fade" id="upStu" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-

hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-

hidden="true">
				</button>
				<h4 class="modal-title" id="myModalLabel">
					更新学生信息
				</h4>
			</div>
			<form  class="bs-example bs-example-form" role="form" action="stu_update.jsp" 

method="post" name="form1" enctype="multipart/form-data" >
			<div class="modal-body">
		<div class="input-group">
			<span class="input-group-addon">学号</span>
			<input type="text" id="stuno"name="stuno"  class="form-control">
		</div>
		<div class="input-group">
		<span class="input-group-addon">姓名</span>
			<input type="text" id="stuname"  name="stuname"class="form-control" >
		</div>
		<div class="input-group">
		<span class="input-group-addon">身份</span>
			<input type="text" id="job" name="job" class="form-control">
		</div>
		
		<div class="input-group">
		<span class="input-group-addon">入学日期</span>
			<input type="text" id="hiredate"  name="hiredate"  class="form-control" >
		</div>
		
		<div class="input-group">
		<span class="input-group-addon">分数</span>
			<input type="text" id = "sal" name="sal"  class="form-control" >
		</div>
		<div class="input-group">
		<span class="input-group-addon">照片</span>
			<input type="file"id="sphoto" name="sphoto"  class="form-control" >
		</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">
					关闭
				</button>
				<button type="submit" class="btn btn-primary">
					提交
				</button>
			</div>
				</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	</div>
</body>
</html>
