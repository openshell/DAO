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

<!-- ���� Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (Bootstrap �� JavaScript �����Ҫ���� jQuery) -->
<script src="js/jquery-3.2.0.min.js"></script>
<!-- ���������ѱ���Ĳ�� -->
<script src="js/bootstrap.min.js"></script>
<!-- HTML5 Shim �� Respond.js ������ IE8 ֧�� HTML5Ԫ�غ�ý���ѯ -->
<!-- ע�⣺ ���ͨ�� file://  ���� Respond.js �ļ�������ļ��޷���Ч�� -->
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
		
		$("table tr .upStu").click(function() {//Ϊ��������ӵ���¼�
		    var tr = $(this).parents("tr");//�ҵ�trԭɫ
		    var td = tr.find("td");//�ҵ�tdԪ��
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

<h1>ѧ����Ϣ����ϵͳ</h1>


	<li class="active"><a href="#">��ҳ <span class="badge">11</span></a></li>
	<li><a href="#">����</a></li>
</ul>
</div>
	<table class="table table-hover table-bordered" >
		<tr>
		<td width="150">ͷ��</td>
			<td width="150">ѧ��</td>
			<td width="150">����</td>
			<td width="150">���</td>
			<td width="150">��ѧ����</td>
			<td width="150">����</td>
			<td width="300" colspan=2 align="center">����</td>
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
			<td class="upStu"><input type="button" class="btn btn-success" value="�޸�"></td>  
			<td><a href="stu_delete.jsp?stuno=<%=list.get(i).getStuno()%>"><input type="button" class="btn btn-danger" value="ɾ��"></a></td>
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
	����
</button>


<!-- ģ̬��Modal�� -->
<div class="modal fade" id="addStu" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-

hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-

hidden="true">
				</button>
				<h4 class="modal-title" id="myModalLabel">
					����ѧ��
				</h4>
			</div>
			<form  class="bs-example bs-example-form" role="form" action="stu_insert.jsp" 

method="post" name="form1" enctype="multipart/form-data" >
			<div class="modal-body">
		<div class="input-group">
			<span class="input-group-addon">ѧ��</span>
			<input type="text" name="stuno"  class="form-control">
		</div>
		<div class="input-group">
		<span class="input-group-addon">����</span>
			<input type="text"  name="stuname"class="form-control" >
		</div>
		<div class="input-group">
		<span class="input-group-addon">���</span>
			<input type="text"  name="job" class="form-control">
		</div>
		
		<div class="input-group">
		<span class="input-group-addon">��ѧ����</span>
			<input type="text"  name="hiredate"  class="form-control" >
		</div>
		
		<div class="input-group">
		<span class="input-group-addon">����</span>
			<input type="text" name="sal"  class="form-control" >
		</div>
		<div class="input-group">
		<span class="input-group-addon">��Ƭ</span>
			<input type="file" name="sphoto"  class="form-control" >
		</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">
					�ر�
				</button>
				<button type="submit" class="btn btn-primary">
					�ύ
				</button>
			</div>
				</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- �޸���Ϣģ̬��Modal�� -->
<div class="modal fade" id="upStu" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-

hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-

hidden="true">
				</button>
				<h4 class="modal-title" id="myModalLabel">
					����ѧ����Ϣ
				</h4>
			</div>
			<form  class="bs-example bs-example-form" role="form" action="stu_update.jsp" 

method="post" name="form1" enctype="multipart/form-data" >
			<div class="modal-body">
		<div class="input-group">
			<span class="input-group-addon">ѧ��</span>
			<input type="text" id="stuno"name="stuno"  class="form-control">
		</div>
		<div class="input-group">
		<span class="input-group-addon">����</span>
			<input type="text" id="stuname"  name="stuname"class="form-control" >
		</div>
		<div class="input-group">
		<span class="input-group-addon">���</span>
			<input type="text" id="job" name="job" class="form-control">
		</div>
		
		<div class="input-group">
		<span class="input-group-addon">��ѧ����</span>
			<input type="text" id="hiredate"  name="hiredate"  class="form-control" >
		</div>
		
		<div class="input-group">
		<span class="input-group-addon">����</span>
			<input type="text" id = "sal" name="sal"  class="form-control" >
		</div>
		<div class="input-group">
		<span class="input-group-addon">��Ƭ</span>
			<input type="file"id="sphoto" name="sphoto"  class="form-control" >
		</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">
					�ر�
				</button>
				<button type="submit" class="btn btn-primary">
					�ύ
				</button>
			</div>
				</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	</div>
</body>
</html>
