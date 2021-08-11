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
		$("h2").text("시작");
	});
</script>
</head>
<%-- 
#Request 기본 객체
1. 웹 브라우저가 웹 서버에 전송한 요청 관련 정보 제공
2. 주요 기능
	1) 클라이언트와 관련된 정보 읽기 기능
	2) 서버와 관련된 정보 읽기 기능
	3) 클라이언트가 전송한 요청 파라미터 읽기 기능
	4) 클라이언트가 전송한 요청 헤더 읽기 기능
	5) 클라이언트가 전송한 쿠키 읽기 기능
	6) 속성 처리 기능
3. 기본 정보 제공 메소드
	http://localhost:7080/jspexp/index.jsp
	1) request.getRemoteAddr() : 웹 서버에 연결한 클라이언트의 ip 주소를 구한다
	2) request.getMethod() : 웹브라우저가 정보를 전송할 때 사용한 방식을 구한다
	3) request.getRequestURI() : 웹 브라우저가 요청한 URL에서 경로를 구한다.
	4) request.getContextPath() : jsp 페이지가 속한 웹 애플리케이션의 컨텍스트 경로를 구한다
	5) request.getServerName() : 연결할 때 사용한 서버 이름을 구한다 ex) localhosst
	6) request.getServerPort() : 서버가 실행중인 포트 번호를 구한다 ex) 7080

--%>
<%
	// 한글 요청값의 처리, post방식일 때 처리
	request.setCharacterEncoding("utf-8");
	// contextpath는 프로젝트명으로 물리적으로 서버상의 jspexp\src\main\webapp
	// 기준으로 접근하여, 여러가지 자원(파일/이미지/css)등을 절대위치로 접근이 가능함
	String path2 = request.getContextPath();

%>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>클라이언트 주소</th><td><%= request.getRemoteAddr() %></td></tr>
		<tr><th>요청한 URL</th><td><%= request.getRequestURI() %></td></tr>
		<tr><th>서버 이름 </th><td><%= request.getServerName() %></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<table align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>