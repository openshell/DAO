<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=gb2312" pageEncoding="gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="cn.mldn.lxh.factory.*,cn.mldn.lxh.vo.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">


<title>My JSP 'stu_insert_do.jsp' starting page</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<jsp:useBean id="stu" class="cn.mldn.lxh.vo.Stu"></jsp:useBean>
<jsp:useBean id="smart" class="com.jspsmart.upload.SmartUpload"></jsp:useBean>

</head>

<%
	smart.initialize(pageContext);
	smart.upload();
	stu.setStuno(Integer.parseInt(smart.getRequest().getParameter(
			"stuno")));
	stu.setStuname(smart.getRequest().getParameter("stuname"));
	stu.setStuidentity(smart.getRequest().getParameter("job"));
	stu.setHiredate(new SimpleDateFormat("yyyy-MM-dd").parse(smart
			.getRequest().getParameter("hiredate")));
	stu.setScore(Float.parseFloat(smart.getRequest()
			.getParameter("sal")));
	stu.setSphoto("upload/"
			+
			smart.getFiles().getFile(0).getFileName());
			smart.save("upload");
			
	if (DAOFactory.getIStuDAOInstance().doUpdate(stu)) {
%>
<h4>���³ɹ���</h4>
<%
	} else {
%>
<h4>����ʧ�ܣ�</h4>
<%
	}
%>
<body>
	<a href="stu_show.jsp">����</a>

</body>
</html>
