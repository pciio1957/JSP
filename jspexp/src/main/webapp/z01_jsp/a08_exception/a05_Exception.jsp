<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"
    isErrorPage = "true"    
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
	width:70%;
	margin-bottom:20px;
	padding:30px;
}

</style>
</head>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("에러발생");
	});
</script>
<body>
	<h2 align="center"></h2>
	<table align="center" class="listTable">
		<tr><th>에러내용</th><td><%= exception.getMessage() %></td></tr>
		<tr><th>처리방법</th><td>예외 전체 클래스 에러입니다!</td></tr>
	</table>	
	
</body>
</html>