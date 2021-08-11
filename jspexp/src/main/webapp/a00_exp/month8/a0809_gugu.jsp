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
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" 
		type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h3Title").text("구구단 문제");
	});
</script>
</head>
<%-- 
# 

--%>
<%

%>
<body>
	<h3 align="center" id="h3Title"></h3>
	<form id="frm01">
	<table align="center" width="50%" class="listTable">
		<tr><th>
		<input type="text" name="grade" size="1" value="${grade}"/>
		X
		<input type="text" name="cnt"  size="1" value="${cnt}"/>
		</th></tr>
		<tr><td><input type="text" name="inReply" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="확인"/></td></tr>
	</table>	
	</form>
</body>
</html>