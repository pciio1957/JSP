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
#application을 통한 서버 정보
1. .getServerInfo() : 간단한 서버정보
2. .getMajorVersion() : 서블릿 규약 메이저 버전
3. .getMinorVersion() : 서블릿 규약 마이너 정보
4. application.log() : 서버단위 로그 메시지 기록
	cf) log() : jsp의 기본 로그 표기 

--%>
<%

%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
	});
</script>
<body>
	<h2 align="center"></h2>
	<table align="center" class="listTable">
		<tr><th>서버정보</th><td><%= application.getServerInfo() %></td></tr>
		<tr><th>서블릿 규약 메이저 버전</th><td><%= application.getMajorVersion() %></td></tr>
		<tr><th>서블릿 규약 마이너 정보</th><td><%= application.getMinorVersion() %></td></tr>
		</td></tr>
	</table>	

	<%
	
	log("로그 메시지 기록## jsp에서 기본 console로 출력되는 내용");
	application.log("로그 메시지 기록## application 단위");
	%>
	
	
	<%-- 
	응용) 물건명, 가격, 갯수 변수를 선언하여 System.out.println(), log, application.log()로
		서버 console에 출력처리 (5조 제출, 나머지 손들기)
	--%>
	
	<%
	
		String pname = "사과";
		int price = 10000;
		int cnt = 5;
	
		System.out.println("(print)물건명 : " + pname);
		System.out.println("(print)가격 : " + price);
		System.out.println("(print)cnt : " + cnt);
		
		log("(log)물건명 : " + pname);
		log("(log)가격 : " + price);
		log("(log)cnt : " + cnt);
		
		application.log("(application)물건명 : " + pname);
		application.log("(application)가격 : " + price);
		application.log("(application)cnt : " + cnt);
		
		
		// 에러를 확인하기 위한 입력값 받아오기 
		String ename = request.getParameter("ename");
		
		// 1. 에러 tracking 1단계 : 서버의 console에 데이터가 정상 처리되는지 확인
		log("요청값1 : " + ename);
	%>
	<form>
		<table align="center" class="listTable">
			<tr><th>사원명</th><td><input type="text" name="ename" value="<%= ename %>"/></td></tr>
			<tr><td colspan="2">
				<input type="submit" value="등록" id="btnAdd"/>
			</td></tr>
		</table>
	</form>
	<%
	
	log("요청값2 : " + ename);
	
	if(ename != null) {
	%>
	<h3 align="center"><%= ename.toString() %></h3>
	<% } %>
</body>
</html>