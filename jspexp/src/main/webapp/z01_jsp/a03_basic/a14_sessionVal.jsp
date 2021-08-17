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
<script src="<%=path%>/a00_com/jquery-3.6.0.js" 
		type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h3Title").text("시작");
	});
</script>
</head>
<%-- 
# 

--%>
<%
Member m = (Member) session.getAttribute("mem");

// 응용) a16_sessionExp.jsp 파일을 만들어 학생이름, 국어, 영어, 수학 점수를 세션으로 설정
//		a17_showsession.jsp 저장된 session을 호출하여 출력 (2조/3조)
%>
<body>
	<h3 align="center" id="h3Title">세션값 확인(페이지 이동)</h3>
	<h2 align="center">아이디 : <%= m.getId() %></h2>
	<h2 align="center">이름 : <%= m.getName() %></h2>
	<h2 align="center">권한 : <%= m.getAuth() %></h2>
	
</body>
</html>