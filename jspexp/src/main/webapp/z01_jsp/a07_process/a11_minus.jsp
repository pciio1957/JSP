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
<%-- 
# 

--%>
<%

	String num01S = request.getParameter("num01");
	String num02S = request.getParameter("num02");
	
%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("빼기 연산");
	});
</script>
<body>
	<h2 align="center"></h2>
	
	<%
		if(num02S != null) {
			int num01 = Integer.parseInt(num01S);
			int num02 = Integer.parseInt(num02S); %>
	
	<h3 align="center"> 결과 </h3>
	<h3 align="center"> <%= num01 %> - <%= num02 %> = <%= num01-num02 %> </h3>
	<% } %>
</body>
</html>