<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.z01_database.*"
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
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>

</style>
<script type="text/javascript">
	window.onload = function() {
		document.querySelector("h3").innerText="시작";
	}

</script>
</head>
<%-- 
# 

--%>
<%

// 클라이언트(브라우저)에 있는 쿠키를 서버단에 request를 통해서 보내서 확인하도록 함
Cookie[] cks = request.getCookies();


%>
<body>
	<h3 align="center"></h3>
	<form id="frm01">
	<table class="listTable">
		<% for(Cookie c:cks) { %>
		<tr><th><%= c.getName() %></th><td><%= c.getValue() %></td></tr>
		<% } %>
	</table>	
	</form>
	<table class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>