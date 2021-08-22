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
<%

	// 1. 세션 설정
	session.setAttribute("num01", 25);
	session.setAttribute("num02", 5);
	session.setAttribute("num03", 10);
	
	
%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h2Obj").text("Session 삭제");

		$("#ckSession").click(function(){
			location.href = "a03_show.jsp";
		});
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>

	<table align="center" class="listTable">
		<tr><th>세션값1</th><td>${num01}</td></tr>
		<tr><th>세션값2</th><td>${num02}</td></tr>

	
<%

	// 2. 세션 삭제 - 직접적인 삭제
	session.removeAttribute("num02"); 	

	// 유효시간을 지정해 해당 시간이 지나면 세션이 모두 종료됨
	session.setMaxInactiveInterval(10);	 
	
%>
		<tr><th>세션값2(세션값 삭제)</th><td>${num02}</td></tr>
		<tr><th id="ckSession">세션값3(세션값 삭제)</th><td>${num03}</td></tr> 
	</table>
	
	
	
	<!--  응용) id : [ ] [로그인] 
			a06_login.jsp : 해당 아이디로 로그인했을 때 session을 설정(5초)하고 
			a07_show.jsp : 페이지 이동하면 @@님 로그인중.. 처리한 후 기능 버튼(등록) 클릭시
						시간전에는 기능수행 alert(), 시간이 지나면 로그인하도록 처리
			(3조 제출, 나머지 손들기)
	-->

</body>
</html>