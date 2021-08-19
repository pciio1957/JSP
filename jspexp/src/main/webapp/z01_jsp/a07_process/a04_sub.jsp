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
<%
	String pname = request.getParameter("pname");
	String price = request.getParameter("price");
	
%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("물건 구매 정보");
	});
</script>
<body>
	<h2 align="center"></h2>
	
	<% if(pname != null) { %>
	<h3 align="center">구매한 물건은 <%= pname %></h3>
	<h3 align="center">가격은 <%= price %></h3>
	<% } %>
</body>
</html>