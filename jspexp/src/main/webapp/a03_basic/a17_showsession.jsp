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

String name = (String) session.getAttribute("name");
int kor = Integer.parseInt((String)session.getAttribute("kor"));
int eng = Integer.parseInt((String)session.getAttribute("eng"));
int math = Integer.parseInt((String)session.getAttribute("math"));

Student stu = (Student) session.getAttribute("stu");


%>
<body>
	<h3 align="center" id="h3Title"></h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>학생명</th><td><%= stu.getName() %></tr>
		<tr><th>국어점수</th><td><%= stu.getKor() %></tr>
		<tr><th>영어점수</th><td><%= stu.getEng() %></tr>
		<tr><th>수학점수</th><td><%= stu.getMath() %></tr>
		<tr><th>평균</th><td><%= (int) (kor+eng+math)/3 %></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	
	
</body>
</html>