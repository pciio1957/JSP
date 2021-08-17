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
<%-- 
# 

--%>
<%

%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("2등급");
	});
</script>
<body>
	<h2 align="center"></h2>
	
	<h3 align="center">배달물건 정보</h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><%= request.getParameter("pname") %></td></tr>
		<tr><th>가격</th><td><%= request.getParameter("price") %></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="검색"/>
		</td></tr>
	</table>	
	</form>
	
	<h3>물건구매 정보</h3>
	<table  align="center" class="listTable">
		<tr><td>남은금액</td><td><%= session.getAttribute("pay") %>
	</table>
	
</body>
</html>