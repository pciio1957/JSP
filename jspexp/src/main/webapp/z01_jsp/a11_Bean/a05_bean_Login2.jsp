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

</style>
</head>
<%--
 
 응용) 로그인 화면 구성 후 bean으로 요청값을 받아 dao를 호출하여 
 	데이터가 있으면 session bean에 등록되게 처리하기 (2조 제출, 나머지 손들기) 
 	
 	프로세스
 	1) form화면에서 id, pw 값을 입력한 후 
 	2) 입력된 id, pw를 받아서 데이터 처리를 하고
 	3) 해당 데이터가 있으면 session을 처리한다
 	
 	구현순서
 	1) form 화면 구성
 	2) form 화면에 name값에 해당하는 property가 있는 VO객체 만들기
 		setId(), setPw()
 	3) 초기화면과 입력 후 요청값이 있는 것을 구분
 	4) setProperty property="*"을 통해서 전체 요청값을 vo객체에 할당 
 	5) 데이터가 있는지 

--%>
	<jsp:useBean id="mb01" class="jspexp.z02_vo.Member"/>
	<jsp:setProperty property="*" name="mb01"/>
	
	<jsp:useBean id="dao" class="jspexp.z01_database.A05_PreparedDao"/>
	<jsp:useBean id="mb02" class="jspexp.z02_vo.Member"/>
<%

	// 요청값이 있는 경우 (초기/요청화면 구분)
	if(mb01.getId() != null) {
		mb01 = dao.login2(mb01.getId(), mb01.getPw());
		session.setAttribute("mb01", mb01);
	}

%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$("#h2Obj").text("로그인");
	});
	
	var name = "${mb02.name}";
	
	$("#btnLogin").click(function(){
		if(name != null) {
			alert("로그인 성공");
		}
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><th>비밀번호</th><td><input type="text" name="pw" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" id="btnLogin" value="로그인"/>
		</td></tr>
	</table>	
	</form>
	
	<h3 align="center"> 현재 세션 내용 </h3>
	<h3 align="center" onclick="location.href='a06_showSession.jsp'"> 다른 페이지에서 session확인 </h3>
	<table align="center" class="listTable">
		<tr><th>아이디</th><td>${mb01.id }</td><th>패스워드</th><td>${mb01.pw }</td></tr>
		<tr><th>이름</th><td>${mb01.name }</td><th>권한</th><td>${mb01.auth }</td></tr>
		<tr><th>포인트</th><td>${mb01.point }</td></tr>
	</table>
	
	
	
</body>
</html>