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

--%>
<%

%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$("#h2Obj").text("로그인");
	});
	
	var isLogin = "${isLogin}";
	
	$("#btnLogin").click(function(){
		if(isLogin) {
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

	<jsp:useBean id="mb01" class="jspexp.z02_vo.Member"/>
	<jsp:setProperty property="*" name="mb01"/>
	
	<jsp:useBean id="dao" class="jspexp.z01_database.A05_PreparedDao"/>
	
	<% if(mb01.getId() != null) { %>
		<h3 align="center"> 로그인 결과</h3>
		<% 
			boolean isLogin = dao.login(mb01.getId(), mb01.getPw()); 
			
			if(isLogin) {
				session.setAttribute("id", mb01.getId());
				session.setAttribute("pw", mb01.getPw());
			}
		%>
		<h4 align="center"> <%= isLogin?"로그인되었습니다":"로그인에실패했습니다" %></h4>
	<% } %>
	
</body>
</html>