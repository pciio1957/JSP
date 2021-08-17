<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.z01_database.*"
    import="jspexp.z02_vo.*"
    import="java.util.*"
%>
   
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 외부 CSS 설정 호출 -->
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>

</style>
<script type="text/javascript">
	window.onload = function() {
		document.querySelector("h3").innerText="8월 3일 정리문제";
	}

</script>
</head>
<%-- 

#정리문제
1. 액션태그 중, include, forward의 차이를 기술하세요!
	- include : 다른 페이지를 현재 페이지에 포함시키는 기능 
	- forward : 다른 페이지로 이동하는 기능
	
	forward: 요청값(key=value)를 함께 해당 페이지에 전달하면서 이동처리
	
2. 예외페이지 기본처리 형식을 파일로 기술하세요.
	a0803exp.jsp : 에러가 발생하면 호출할 페이지를 상단에 작성
		errorPage="z01_error.jsp"
	
	a0803exp2.jsp : 에러가 발생했을 때 출력될 페이지 
		파일 상단의 import부분에 isErrorPage = "true" 작성
		
	예외가 발생할 가망성이 있는 페이지 : errorPage="에러발생시 처리페이지"
	에러 발생시 처리페이지 : isErrorPage="true"

3. 서버, 클라이언트의 관계에서 임시 저장 객체 두가지를 기술하고, 그 중 client에 저장될 때, 핵심
   코드를 기술하세요.
   임시 저장 객체 
   1) session : reponse객체를 이용해 클라이언트(브라우저)에 데이터 저장
   2) cookie : request객체를 이용해 서버에 데이터 저장 
   
   3) 클라이언트에 저장할때
   Cookie cookie1 = new Cookie("name", "홍길동");
   reponse.addCookie(cookie1);
   
   4) 클라이언트에 저장된 값 사용할때
   Cookie[] cookies = request.getCookies();
   
   for(Cookie c:cookies) { // 객체를 이용한 for문으로 
   	<%= c.getName() %>, <%= c.getValue() %> // 각 데이터 사용가능
   	
   	서버에 임시 데이터 저장 : session
   	브라우저에 임시 데이터 저장 : cookie
   
5. ID:[   ][로그인] 요청값을 받아 조건문과 forward 액션태그를 이용해서, himan이면 
   main.jsp 아니면 login.jsp페이지로 이동하게하세요
   (아래)
   
6. 생성자 객체를 아이디, 패스워드, 이름, 기능메서드로 화면에 있는 테이블에 출력하게 선언하고,
   아이디[   ] 패스워드[    ] 이름[    ][등록] ==> 클릭시 하단 테이블에 생성자 객체의 메소드 show() 
   테이블                   출력
9:30까지 일단 진행해보겠습니다.

--%>

<body>
	<h3 align="center"></h3>
	<h4>5번 문제</h4>
	<% 
	String id = request.getParameter("id");
	
	if(id == null) { %>	
	<form id="frm01">
	<table class="listTable">
		<tr><th>ID</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><td colspan="2"><input onclick="login()" type="submit" value="로그인"/></td></tr>
	</table>	
	</form>
	
	<% } else {
	
		if(id.equals("himan")) {  %>
			<jsp:forward page="a0803_main.jsp"></jsp:forward>
	<% } else { %>
	<script type="text/javascript">
		alert("로그인 실패!");
	</script>
		<jsp:forward page="a0803_login.jsp"></jsp:forward>
	<% }} %>
	
	<br><br>
	
	<h4>6번 문제</h4>
	<form>
	<table align="center" class="listTable">
		<tr><th>아이디</th><td><input type="text" name="mid" value=""/></td></tr>
		<tr><th>패스워드</th><td><input type="text" name="mpass" value=""/></td></tr>
		<tr><th>이름</th><td><input type="text" name="mname" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="button" onclick="reg()" value="검색"/></td></tr>
	</table>	
	</form>
	
	<form id="showTab">
	<table  align="center" class="listTable">
		<tr><th>아이디</th><th>패스워드</th><th>이름</th></tr>
		<tbody></tbody>
	</table>
	</form>	
	
	<script type="text/javascript">
		function member(id, pass, name) {
			this.id = id;
			this.pass = pass;
			this.name = name;
			this.insert = function() {
				var tabAdd = document.querySelector("#showTab tbody");
				// el 태그 충돌로 `` 사용 불가.. 
				tabAdd.innerHTML += "<tr><td>" + this.id + "</td><td>" + this.pass +"</td><td>" + this.name + "</td></tr>";
			
			}
		}
		
		function reg() {
			var idVal = document.querySelector("[name=mid]").value;
			var passVal = document.querySelector("[name=mpass]").value;
			var nameVal = document.querySelector("[name=mname]").value;
			var m01 = new member(idVal, passVal, nameVal);
			m01.insert();
		}
	
	</script>
</body>
</html>