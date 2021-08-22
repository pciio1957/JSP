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
<!--  
	응용) id : [ ] [로그인] 
		a06_login.jsp : 해당 아이디로 로그인했을 때 session을 설정(5초)하고 
		a07_show.jsp : 페이지 이동하면 @@님 로그인중.. 처리한 후 기능 버튼(등록) 클릭시
				시간전에는 기능수행 alert(), 시간이 지나면 로그인하도록 처리
		(3조 제출, 나머지 손들기)
-->
<%

	String id = request.getParameter("id");

	if(id != null) {
		
		// 1. 세션설정
		session.setAttribute("id", id);
		session.setMaxInactiveInterval(5);
		response.sendRedirect("a07_show.jsp");
	}

	
%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h2Obj").text("세션 삭제 응용문제");

	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><th>비번</th><td><input type="text" name="pw" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" id="regBtn" value="로그인"/>
		</td></tr>
	</table>	
	</form>
</body>
</html>