<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    import = "java.net.*"    
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
	margin-bottom:20px;
	padding:20px;
}

</style>
</head>
<%-- 
#쿠키(Cookie)
1. 쿠키는 웹 브라우저가 보관하고 있는 데이터로서 웹 서버에 요청을 보낼 때 함께 전송된다.
2. 동작 방식 
	1) 쿠키 생성 : 웹서버 -> 브라우저(쿠키저장소)
		response.addCookie(new Cookie(name, value));
	2) 쿠키 저장 : 브라우저의 쿠키 저장소에 저장 처리
	3) 쿠키 전송 : 브라우저 -> 웹 서버 (요청객체를 통해 전달)
		request.getCookies();
	
3. 쿠키의 구성
	1) 구성요소
		- 이름 : 각각의 쿠키를 구별하는 데 사용되는 이름
		- 값 : 쿠키의 이름과 관련된 값
		- 유효시간 : 쿠키의 유지 시간
		- 도메인 : 쿠키를 전송할 도메인
		- 경로 : 쿠키를 전송할 요청 경로 
	2) 쿠키 이름의 제약 (특수문자와 한글 처리)
		- 쿠키의 이름은 아스키 코드의 알파벳과 숫자만을 포함할 수 없다
		- 콤마, 세미콜론, 공백 등의 문자는 포함할 수 없다.
		- $로 시작할 수 없다. 
		-> encoding 처리를 해야한다.
		
	3) 쿠키의 encoding과 decoding 처리
		한글과 같은 문자를 처리할 때 encoding으로 저장하고, decoding으로 불러와야한다
		Encoding 처리 : URLEncoder.encoder("한글데이터", "utf-8");
		Decoding 처리 : URLDncoder.decoder("한글데이터", "utf-8");

4. 쿠키값의 삭제
	1) 쿠키값은 일단 서버와 클라이언트가 끊어지면 사라진다
		서버가 재가동 또는 클라이언트의 브라우저를 다 닫으면 서버와 연결이 끊어진다.
	2) 클라이언트 프로그램으로 삭제할 수 있지만, jsp는 서버프로그램으로 삭제하여야 하므로
		해당 쿠키를 다시 client로 보내기전에 유효시간을 0으로 설정하여 response객체로
		전달하여 브라우저의 저장 위치에서 삭제되게 한다.
		 ex) ck.setMaxAge(0);
		 	response.addCookie(ck);
--%>
<%
	// 1. 쿠키 생성하기
	Cookie cookie = new Cookie("cookie01", "strawberryTaste");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
	
	
	// 2. 쿠키 생성시 한글로 생성하면 에러남
	// 3. 한글로 인코딩해줘야함 
	Cookie cookie2 = new Cookie(URLEncoder.encode("쿠키", "utf-8"), URLEncoder.encode("민트초코", "utf-8"));
	response.addCookie(cookie2);
	
%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("쿠키 생성하기").click(function(){
			// 현재 페이지에서 쿠키 생성 -> 확인
			location.href = "a01_basic.jsp";
		});
		
	});
</script>
<body>
	<h2 align="center"></h2>
	
	<%
	
	Cookie[] cookies = request.getCookies();
	
	%>
	
	<table align="center" class="listTable">
		<tr><th>쿠키이름</th><th>쿠키값</th></tr>
		<% if(cookies != null) { 
			for(Cookie ck : cookies) {
		%>
		<tr><td><%= ck.getName() %></td><td><%= ck.getValue() %></td></tr>
		<tr><td><%= URLDecoder.decode(ck.getName(), "utf-8") %></td><td><%= URLDecoder.decode(ck.getValue(), "utf-8") %></td></tr>

	
	<% 		}
		} 
	%>
	</table>	
	
	
	
	<!--  응용) 앞의 응용문제에서 한글로 쿠키값을 설정하여 확인할 수 있도록 하기 (1조 제출, 나머지 손들기) -->
</body>
</html>