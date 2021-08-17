<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
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

String pname = "텀블러";
int price = 12000;
int cnt = 2;

%>

	<h3></h3>
	<table>
		<tr><th>물건명</th><th>가격</th><th>갯수</th></tr>
		<tr><td><%= pname %></td><td><%= price %></td><td><%= cnt %></td></tr>
	</table>
</body>
</html>