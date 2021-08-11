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
		$("#h3Title").text("0804 정리문제");
		
		$("#div01>.div02").css("background-color", "yellow");
		$("#h402").css("color", "blue");
		$(".div02.h3").css("color", "red");
		
		
			$("#check").click(function(){
		
			var pass = $("input[name=pass]").val();
			var passCk = $("input[name=passCk]").val();
			
			console.log("비번 " + pass);
			console.log("체크 " + passCk);
				
			if(pass!=passCk) {
				alert("패스워드 확인이 일치하지않습니다 \n 확인해주세요");
			}
			
		
			});
	});
	

	
	
</script>
</head>
<%-- 
# 정리문제
1. jquery에서 CDN 방식 lib 로딩이란 무엇인가?
	CDN은 content delivery network의 약자로 CDN을 통해 jquery파일을 실시간으로 로딩해서 사용한다
	
	content delivery network 방식으로 바로 주소값을 통해서 lib를 사용한다
	따로 현재 서버안에 lib가 필요없지만 인터넷이 되어 있어야 하는 단점도 포함하고 있다 
	
2. jquery의 계층 구조 선택자의 형식을 기본 예제를 통해서 기술하세요.
	선택자의 종류
	1) * : 모든 엘러먼트 일치..
	2) E : 태그명이 E인 모든 엘리먼트
	3) E F : 태그명이 E이고 하위 엘리먼트 이름이 F인 엘리먼트..
	4) E > F : E의 바로 아래  F엘리먼트 선택.
	5) E + F : E의 형제 엘리먼트로 바로 다음 형제 F 엘리먼트
	6) E ~ F : E의 형제 엘리먼트로 다음에 오는 모든 F 엘리먼트
	7) E.C : 클래스명 C를 가지고 있는 모든 E 엘리먼트.
	8) E#I : 아이디가 I인 E엘리먼트.
	9) E[A] : 속성 A를 가지 E엘리먼트
	10) E[A=V] : 속성 A와 속성값 V를 가진 엘리먼트
	
	$("상위요소1 하위요소2") : 계층 레벨에 상관없이 상위요소를 가진 하위요소에 대한 선택을 할 때
		ex) $("table input[name=id]") : 테이블 구조 안에 td안에 있는 input name="id"에 대한 선택
	$("부모요소>자식요소") : 바로 위 부모 요소객체를 가진 자식요소에 대한 선택
		ex) $("ul.ch01>li") : 바로 위 부모의 클래스명이 ch01인 ul 태그의 하위 li에 대한 선택
			<ul class="ch01">
				<li>
				<li>
	$("형제1 + 형제2") : 같은 부모를 가진 level의 요소객체에서 형제1요소를 앞에 두 형제2요소 객체에 대한 선택
		<tr>
			<td class="cla01">
				<td>
				<td>
				<td>

3. jquery를 선택자를 활용해서 password와 password 확인 항목에 대한 일치여부 유효성 체크를 하세요.
4. [js]전날한 생성자 class를 선언하고, 객체를 생성하는 형식을 활용하여, 장바구니에 담은 상품을 누적처리하세요.
    물건 매장
    물건명:[   ] 가격:[    ] 갯수:[   ] [장바구니담기]
5. [jsp]위 내용을 jsp로 요청값으로 넘기고, session에 누적처리하는 프로그램을 작성하고,
    [장바구니확인하러가기] 를 통해 현재 담기 session 객체를 리스트 확인하세요.
~9:30까지 일단 진행하겠습니다.~

--%>
<%

%>
<body>
	<h3 align="center" id="h3Title"></h3>
	<h4 id="h401"></h4>
	<div id="div01">
		<div class="div02">
			<h4 class="h4s">예제1</h4>
			<h4>예제1</h4>
			<h4 class="h4s">예제1</h4>
			<h4 id="h402">예제1</h4>
			<h3>예제2</h3>
			<h3>예제2</h3>
			<h3>예제2</h3>			
			<h4 id="h403">예제1</h4>
			<h3>예제2</h3>
		</div>
	</div>
	
	<br><br>
	<form>
		<table>
			<tr><th>아이디</th><td><input type="text" name="id" value=""></td></tr>
			<tr><th>비밀번호</th><td><input type="text" name="pass" value=""></td></tr>
			<tr><th>비밀번호 확인</th><td><input type="text" name="passCk" value=""></td></tr>
			<tr><td colspan="2"><input type="button" id="check" value="확인"></td></tr>
		</table>
	</form>
	<h4 id="result"></h4>
	
	<%
	
	String pass = request.getParameter("[name=pass]");
	String passCk = request.getParameter("[name=passCk]");
	
	%>

	
	
	<table id="tab01">
		<tr><th>물건명</th><td><input type="text" name="pname" value=""></td></tr>
		<tr><th>물건가격</th><td><input type="text" name="price" value=""></td></tr>
		<tr><th>물건갯수</th><td><input type="text" name="cnt" value=""></td></tr>
		<tr><td colspan="2"><input type="button" id="add" value="장바구니담기"></td></tr>
	</table>
	<div id="divshow"></div>
	
	<script type="text/javascript">
	
	var btnAdd = document.querySelector("#add");
	
	btnAdd.onclick = function() {
		var name = document.querySelector("[name=pname]");
		var price = document.querySelector("[name=price]");
		var cnt = document.querySelector("[name=cnt]");
		
		var per01 = new Product(name, price, cnt);
		per01.append();
	}
	
	class Product {
		
		constructor(name, price, cnt) {
			this.name = name;
			this.price = price;
			this.cnt = cnt;
		}
		
		append() {
		
			var divshow = document.querySelector("#divshow");
			
			divshow.innerHTML += "구매물건정보";
			divshow.innerHTML += name + price + cnt;
		}
	}
	</script>
	
</body>
</html>