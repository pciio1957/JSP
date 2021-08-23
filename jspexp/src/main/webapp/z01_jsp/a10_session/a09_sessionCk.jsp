<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    %>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
%>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Front 연습</title>
<link rel="stylesheet" href="<%=path%>/z00_com/a01_com.css">
<style>

table {
	width:70%;
	margin-bottom:20px;
	padding:20px;
}

</style>
</head>
<%-- 
# 

--%>
<%

%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	var id = "${id}";
	
	if(id == "") {
		alert("세션이 종료되었습니다 \n 다시 로그인해주세요");
		location.href ="a08_servar_cksession.jsp";
	}
	
	$(document).ready(function(){
		$("#h2Obj").text("${id}님 로그인중!");
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>

</body>
</html>