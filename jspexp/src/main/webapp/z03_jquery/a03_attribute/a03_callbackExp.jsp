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

table {
	margin-bottom:20px;
	padding:20px;
}

td {
	width:150px;
	height:150px;
	font-size:20pt;
	text-align:center;
}

</style>
</head>
<%-- 

응용) h3을 5개 복사하여 만들고, 배열로 선언한 5개 과일명 출력하기
	(4조 제출, 나머지 손들기)

--%>
<%

%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("콜백함수 연습");
		
		var colors = ["red", "yellow", "pink", "red","green"];
		var fruits = ["사과", "바나나", "복숭아","딸기", "수박"];
		$("h3").text(function(idx){
			$(this).css("Background",colors[idx]);
			return fruits[idx];
		});
		
	});
</script>
<body>
	<h2 align="center"></h2>
	<h3></h3>
	<h3></h3>
	<h3></h3>
	<h3></h3>
	<h3></h3>
		
	<%--  
	
	응용) 테이블 4X4를 만들고 4의 배수로 각 td에 글자를 표현하고 
		배경색생과 글자색상을 red, blue, yellow 중에 임의로 출력되게 하기
		초기에 text()를 기준으로 callback 함수를 만들어주기 (5조 제출, 나머지 손들기)
		
	--%>	
	
	<table id="tabCss" align="center" class="listTable">
		<tr><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td></tr>
	</table>
<script type="text/javascript">
	
	
	var strs = ["안녕", "하세요", "반가", "워요"];
	var colors = ["red", "blue", "yellow"];
	
	$("#tabCss td").text(function(idx){
		var bkRan = Math.floor(Math.random() * 3); 
		var coRan = Math.floor(Math.random() * 3); 
		
		$(this).css("color", colors[coRan]);
		$(this).css("background", colors[bkRan]);
		return strs[idx%4];
	});
	
</script>
</body>
</html>