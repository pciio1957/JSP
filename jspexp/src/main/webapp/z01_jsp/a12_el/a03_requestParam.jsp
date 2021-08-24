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
	width:70%;
	margin-bottom:20px;
	padding:20px;
}

td {
	text-align:center;	
}

</style>
</head>
<%-- 

# 요청값 처리 
1. 사용 방법
	1) ${param.요청키} : 단일 값
	2) ${paramValues.요청키} : 다중 값
	
2. 활용 방법
	1) 사칙연산자, 비교연산자, 논리연산자를 활용할 수 있다. 


--%>
<%

%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h2Obj").text("param 태그");
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><th>물건가격</th><td><input type="text" name="price" value=""/></td></tr>
		<tr><th>갯수</th><td><input type="text" name="cnt" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="검색"/>
		</td></tr>
	</table>	
	</form>
	
	<h3 align="center"> 요청값에 대한 처리 : ${param.name} </h3>
	<h3 align="center"> 사원명 : ${param.ename} </h3>
	<h3 align="center"> 물건가격 : ${param.price} </h3>
	<h3 align="center"> 물건갯수 : ${param.cnt} </h3>
	
	<!--  형변환 없이도 데이터 연산처리 가능 -->
	<h3 align="center"> 총계 : ${param.price * param.cnt} </h3>
	

	
	<!--  응용) el의 요청값 처리를 활용하여 회원id, pass, name, auth를 받아서 출력하기
			id와 pass는 himan/7777일 때 인증/미인증 처리되게 하기 (1조 제출, 나머지 손들기) -->
			
	<h3 align="center"> 회원 정보 </h3>		
	<form id="frm02">
	<table align="center" class="listTable">
		<tr><th>회원id</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><th>회원pw</th><td><input type="text" name="pw" value=""/></td></tr>
		<tr><th>회원명</th><td><input type="text" name="name" value=""/></td></tr>
		<tr><th>회원권한</th><td><input type="text" name="auth" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="검색"/>
		</td></tr>
	</table>
	
	<h3 align="center"> 회원 결과 </h3>
	<table align="center" class="listTable">
		<tr><th>회원id</th><td>${param.id }</td></tr>
		<tr><th>회원pw</th><td>${param.pw }</td></tr>
		<tr><th>회원명</th><td>${param.name }</td></tr>
		<tr><th>회원권한</th><td>${param.auth }</td></tr>
	</table>	
	
</body>
</html>