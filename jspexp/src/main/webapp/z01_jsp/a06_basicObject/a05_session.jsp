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

h4 {
	text-align:center;
}

</style>
</head>
<%-- 

응용) session과 application 범위로 사원정보(아이디, 패스워드, 사원명, 일반사용자, 1000)과
	관리자 정보(아이디, 패스워드, 사원명, 관리자, 2000)을 설정하여 
	다음 화면(이동처리) a06_sessionScope.jsp로 확인 (1조 제출, 나머지 손들기)

--%>
<%

	session.setAttribute("SSuser", new Member("himan1", "7777", "홍길동", "일반사용자", 1000));
	session.setAttribute("SSadmin", new Member("imhappy1", "1111", "미키", "관리자", 2000));
	
	application.setAttribute("APuser", new Member("himan2", "7777", "홍길동", "일반사용자", 1000));
	application.setAttribute("APadmin", new Member("imhappy2", "1111", "미키", "관리자", 2000));


%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("응용문제");
	});
</script>
<body>
	<h2 align="center"></h2>
	
	<%
	
		Member SSuser = (Member) session.getAttribute("SSuser");
		Member SSadmin = (Member) session.getAttribute("SSadmin");
		
		Member APuser = (Member) application.getAttribute("APuser");
		Member APadmin = (Member) application.getAttribute("APadmin");
	
	%>
	<h4>session 범위 사원정보 </h4>
	<table align="center" class="listTable">
		<tr><th>아이디</th><td>${SSuser.id}</td></tr>
		<tr><th>비밀번호</th><td>${SSuser.pw}</td></tr>
		<tr><th>이름</th><td>${SSuser.name}</td></tr>
		<tr><th>권한</th><td>${SSuser.auth}</td></tr>
		<tr><th>포인트</th><td>${SSuser.point}</td></tr>
		</td></tr>
	</table>	
	
	<h4>session 범위 관리자정보 </h4>
	<table align="center" class="listTable">
		<tr><th>아이디</th><td>${SSadmin.id}</td></tr>
		<tr><th>비밀번호</th><td>${SSadmin.pw}</td></tr>
		<tr><th>이름</th><td>${SSadmin.name}</td></tr>
		<tr><th>권한</th><td>${SSadmin.auth}</td></tr>
		<tr><th>포인트</th><td>${SSadmin.point}</td></tr>
		</td></tr>
	</table>	
	
	<h4>application 범위 사원정보 </h4>
	<table align="center" class="listTable">
		<tr><th>아이디</th><td>${APuser.id}</td></tr>
		<tr><th>비밀번호</th><td>${APuser.pw}</td></tr>
		<tr><th>이름</th><td>${APuser.name}</td></tr>
		<tr><th>권한</th><td>${APuser.auth}</td></tr>
		<tr><th>포인트</th><td>${APuser.point}</td></tr>
		</td></tr>
	</table>	
	
	<h4>application 범위 관리자정보 </h4>
	<table align="center" class="listTable">
		<tr><th>아이디</th><td>${APadmin.id}</td></tr>
		<tr><th>비밀번호</th><td>${APadmin.pw}</td></tr>
		<tr><th>이름</th><td>${APadmin.name}</td></tr>
		<tr><th>권한</th><td>${APadmin.auth}</td></tr>
		<tr><th>포인트</th><td>${APadmin.point}</td></tr>
		</td></tr>
	</table>	

	<h3 align="center" onclick="location.href='a06_sessionScope.jsp'">화면 이동시 클릭!</h3>
	
</body>
</html>