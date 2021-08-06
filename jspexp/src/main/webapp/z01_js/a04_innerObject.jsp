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
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h3Title").text("내장객체");
	});
	
	var num01 = 275;
	var num02 = new Number(275);
	
	console.log(typeof(num01));
	console.log(typeof(num02));
	
	// toFixed(소숫점자리수) : 객체에서 지원하는 기능메소드가 일반 number에서도 사용가능하다
	
	var num03 = 275.243222;
	console.log("소숫점 한자리수 : " + num03.toFixed(1));
	console.log("소숫점 한자리수 : " + num03.toFixed(3));
	
	
	// 타율계산 -> 실행이 왜인지 안됨
	$("[type=button]").click(function() {
		var base = $("[name=base]").val(); // 타석의 값을 가져오기
		var hitPt = $("[name=hitPt]").val(); // 안타의 값을 가져오기 
		// 타율을 처리하여 h3에 출력하되 소숫점 3자리로 표현하기 
		var hitnum = hitPt/base;
		console.log(base);
		console.log(hitnum);
		
		// text() : jquery에서 화면출력
		$("h3").text("타율 :" + hitnum.toFixed(3)); 
		
		// 응용) .html() 태그 랜더링 처리 (2조)
		//$("h2").html(hitnum.tofixed(3));
		
		
	});
	
</script>
</head>
<%-- 

#내장 객체와 기능 메소드
1. Number
	숫자형 데이터를 생성 처리하는 객체
	일반적으로 하위에 여러가지 변환 메소드를 통해서 데이터를 처리해준다
	java의 wrapper(Integer, Double 등) 개념을 nuboxing, bocing 개념을
	자동으로 처리하여 사용될 수 있도록 한다. 즉 숫자데이터.기능메소드() 처리가 가능하다 
	

--%>
<%

%>
<body>
	<h3 align="center" id="h3Title"></h3>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>타석</th><td><input type="text" name="base" value="0"/></td></tr>
		<tr><th>안타</th><td><input type="text" name="hitPt" value="0"/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="button" value="타율계산"/></td></tr>
	</table>	
	</form>
</body>
</html>