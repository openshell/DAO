function checkU(){
	alert();
	
	if(document.form2.sname.value==null||document.form2.sname.value=="")
	{
		alert("û����������");
		document.form2.sname.focus();
		return;
	}
	form2.submit();
}