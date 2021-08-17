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

</style>
</head>
<%-- 

# 정리문제
1. form객체의 요청값 전송처리할 때, js로 처리하는 방식의 장점을 기본코드와 함께 기술하세요.
	<form><input type="submit"/> : 요청값을 바로 전송하여 처리한다
	<form><input type="button" id="funBtn"/>
	$("#funBtn").click(function(){ 
		// 요청값을 js로 전송하기 전에 
		1) 유효성check
		2) hidden을 활용해 특정요청값 변경처리
		3) $("form").attr("action", "호출할controller/페이지") 
			: 다른 controller단이나 페이지를 요청할 수 있다 
		$("#form").submit();
	});

2. form하위 객체의 checkbox와 radio의 요청값 전송시의 차이점을 기본코드로 기술하세요.
	checkbox의 경우 다중 선택으로 여러개의 값을 선택할 수 있으므로 
		getParameterValues()를 사용한다. 
	radio의 경우 단일 선택으로 한가지 값의 선택이므로 getParameter()를 사용한다.
	
	type="radio"인 경우
		name 속성이 같으면 단일 선택으로 요청값도 단일로 전송 
		?key=value
	type="checkbox"인 경우
		name 속성이 같으면 다중 선택으로 요청값이 checked가 된 것을 다중으로 전송
		?key=value1&key=value2..
	
3. type=hidden을 사용하는 경우를 기술하세요.
	..모르겠음
	
	화면에 요청값으로 보이지 않게 처리하면서 전송되어야 할 값을 처리할 때 주로 사용한다
	처리프로세스에 있어서 등록, 수정, 삭제 
	
4. 아래와 상품 등록을 처리하세요.
    상품명:[    ] 구분 :()도매()소매 배송지 :[]서울[]경기[]강원[]충청[]전라[]제주
    [배송]
    
5. 아래와 같이 list된 장바구니 제품 중에 []로 선택하여, 아래 기능에 의해 출력되게 하세요.
    [] 물건명
    [] @@@
    [] @@@
    [] @@@
   [선택][제거] ==> 선택시 요청값으로 선택 물건만, 제거시 제거된 값 이외 물건만 출력하세요.
# 다하신 분들은 손들어 주시고, 제출 해주세요 9:30 1차점검

--%>
<%

%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("8월 12일 복습문제");
		
		// 요청값을 js로 처리할 때 장점
		// 1. 값이 변경될 때 바로 데이터를 확인할 수 있다
		// 2. 서버와 연결없이 데이터를 확인할 수 있다 
		// 3. 데이터의 값이나 이름을 받아와 el태그로 바로 사용가능하다
		$("#tab01 input[type=radio]").change(function(){
			var gender = $(this).val();
			console.log(gender);
			$("#h4Show1").text("선택한 값 : " + gender);
		});
		
		var ckshow = "선택한 값 : ";
		$("#tab01 input[type=checkbox]").change(function(){
			var hobby = $(this).val();
			console.log(hobby);
			
			ckshow += hobby + "/";
			$("#h4Show2").text(ckshow);
		});
		
		$("#btndeli").click(function(){
			$("#frm02").submit();
		});

	});
</script>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table id="tab01" align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><th>부서명</th><td><input type="text" name="dname" value=""/></td></tr>
		<tr><th>성별</th>
			<td><input type="radio" name="gender" value="남"/>남
			<input type="radio" name="gender" value="여" checked/>여
			<h4 id="h4Show1"></h4></td></tr>
		<tr><th>취미</th>
			<td><input type="checkbox" name="hobby" value="독서"/>독서
			<input type="checkbox" name="hobby" value="음악감상"/>음악감상
			<input type="checkbox" name="hobby" value="영화감상"/>영화감상
			<h4 id="h4Show2"></h4>
			</td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input id="btnAdd" type="button" value="등록"/>
		</td></tr>
	</table>	
	</form>

	
	<%
		// radio와 checkbox의 차이
		String gender = request.getParameter("gender");
		String hobby[] = request.getParameterValues("hobby");
	
	%>
	
	<h3 align="center"> 상품 등록 </h3>
	<form id="frm02">
		<table id="tab02" align="center" class="listTable">
			<tr><th>상품명</th><td><input type="text" name="pname" value=""/></td></tr>
			<tr><th>구분</th><td>
				<input type="radio" name="salekind" value="도매" checked/>도매
				<input type="radio" name="salekind" value="소매"/>소매
			</td></tr>
			<tr><th>배송지</th><td>
				<input type="checkbox" name="loc" value="서울"/>서울
				<input type="checkbox" name="loc" value="경기"/>경기
				<input type="checkbox" name="loc" value="강원"/>강원
				<input type="checkbox" name="loc" value="충청"/>충청
				<input type="checkbox" name="loc" value="충청"/>전라
				<input type="checkbox" name="loc" value="경상"/>경상
				<input type="checkbox" name="loc" value="제주"/>제주
			</td></tr>
			<tr><td colspan="2" style="text-align:center">
			<input id="btndeli" type="button" value="배송"/> 
		</table>
	</form>
	
	<%
	
		String pname = request.getParameter("pname");
		String salekind = request.getParameter("salekind");
		String loc[] = request.getParameterValues("loc");
	
	%>
	
	<% if(pname != null) { %>
	<table align="center" class="listTable">
		<tr><th>상품명</th><td><%= pname %></td></tr>
		<tr><th>구분</th><td><%= salekind %></td></tr>
		<% for(int idx=0; idx<loc.length; idx++) { %>
		<tr><th>배송지</th><td><%= loc[idx] %></td></tr>
		<% } %>
	</table>	
	<% } %>
</body>
</html>