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
	div {
		background:blue; 
		border:1px solid red;
		width:70px;
		height:70px;
		margin:0 3px;		
	}
	
	.toggleCls {
		width:10px;
		height:10px;
	}
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" 
		type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
		
		
		/*
		응용) a06_aniExp.jsp div 위 내용을 적용하되 색상은 파랑색 float:left;는 제거, 
			class로는 width와 height 10px, 10px로 선언하고
			3개의 div를 만들고 1번째, 3번째가 slide로 보였다가/보이지않았다가를
			처리하고 버튼 클릭시 클래스를 적용/미적용 처리하기 
		*/
		
		$("#run").click(function() {
			$(":animated").toggleClass("toggleCls");
		});
	
		animateIt();
		
		function animateIt() {	
			// slideToggle("속도", 반복할함수) : 해당 대상객체를 보였다가 보이지않았다를 슬라이더 형식으로 처리
			//$("#ani").slideToggle("slow", animateIt); // 재귀적 호출
			$("div:eq(0), div:eq(2)").slideToggle("slow", animateIt);
		}
	});
</script>
</head>
<%-- 
# 

--%>
<%

%>
<body>
	<h2 align="center"></h2>
	<button id="run">실행</button>
	<div></div>
	<div></div>
	<div></div>	
</body>
</html>