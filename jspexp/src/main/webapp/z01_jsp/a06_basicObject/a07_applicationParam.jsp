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
	width:50%;
	margin-bottom:20px;
	padding:20px;
}

td {
	text-align:center;
}

</style>
</head>
<%-- 
#application 기본 객체 : 초기 파라미터
1. 초기화 파라미터 설정 : web.xml 파일 활용 
	<context-param>
		<description> 파라미터 설명
		<param-name> 파라미터 이름
		<param-value> 파라미터값
2. application 초기 파라미터 관련 기능 메소드
	getInitParameter(String name)
	getInitParameterNames()
	
-> ★이렇게 사용하게 되면 프로그램 각 화면별로
공통적으로 쓰이는 정보를 web.xml에 선언하고 
각 화면에서 불러오면 더 효과적으로 공통 코드 관리가 됨★ 
예를 들면 DB정보나 서버 정보, 파일 및 이미지 경로 등! 

-> 공통정보를 입력해놓으면 여러곳에서 수정하지않고
web.xml에서만 변경하면 사용하는 다른곳에서 적용가능 


#Enumeration 객체의 기능 메소드
1. .hasMoreElements() : 다음 라인의 데이터가 있는지 여부 리턴 boolean
2. .nextElement() : 구성요소의 값을 가져온다. name값을 가져올 수 있다.


--%>
<%

	String info01 = application.getInitParameter("DB_IP");


	// 응용) db의 port/sid/username/pass를 web.xml에 설정하고, 화면에 출력하기
	//		(2조 제출, 나머지 손들기)
	
	String dbPort = application.getInitParameter("DB_PORT");
	String dbSid = application.getInitParameter("DB_SID");
	String dbUserName = application.getInitParameter("DB_USERNAME");
	String dbPass = application.getInitParameter("DB_PASS");
	
	Enumeration<String> initParams = application.getInitParameterNames();
	
	

%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("application info");
	});
</script>
<body>
	<h2 align="center"></h2>
	<h3 align="center"> DB 연결 정보 </h3>
	<table align="center" class="listTable">
		<tr><th>아이피</th><td><%= info01 %></td></tr>
		<tr><th>포트번호</th><td><%= dbPort %></td></tr>
		<tr><th>SID</th><td><%= dbSid %></td></tr>
		<tr><th>사용자명</th><td><%= dbUserName %></td></tr>
		<tr><th>비밀번호</th><td><%= dbPass %></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="검색"/>
		</td></tr>
	</table>
	
	<h3 align="center">서버(web.xml)에 있는 값들</h3>	
	<table align="center" class="listTable">
		<tr><th>이름</th><th>값</th></tr>
		<% while(initParams.hasMoreElements()) { 
			String name = initParams.nextElement();
		%>
		<tr><td><%= name %></td><td><%= application.getInitParameter(name) %></td></tr>
		<% } %>
		
	</table>
</body>
</html>