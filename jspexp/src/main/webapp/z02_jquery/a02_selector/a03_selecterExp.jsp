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
	$("h2#exp01").text("시작");
	
	$("h2#exp01").click(function() {
		alert("클릭");
		
		// 응용) div, span과 p태그 하위의 클래스 myClass에 대하여 선택자를 지정하고
		//		해당 선택자에 대해 글자색상을 red로 처리하기 (4조)
		// $("선택자1, 선택자2") 사용
		// 그러니까 div + span, p의 myClass에 다 적용
		$("div, span, p.myClasss").css("color", "red");
		
	});
	
	// 응용) class명이 topnav인 ul 바로밑(*) li에 border 3px double red로
	//		처리하기 (5조)
	$("ul.topnav>li").css("border","3px double red");
	
	
	

</script>
</head>
<body>
	
	<h2 align="center" id="exp01">선택자연습 </h2>
	<div>div</div>
	<p class="myClass">p class="myClass"</p>
	<p class="notMyClass">p class="notMyClass"</p>
	<span>span</span>
	<br>
	
	<h2 id="exp02" align="center">선택자연습2</h2>
	<ul class="topnav">
		<li>아이템1 </li>
		<li>아이템2 
			<ul>
				<li>중첩 아이템 1</li>
				<li>중첩 아이템 2</li>
				<li>중첩 아이템 3</li>
			</ul></li>
		<li>아이템3</li>
	</ul>
	
</body>
</html>