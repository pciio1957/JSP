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
	width:70%;
	margin-bottom:20px;
	padding:20px;
}

</style>
</head>
<%-- 
# 

--%>
<%

%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h2Obj").text("시작");
		
		var auth = "${mb01.auth}";
		if(auth==""){
			alert("로그인이 필요합니다");
			location.href="a05_bean_Login.jsp";
		}
		
		$("#adminBtn").click(function(){
			if(auth == "관리자") {
				alert("관리자메뉴 처리");
			} else {
				alert("권한이 없습니다.");
			}
		});
		
		$("#userBtn").click(function(){
				alert("일반사용자 메뉴 처리");
		});
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>
	
	<h3 align="center"> 현재 세션 내용 </h3>
	<p align="center">
	<input type="button" value="관리자메뉴" id="adminBtn"/>
	<input type="button" value="일반사용자메뉴" id="userBtn"/>
	</p>
	
	<h3 align="center" onclick="location.href='a06_showSession.jsp'"> 다른 페이지에서 session확인 </h3>
	<table align="center" class="listTable">
		<tr><th>아이디</th><td>${mb01.id }</td><th>패스워드</th><td>${mb01.pw }</td></tr>
		<tr><th>이름</th><td>${mb01.name }</td><th>권한</th><td>${mb01.auth }</td></tr>
		<tr><th>포인트</th><td>${mb01.point }</td></tr>
	</table>
	<h3 align="center" onclick="location.href='a05_bean_Login2.jsp'">로그아웃</h3>
	
</body>
</html>