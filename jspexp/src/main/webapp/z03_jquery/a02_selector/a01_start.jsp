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
		
		// css의 속성 선언 color(글자색)을 blue로 지정
		$("*").css("color", "blue"); 
		
		// 테이블 제목의 css 속성 color(글자색)을 navy로 지정
		$("th").css("color", "navy");
		
		// .val : form하위 요소객체 value값 속성 처리 메소드
		$("table input").val("안녕하세요..");
		
		$("h1").css("color","red");
		$("h1").css("background","yellow");
		
		$("h3").css("color","blue");
		$("h3").css("background","green");
		
		//$("h4").css("color","yellow");
		//$("h4").css("background","purple");
		
		// json 형식으로 한번에 여러개 속성 지정도 가능 
		$("h4").css({"color":"yellow", "background":"blue"});
	});
</script>
</head>
<%-- 
#선택자
1. 문서 내에서 원하는 엘리먼트를 쉽게 식별하고 이를 추출하기 위해서 
	css/jquery에서 제공하는 기술이다.
2. 기본 css 선택자 : css 선택자를 통해서 DOM 객체를 선택할 수 있는 것을 말한다.
	1) * : 모든 엘리먼트 일치
	2) E : 태그명이 E인 모든 엘리먼트
	3) E F : 태그명이 E이고 하위 엘리먼트 이름이 F인 엘리먼트
	4) E > F : E의 바로 아래 F엘리먼트 선택
	5) E + F : E의 형제 엘리먼트로 바로 다음 형제 F엘리먼트
	6) E ~ F : E의 형제 엘리먼트로 다음에 오는 모든 F엘리먼트
	7) E.C : 클래스명 C를 가지고 있는 모든 E엘리먼트
	8) E#I : 아이디가 I인 E엘리먼트
	9) E[A] : 속성 A를 가지는 E엘리먼트
	10) E[A=V] : 속성 A와 속성값 V를 가진 엘리먼트
	
	응용) h1, h3, h4를 선언하고 각각의 글자색상으로 빨 파 노로 처리하고 배경색 처리 (2조)

--%>
<%

%>
<body>
	<h3 align="center" id="h3Title"></h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<table  align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>
	
	<h1>데이터 1번</h1>	
	<h3>데이터 2번</h3>	
	<h4>데이터 3번</h4>	
	
</body>
</html>