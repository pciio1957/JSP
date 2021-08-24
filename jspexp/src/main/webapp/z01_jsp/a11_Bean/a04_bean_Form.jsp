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

#Bean을 활용한 form데이터 처리
1. form 객체에 있는 데이터를 요청값으로 전달하기 때문에
	useBean의 property="*"로 하면 요청key와 프로퍼티가 같으면 해당 객체에 할당된다. 

--%>
<%

%>
<script src="<%=path%>/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h2Obj").text("사원데이터 처리 ");
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>사원번호</th><td><input type="text" name="empno" value=""/></td></tr>
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><th>직책</th><td><input type="text" name="job" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="등록"/>
		</td></tr>
	</table>	
	</form>
	
	<jsp:useBean id="emp" class="jspexp.z02_vo.Emp"/>
	<jsp:useBean id="dao" class="jspexp.z01_database.A05_PreparedDao"/>
	<jsp:setProperty property="*" name="emp"/>
	
	<%
	
	if(emp.getEname() != null) {
		dao.insertEmp(emp);
	}
	%>
	<table align="center" class="listTable">
		<tr><th>사원번호</th><td>${emp.empno}</td></tr>
		<tr><th>사원명</th><td>${emp.ename}</td></tr>
		<tr><th>직책</th><td>${emp.job}</td></tr>
	</table>	
	
</body>
</html>