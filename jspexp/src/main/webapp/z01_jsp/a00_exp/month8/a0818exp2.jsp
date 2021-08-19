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

	String pname = request.getParameter("pname");
	String priceS = request.getParameter("price");
	String pcntS = request.getParameter("pcnt");
	// String pcnt = Integer.parseInt(request.getParameter("pcnt"));
	
%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("물건 정보 페이지");
	});
</script>
<body>
	<h2 align="center"></h2>
	
	<%
	
		if(pcntS != null) { 
			int price = Integer.parseInt(priceS);
			int pcnt = Integer.parseInt(pcntS);
	%>
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><%= pname %></td></tr>
		<tr><th>총계</th><td><%= price * pcnt %></td></tr>
	</table>	
	<% } %>
</body>
</html>