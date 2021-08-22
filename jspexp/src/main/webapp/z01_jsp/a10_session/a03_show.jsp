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
	margin-bottom:20px;
	padding:20px;
}

</style>
</head>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h2Obj").text("Session 데이터 확인");	
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>

	<table align="center" class="listTable">
		<tr><th>세션값1</th><td>${num01}</td></tr>
		<tr><th>세션값2</th><td>${num02}</td></tr>
		<tr><th>세션값3</th><td>${num03}</td></tr>
		<tr><th colspan="2" id="ckSession">
			세션값 설정</th></tr>
			
<script type="text/javascript">

$("#ckSession").click(function(){
	var num03 = "${num03}";
	
	if(num03 == "") {
		alert("세션이 종료되었습니다\n 세션 설정 페이지 이동 ");
	location.href = "a03_deleteSession.jsp";
	}
	
});

</script>		
</body>
</html>