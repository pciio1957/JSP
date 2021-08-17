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
		$("#h3Title").text("시작");
		$("h2").eq(1).text("선택");
		$("h2").first().css("color", "navy");
		$("h2:even").css("background", "yellow");
		
		var ranIdx = Math.floor(Math.random() * $("h2").length);
		$("h2").eq(ranIdx).text("빙고");
		
		
		// 응용) 3X3 테이블을 만들고, 해당 셀에 1~9번을 입력한 후 
		//	특정 임의의 부분에는 배경색상을 노란색, 글자는 빙고로 출력하기 (완료후 손들기)
	
	/* 테이블에 번호 지정하기 (안됨)
		var tds = document.querySelectorAll("td");
		for(var idx=0; idx<tds.length; idx++) {
			tds[idx].text = idx+1 + "번";
		}
	*/
	
	/* 임의의 부분에 색지정
		var ranIdx2 = Math.floor(Math.random() * $("td").length);
		$("td").eq(ranIdx2).text("빙고");
		$("td").eq(ranIdx2).css("background","yellow");
		$("td").last().css("background", "red");
	*/	
		// 풀이
		var tds = $("#tab01 td");
		var ranIdx3 = Math.floor(Math.random() * tds.length);
		
		// td 객체에 번호를 설정
		for(var idx=0; idx<tds.length; idx++) {
			$("#tab01 td").eq(idx).text(idx+1);
		}
		$("#tab01 td").eq(ranIdx3).css("background","yellow");
		$("#tab01 td").eq(ranIdx3).text("빙고");
		
	
	});
	

</script>
</head>
<%-- 
#위치기반 선택자
$("선택자작성") 

 :first : 페이지에서 처음으로 일치하는 엘리먼트
 :last : 마지막으로 일치하는 엘리먼트
 :even : 페이지 전체의 짝수번째 엘리먼트 반환
 :odd : 페이지 전체의 홀수번째 엘리먼트 반환
 :eq(n) : n번째로 일치하는 엘리먼트
 :gt(n) : greate then : n번째(포함하지않음) 이후의 일치하는 엘리먼트 반환
 :lt(n) : less then : n번째(포함하지않음) 이전의 일치하는 엘리먼트 반환
 :first-child : 첫번째 자식 엘리먼트
 :last-child : 마지막 자식 엘리먼트
 :nth-child(n) : n번째 자식 엘리먼트 반환 
 	화면에 요소의 부모 하위의 자식객체를 기준으로 순서
 :nth-child(even) : 짝수 자식 엘리먼트 반환
 :nth-child(odd) : 홀수 자식 엘리먼트 반환
 :nth-child(Xn+Y) : 전달된 공식에 따른 n번째 자식 엘리먼트 반환, Y는 0일 경우 생략 가능 
--%>
<%

%>
<body>
	<h3 align="center" id="h3Title"></h3>
	<h2></h2>
	<h2></h2>
	<h2></h2>
	<h2></h2>
	<h2></h2>

	<table align="center" class="listTable" id="tab01">
		<tr><td>1</td><td>2</td><td>3</td></tr>
		<tr><td>4</td><td>5</td><td>6</td></tr>
		<tr><td>7</td><td>8</td><td>9</td></tr>
	</table>	
	
</body>
</html>