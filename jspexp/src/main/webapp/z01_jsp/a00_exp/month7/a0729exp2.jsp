<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.a01_start.*"
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
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript">
	window.onload = function() {
		document.querySelector("h3").innerText="회원정보 입력";
	}

</script>
</head>
<%-- 
# 

--%>
<%

%>
<body>
	<h3 align="center"></h3>
	<form id="frm01">
	<table>
		<tr><th>회원명</th><td><input type="text" name="mname" value=""/></td></tr>
		<tr><th>회원ID</th><td><input type="text" name="mid" value=""/></td></tr>
		<tr><th>회원PW</th><td><input type="text" name="mpw" value=""/></td></tr>
		<tr><th>회원권한</th><td><input type="text" name="mauth" value=""/></td></tr>
		<tr><th>회원포인트</th><td><input type="text" name="mpoint" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="등록하기"/></td></tr>
	</table>	
	</form>
	
	<%
	
	String mname = request.getParameter("mname");
	String mid = request.getParameter("mid");
	String mpw = request.getParameter("mpw");
	String mauth = request.getParameter("mauth");
	String mpointS = request.getParameter("mpoint");
	
	if(mname == null) mname = "";
	if(mid == null) mid = "";
	if(mpw == null) mpw = "";
	if(mauth == null) mauth = "";
	if(mpointS == null) {
		mpointS = "0";
	} else {
		
		int mpoint = Integer.parseInt(mpointS);
		
		A05_PreparedDao dao = new A05_PreparedDao();
		Member mem = new Member(mid, mpw, mname, mauth, mpoint);
		boolean isOk = dao.insertMember(mem);
	%>
	
	
		<% if(!isOk) { %>

			<h2> 등록되지 않았습니다! </h2>
		<% } else {%>
		
		<h4> 등록 정보 확인</h4>
		<table>
			<tr><th>회원ID</th><td><%= mid %></td></tr>
			<tr><th>회원PW</th><td><%= mpw %></td></tr>
			<tr><th>회원명</th><td><%= mname %></td></tr>
			<tr><th>회원권한</th><td><%= mauth %></td></tr>
			<tr><th>회원포인트</th><td><%= mpoint %></td></tr>
		</table>
		<% } %>
	<% } %>
</body>
</html>