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
	var arry = [];
	$(document).ready(function(){
		$("#h3Title").text("점수등록");
		
		$("#regBtn").click(function() {
			var point = $("input[name=point]").val();
			arry.push(point);
			showTab();
		});
		
		$("#desBtn").click(function() {
			arry.sort(function(left, right){ return right-left });
			showTab();
		});
		
		$("#ascBtn").click(function() {
			arry.sort(function(left, right){ return left-right; });
			showTab();
		});
	});
	
	function showTab() {
		var show = "";
		arry.forEach(function(point, idx, arr){
			show += "<tr><td>" + idx++ + "</td><td>" + point + "</td></tr>";
		});
		$("#show>tbody").html(show);
	}
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
	<table align="center" class="listTable">
		<tr><th>등록점수</th><td><input type="text" name="point" value="0"/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="button" id="regBtn" value="등록"/>
			<input type="button" id="desBtn" value="내림차순정렬"/>
			<input type="button" id="ascBtn" value="오름차순정렬"/>
		</td></tr>
	</table>	
	</form>
	<br><br>
	<table width="30%" align="center" class="listTable" id="show">
		<thead><tr><th>번호</th><th>점수</th></tr></thead>
		<tbody></tbody>
	</table>	
	
</body>
</html>