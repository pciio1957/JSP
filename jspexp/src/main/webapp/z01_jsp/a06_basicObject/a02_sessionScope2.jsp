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
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>

table {
	margin-bottom:20px;
	padding:20px;
}

</style>
</head>
<%

	session.setAttribute("sessionVar","신길동(sessionVar)");

%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("request페이지");
	});
</script>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>페이지범위</th><td><%= pageContext.getAttribute("pageVar") %></td></tr>
		<tr><th>request범위</th><td><%= request.getAttribute("requestVar") %></td></tr>
		<tr><th>session범위</th><td><%= session.getAttribute("sessionVar") %></td></tr>
		<tr><th>aplication범위</th><td><%= application.getAttribute("applicationVar") %></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="검색"/>
		</td></tr>
	</table>	
	<h3 align="center" onclick="location.href='a02_sessionScope3.jsp'">세션범위 이동</h3>
	
</body>
</html>