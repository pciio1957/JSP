<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.a01_start.*"
    import="jspexp.z02_vo.*"
    import="java.util.*"
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
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript">
	window.onload = function() {
		document.querySelector("h3").innerText="시작";
	}

</script>
</head>
<body>
	<% 
	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	%>
	
	<h2> 아이디 : <%= id %> </h2>
	<h2> 패스워드 : <%= pass %> </h2>
	<h2> 이름 : <%= name %> </h2>
	<h2> 나이 : <%= age %> </h2>

	<h3></h3>
	<table>
		<tr><th><%= "타이틀" %></th></tr>
		<tr><td>${'내용'}</td></tr>
	</table>
</body>
</html>