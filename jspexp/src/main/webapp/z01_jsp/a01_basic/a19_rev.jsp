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
	
	String bname = request.getParameter("bname");
	if(bname==null) bname="입력안됨";
	
	String writer = request.getParameter("bwriter");
	if(writer==null) writer="익명";
	
	
	%>

	<h3 align="center"></h3>
	<form id="frm01">
		<table>
			<tr><th>도서명</th><td><%= bname %></td></tr>
			<tr><th>저자</th><td><%= writer %></td></tr>
		</table>
	</form>
</body>
</html>