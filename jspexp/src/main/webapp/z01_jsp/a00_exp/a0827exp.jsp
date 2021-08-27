<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Front 연습</title>
<link rel="stylesheet" href="${path}/z00_com/a01_com.css">
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

#정리문제
1. XMLHttpRequest 객체의 get/post 방식의 코드 차이를 기술하기
	XMLHttpRequest객체를 이용한 요청값 처리 방식
	1) 작성 부분
		var xhr = new XMLHttpRequest(); // 선언
		xhr.open("get/post", "파일명", true/false); // 요청값 전달할 파일 및 방식 선언
		xhr.send(); // 서버에 데이터저장
		
	2) get방식
		주소창에 변수가 입력되서 전달됨. 사용자가 데이터를 볼 수 있어서 보안에 취약
		
	3) post방식
		주소창에 변수가 입력되지않고 전달. 사용자가 볼 수 없어 보안에 유리함. 

2. post 방식 + 비동기로 학생의 국어/영어/수학 점수를 입력해 총점과 평균 구하기
	(아래)
	
3. get 방식 + 동기 방식으로 회원아이디를 입력하여 DAO를 통해서 해당 회원의 아이디/패스워드, 이름, 권한, 포인트를
	출력되도록 하기 
	(아래)
	
4. jstl과 useBean을 활용하여 객체선언 및 데이터 할당 3가지 방식 기술하기
	객체 선언 및 데이터 할당 방법
	1) useBean으로 객체 생성 후 setXXX() 메소드로 데이터 할당
		<useBean id="stu01" class="jspexp.z02_vo.Student"/>
		${stu01.setName("홍길동")}
		
	2) useBean으로 객체 생성 후 jstl로 데이터 할당
		<useBean id="stu01" class="jspexp.z02_vo.Student"/>
		<c:set var="${stu01.name}" value="홍길동"/>
		
	3) jstl객체 선언 후 setXXX()메소드로 데이터 할당
		<c:set var="stu01" value="${new Student()}"/>
		${stu01.setName("홍홍")}

5. 임의의 구구단이 출력되어 입력값을 입력했을 때/입력하지 않을 때/정답/오답을
	jstl 조건문을 활용하여 처리하기
	
6. 물건


--%>
<%

%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){

		var xhr = new XMLHttpRequest();
		
		$("#btnAvg").click(function(){
			
			var kor = $("[name=kor]").val();
			var eng = $("[name=eng]").val();
			var math = $("[name=math]").val();
			
			var data1 = "kor=" + kor + "&eng=" + eng + "&math=" + math;
			xhr.open("post", "z0827_data.jsp", true);
			
			console.log(data1);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send(data1);
			
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200) {
					$("#div01").html(xhr.responseText);
				}
			}
		});
		
		// enter키 누를때 처리 
		$("[name=kor], [name=eng], [name=math]").keyup(function(event){
			if(event.keyCode == 13) {
				var kor = $("[name=kor]").val();
				var eng = $("[name=eng]").val();
				var math = $("[name=math]").val();
				
				var data1 = "kor=" + kor + "&eng=" + eng + "&math=" + math;
				xhr.open("post", "z0827_data.jsp", true);
				
				xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				xhr.send(data1);
				
				xhr.onreadystatechange = function(){
					if(xhr.readyState == 4 && xhr.status == 200) {
						$("#div01").html(xhr.responseText);
					}
				}
			}
		});
		
		
		$("#btnLg").click(function(){
			var id = $("[name=id]").val();
			var pw = $("[name=pw]").val();
			var data2 = "?id=" + id + "&pw=" + pw;
			console.log(data2);
			
			xhr.open("get", "z0827_data2.jsp" + data2, false);
			xhr.send();
			
			$("#div02").html(xhr.responseText);
		});
		
		
		$("[name=id]").keyup(function(event){
			if(event.keyCode == 13){
				var id = $("[name=id]").val();
				var data3 = "?id=" + id;
				console.log(data3);
				
				xhr.open("get", "z0827_data3.jsp" + data3, false);
				xhr.send();
				
				$("#div02").html(xhr.responseText);
			}
		});
		
	});
</script>
<body>
	<h2 align="center">8월 27일 정리문제</h2>
	
	<h3 align="center">2번 문제</h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>국어</th><td><input type="text" name="kor" value=""/></td></tr>
		<tr><th>영어</th><td><input type="text" name="eng" value=""/></td></tr>
		<tr><th>수학</th><td><input type="text" name="math" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="button" id="btnAvg" value="성적계산"/>
		</td></tr>
	</table>	
	</form>
	<div id="div01"></div>
	
	
	<h3 align="center">3번 문제</h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><th>비밀번호</th><td><input type="text" name="pw" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="button" id="btnLg" value="로그인"/>
		</td></tr>
	</table>	
	</form>	
	<div id="div02"></div>
	
	
	<c:set var="stu01" value="<%= new Student() %>"/>
	${stu01.setName("홍홍")}
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><th>${stu01.name }</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="검색"/>
		</td></tr>
	</table>	
	</form>
	
	<table align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
	
	<h3 align="center">6번 문제</h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>물건가격</th><td><input type="text" name="price" value=""/></td></tr>
		<tr><th>물건갯수</th><td><input type="text" name="cnt" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="구매"/>
		</td></tr>
	</table>	
	</form>

	<!--  jstl의 변수는 지역변수/전역변수의 개념이 없다
		조건문에 선언된 내용도 조건문이나 반복문 밖에서 사용할 수 있다 -->
	<c:if test="${not empty param.price}">
		<c:set var="tot" value="${param.price * param.cnt}"/>
		<h3 align="center"> 구매 총계가 ${param.price * param.cnt}로 
			<c:choose>
				<c:when test="${tot >= 100000}">
					<c:set var="disRatio" value="10%"/>
					<c:set var="last_tot" value="${Math.round(tot*0.9) }"/>
				</c:when>
				<c:when test="${tot >= 50000}">
					<c:set var="disRatio" value="5%"/>
					<c:set var="last_tot" value="${Math.round(tot*0.95) }"/>
				</c:when>
				<c:otherwise>
					<c:set var="disRatio" value="3%"/>
					<c:set var="last_tot" value="${Math.round(tot*0.97) }"/>
				</c:otherwise>
			</c:choose>
		</h3>
	</c:if>
	
</body>
</html>