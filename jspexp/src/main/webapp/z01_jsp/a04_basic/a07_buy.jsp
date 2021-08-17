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
		$("#h3Title").text("구매할 리스트 입력");
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
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>구매물품 : </th><td><input type="text" name="buyname" value=""/></td></tr>
		<tr><th>구매가격 : </th><td><input type="text" name="buyprice" value="0"/></td></tr>
		<tr><th>구매갯수 : </th><td><input type="text" name="buycnt" value="0"/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="구매"/></td></tr>
	</table>	
	</form>
</body>
</html>