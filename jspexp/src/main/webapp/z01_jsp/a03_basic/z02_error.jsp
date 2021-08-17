<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.z01_database.*"
    import="jspexp.z02_vo.*"
    import="java.util.*"
    isErrorPage="true"
%>
   
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 외부 CSS 설정 호출 -->
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>

</style>
<script type="text/javascript">
	window.onload = function() {
		document.querySelector("h3").innerText="에러처리 응용문제";
	}

</script>
</head>
<%-- 
# 

--%>
<%

%>
<body>
	<h3 align="center"></h3>

	<table class="listTable">
		<tr><th>에러타입</th><td><%= exception.getClass().getName() %></td></tr>
		<tr><th>에러메세지</th><td><%= exception.getMessage() %></td></tr>
	</table>	
	
</body>
</html>