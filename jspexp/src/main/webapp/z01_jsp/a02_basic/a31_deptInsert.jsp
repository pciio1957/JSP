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
		document.querySelector("h3").innerText="부서정보 등록";
	}

</script>
</head>
<%-- 
# 

--%>
<%

String deptnos = request.getParameter("indeptno");
String dname = request.getParameter("indname");
String loc = request.getParameter("inloc");

boolean isInsert = false;
if(deptnos != null) {
	
	A05_PreparedDao dao = new A05_PreparedDao();
	dao.insertDept(new Dept(Integer.parseInt(deptnos), dname, loc));
	isInsert = true;
}


%>

<body>
<script type="text/javascript">

var isInsert = <%= isInsert %>;
if(isInsert) {
	
	if(confirm("등록 성공\n메인화면으로 이동하시겠습니까?")){
		location.href = "a30_deptList.jsp";
	}
}
</script>

	<h3 align="center"></h3>
	<h4>부서정보 등록</h4>
	<form>
		<table>
			<tr><th>부서번호</th><td><input type="text" value="" name="indeptno"/></td></tr>
			<tr><th>부서명</th><td><input type="text" value="" name="indname"></td></tr>
			<tr><th>부서위치</th><td><input type="text" value="" name="inloc"></td></tr>
			<tr><td colspan="2">
				<input type="submit" value="등록"></td></tr>
		</table>
	</form>
	
</body>
</html>