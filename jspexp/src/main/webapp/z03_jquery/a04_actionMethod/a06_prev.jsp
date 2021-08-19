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

%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("prev() 예제");
		
		$("p").prev(".selected").css("font-size", "30px");
		$("p").prev().css("background", "yellow");
	});
</script>
<body>
	<h2 align="center"></h2>

	<div class="selected"><span>홍길동</span></div>
	<p class="selected">이순신</p>
	<p>유관순</p>
	<p>유관순</p>
	<span class="selected">강감찬</span>
	<p>이성계</p>
	<p>이성계</p>
	
</body>
</html>