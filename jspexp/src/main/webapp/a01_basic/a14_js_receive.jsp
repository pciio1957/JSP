<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.a01_start.*"
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
		document.querySelector("h3").innerText="시작";
	}

</script>
</head>
<body>

	<% 
	String pname = request.getParameter("pname"); 
	String price = request.getParameter("price"); 
	String pcnt = request.getParameter("pcnt"); 
	
	%>
	<h2>js를 통해 넘겨온 물건명 : <%= pname %></h2>
	<h2>js를 통해 넘겨온 가격 : <%= price %></h2>
	<h2>js를 통해 넘겨온 갯수 : <%= pcnt %></h2>
	
	
	<% 
	
	String memId = request.getParameter("memId");
	String memPw = request.getParameter("memPw");
	String memName = request.getParameter("memName");
	String memAuth = request.getParameter("memAuth");
	
	%>
	
	<h2> 회원아이디 : <%=  memId %></h2>
	<h2> 회원비밀번호 : <%= memPw %></h2>
	<h2> 회원명 : <%= memName %></h2>
	<h2> 회원권한 : <%= memAuth %></h2>
</body>
</html>