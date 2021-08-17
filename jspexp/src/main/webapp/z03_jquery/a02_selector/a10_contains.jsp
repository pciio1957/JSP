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
		$("h2").text("Contains 예제");
		
		
		$("#btnSh").click(function(){
			var ename = $("[name=ename]").val();
			// td:contains("특정문자열") : 해당 문자열이 포함되어 있는 td
			$("td:contains('" + ename + "')").css("background", "yellow");
		});
	});
</script>
</head>
<%-- 
# 

--%>
<%

%>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>찾은 이름</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center"><input type="button" id="btnSh" value="검색"/></td></tr>
	</table>	
	</form>
	<table  align="center" class="listTable">
		<tr><th>이름</th></tr>
		<tr><td>홍길동</td></tr>
		<tr><td>김길동</td></tr>
		<tr><td>신길동</td></tr>
		<tr><td>오길동</td></tr>
	</table>	
	
</body>
</html>