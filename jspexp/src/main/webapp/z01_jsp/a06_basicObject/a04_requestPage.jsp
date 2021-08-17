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

Product prod = (Product) request.getAttribute("prod");
// 객체로 받아와서 테이블에서 el태그를 활용해서 사용 가능 

%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
	});
</script>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<%-- el태그를 활용해 이전페이지에서 선언한 request.setAttribute("prod")이름으로 프로퍼티의 사용 가능 --%>
		<tr><th>물건명</th><td><%= request.getAttribute("pname") %></td></tr>
		<tr><th>가격</th><td><%= request.getAttribute("price") %></td></tr>
		<tr><th>갯수</th><td><%= request.getAttribute("cnt") %></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="검색"/>
		</td></tr>
	</table>	
	</form>
	
	
</body>
</html>