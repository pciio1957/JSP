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
<%-- 
# 

--%>
<%
	// 요청된 id값 받기
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// 요청값이 있으면 session값 설정하기
	if(id != null) session.setAttribute("id", id);
	if(pw != null) session.setAttribute("pw", pw);
	
	// 세션값이 있으면 session값으로 가져오기
	if(session.getAttribute("id")!=null) {
		id = (String) session.getAttribute("id");
		pw = (String) session.getAttribute("pw");
	}

%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("메뉴1 페이지");
	});
</script>
<body>
	<h2 align="center"></h2>
	<% if(id != null) { %>
	<h3 align="center"> <%= id %> 님 어서오세요! </h3>
	<% } %>
	
	
</body>
</html>