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
</script>
</head>
<%-- 
#표현언어
1. Expression language
2. jsp에서 사용가능한 새로운 스크립트 언어
3. el의 주요 기능
	1) jsp의 네가지 기본 객체가 제공하는 영역의 속성 사용
	2) 집합 객체에 대한 접근 방법 제공
	3) 수치 연산, 관계연산, 논리연산 제공
	4) 자바 클래스 메소드 호출 기능 제공
	5) 표현언어만의 기본 객체 제공
	
4. 간단한 구문 때문에 표현식 대신 사용

--%>
<%

	request.setAttribute("num01", 25); // request 범위로 num01 변수에 25할당
	request.setAttribute("num02", 30); // request 범위로 num02 변수에 30할당
	request.setAttribute("name", "홍길동"); 
	
	//응용) 물건명 가격 갯수를 request로 선언하고 el로 물건명 가격 갯수 총계 출력하기 (5조)

	request.setAttribute("pname", "이클립스");
	request.setAttribute("price", 2500);
	request.setAttribute("cnt", 3);
	
	// el 태그는 property 개념으로 접근 가능하다 -> getXXX 사용가능
	// 주의!! 접근제어자가 있는 field를 접근하는 것이 아니고 
	// public으로 된 get프로퍼티를 접근해서 호출하는것이다
	request.setAttribute("prod", new Product("오렌지", 2000, 10));
	
	
%>
<body>
	<h3 align="center" id="h3Title"></h3>
	<h2 align="center">${"EL 태그로 출력"}</h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>이름</th><td>${name} </td></tr>
		<tr><th>합</th><td>${num01} + ${num02} = ${num01+num02} </td></tr>
		<tr><th>합</th><td>${num01} - ${num02} = ${num01-num02} </td></tr>
		<tr><th>합</th><td>${num01} * ${num02} = ${num01*num02} </td></tr>
		<tr><th>합</th><td>${num01} / ${num02} = ${num01/num02} </td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	
	<h3 align="center"> 물건 정보 단일 </h3>
	<table  align="center" class="listTable">
		<tr><th>물건명</th><td>${pname} </td></tr>
		<tr><th>물건가격</th><td>${price}</td></tr>
		<tr><th>물건갯수</th><td>${cnt}</td></tr>
		<tr><th>총 가격</th><td>${price*cnt}</td></tr>
	</table>	
	
	<h3 align="center"> 물건 정보 객체형 </h3>
	<table  align="center" class="listTable">
		<tr><th>물건명</th><td>${prod.pname} </td></tr>
		<tr><th>물건가격</th><td>${prod.price}</td></tr>
		<tr><th>물건갯수</th><td>${prod.cnt}</td></tr>
		<tr><th>총 가격</th><td>${prod.price*prod.cnt}</td></tr>
	</table>	
	
</body>
</html>