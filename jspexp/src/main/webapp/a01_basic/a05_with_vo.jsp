<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.a01_start.A02_Entertainer"
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
	
	A02_Entertainer enter = new A02_Entertainer("유재석", "1972", "MC예능");
	
	%>

	<h3></h3>
	<table>
		<tr><th>이름</th><th>생년월일</th><th>분야</th></tr>
		<tr><td><%= enter.getName() %></td><td><%= enter.getBirth() %></td><td><%= enter.getPart() %></td></tr>
	</table>
</body>
</html>