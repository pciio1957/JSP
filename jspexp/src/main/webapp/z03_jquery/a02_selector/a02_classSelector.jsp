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
		$("#h3Title").text("시작");
	});
	
	function class01() {
		$(".myclass").css("border", "2px solid blue");
	}
	
	function class02() {
		$(".otherClass").css("color", "red");
	}
	
	function class03() {
		$(".myClass.otherClass").css({"border": "2px solid blue", "color": "red"});
	}
</script>
</head>
<%-- 
# 

응용) 클릭시 myClass는 border 2px solid blue 속성 설정
	otherClass는 글자 색상을 빨강색으로 속성 설정 (3조)

--%>
<%

%>
<body>
	<h2 align="center"></h2>
	<h3 align="center" onclick="class01()">myClass 작성</h3>
	<h3 align="center" onclick="class02()">other 클래스</h3>
	<h3 align="center" onclick="class03()">myClass와 other 클래스 적용</h3>
	
	<div class="myclass">div = "notMe" </div>
	<div class="otherClass">div = "otherClass"</div>
	<div class="myClass otherClass">span class="myClass"</div>

	
</body>
</html>