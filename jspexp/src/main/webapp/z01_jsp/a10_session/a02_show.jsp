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
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h2Obj").text("Session 데이터 확인");
	});
</script>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<h2 align="center" id="h2Obj"></h2>

	<table align="center" class="listTable">
		<tr><th>변수</th><td>${num02}</td></tr>
		<tr><th>객체</th>
			<td>${pro.name},
			${pro.price},
			${pro.cnt}</td>
		</tr>
		<tr><th>멤버리스트</th>
			<td>
				<!--  jstl의 반복문  -->
				<c:forEach var="mem" items="${mlist}">
					${mem.id}, ${mem.pw} 
				</c:forEach>
			</td>
		</tr>
	</table>	
</body>
</html>