<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
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
		document.querySelector("h3").innerText="시작";
	}
	


</script>

</head>
<%-- 
# 

--%>
<%
String deptnoS = request.getParameter("deptno");

Dept dept = null;

if(deptnoS != null) {
	A05_PreparedDao dao = new A05_PreparedDao();
	dept = dao.getDept(Integer.parseInt(deptnoS));
}
%>
<body>
	<h3 align="center"></h3>
	<form id="frm01">
	<table>
		<tr><th>부서번호</th><td><input type="text" name="deptno" value="<%= dept.getDeptno() %>"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<table>
		<tr><th>부서번호</th><td><input type="text" name="deptno" value="<%= dept.getDeptno() %>"></td></tr>
		<tr><th>부서명</th><td><input type="text" name="dname" value="<%= dept.getDname() %>"></td></tr>
		<tr><th>부서위치</th><td><input type="text" name="loc" value="<%= dept.getLoc() %>"></td></tr>
		<tr><td colspan="2"> 
			<input type="button" name="btnUpt" value="수정"/>
			<input type="button" name="btnDel" value="삭제"/>
			<input type="button" name="btnHome" value="메인화면"/>
		</td></tr>
	</table>	
</body>
<script type="text/javascript">

var btnUpt = document.querySelector("[name=btnUpt]");

btnUpt.onclick = function() {
	if(confirm("수정하시겠습니까?")){
		var form = document.querySelector("form");
		form.action ="a36_deptUptProc.jsp";
		form.submit();
	}
}

var btnDel = document.querySelector("[name=btnDel]");

btnDel.onclick = function() {
	
	if(confirm("삭제하시겠습니까?")) {
		var deptno = document.querySelector("[name=deptno]").value;
		location.href = "a37_deptDelProc.jsp?deptno=" + deptno;
	}
}

</script>
</html>