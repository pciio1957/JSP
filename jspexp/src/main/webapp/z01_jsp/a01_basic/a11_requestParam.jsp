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
		document.querySelector("h3").innerText="회원정보";
	}

</script>
</head>
<body>
	<%
	
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String loc = request.getParameter("loc");
	
	%>
	<h3></h3>
	<table>
		<tr><th>이름</th><th>나이</th><th>지역</th></tr>
		<tr>
			<td><%= name %></td>
			<td><%= age %></td>
			<td><%= loc %></td>
		</tr>
	</table>
</body>
</html>