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
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" 
		type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h3Title").text("메인화면");
		
		var auth = "${mem.auth}";
		$("#adminBtn").click(function() {
			if(auth == "admin"){
				alert("관리자기능");
			} else {
				alert("사용불가");
			}
				
		});
		
		$("#logOutBtn").click(function(){
			if(confirm("로그아웃하시겠습니까?")) {
				// 다시 controller에 요청값을 proc=logout 으로 전송
				$("#frm01").submit(); 
			}
		});
	});
</script>
</head>
<%-- 
# 

--%>
<%

%>
<body>
	<%-- 로그아웃 처리를 위한 form --%>
	<form method="post" id="frm01">
		<input type="hidden" name="proc" value="logout"/>
	</form>
	
	<h3 align="center" id="h3Title"></h3>
	<h3 align="center"> ${mem.id}님 로그인중 </h3>
	<input type="button" id="logOutBtn" value="로그아웃">
	
	<input type="button" id="adminBtn" value="관리자버튼">
	<h3 onclick="location.href='<%=path%>/a04_basic/a06_main2.jsp'"></h3>
</body>
</html>