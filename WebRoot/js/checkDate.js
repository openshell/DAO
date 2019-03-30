function checkU(){
	alert();
	
	if(document.form2.sname.value==null||document.form2.sname.value=="")
	{
		alert("没有输入数据");
		document.form2.sname.focus();
		return;
	}
	form2.submit();
}