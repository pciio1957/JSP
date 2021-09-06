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

td {
	text-align:center;	
}

</style>
</head>
<%-- 

#프로세스 정리
emp -> page 범위
empList -> session범위
누적되더라도 데이터가 다르게 객체를 생성하기때문에 데이터를 처리할 수 있다


--%>
<%

%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h2Obj").text("el 리스트 처리");
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>
	
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원번호</th><td><input type="text" name="empno" value=""/></td></tr>
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><th>직책</th><td><input type="text" name="job" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="등록"/>
		</td></tr>
	</table>	
	</form>
	
	${emp.setEmpno(param.empno)}
	${emp.setEname(param.ename)}
	${emp.setJob(param.job)}
	${empList.add(emp)}

	<%
	
	List<Emp> elist = (List<Emp>) session.getAttribute("empList");
	if(elist != null & elist.size() > 0) {
	%>	
	
	<h2 align="center"> 등록된 사원정보(${empList.size()})</h2>
	<table align="center" class="listTable">
		<tr><th>사원번호</th><th>사원명</th><th>직책</th></tr>
		<tr><td>${empList.get(0).empno}</td><td>${empList.get(0).ename}</td><td>${empList.get(0).job}</td></tr>
		<tr><td>${empList.get(1).empno}</td><td>${empList.get(1).ename}</td><td>${empList.get(1).job}</td></tr>
		<tr><td>${empList.get(2).empno}</td><td>${empList.get(2).ename}</td><td>${empList.get(2).job}</td></tr>
	</table>	
	<% } %>
</body>
</html>