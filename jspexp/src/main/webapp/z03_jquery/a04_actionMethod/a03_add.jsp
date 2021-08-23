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

div {
	width:50px;
	height:50px;
	border:1px solid green;
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
		$("h2").text("클릭하세요").click(function(){
			// $("요소객체").기능1().add("추가할 선택자").기능2("속성","속성값");
			// 요소객체1에는 기능1메소드 처리, 기능2메소드 처리
			// 요소객체2에는 기능2메소드만 적용 
			$("div").css("border", "2px solid red").add("p").css("background","yellow");
		});
	});
</script>
<body>
	<h2 align="center"></h2>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
	<p>추가합니다</p>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
</body>
</html>