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
 	// 1. 요청값 받아오기
 	String deptnoS = request.getParameter("deptno");
 	// 2. 초기화면시, default값 설정..
 	if(deptnoS==null) deptnoS = "0";
 	// 3. 데이터 처리 결과 받기..
 	A05_PreparedDao dao = new A05_PreparedDao();
 	Dept dept = dao.getDept(Integer.parseInt(deptnoS));
 
 %>
<body>
	<h3 align="center"></h3>
	<form id="frm01">
	<table>
		<tr>
			<th>부서번호</th><th>부서명</th><th>부서위치</th></tr>
			<tr><td><%=dept.getDeptno()%></td>
			<td><%=dept.getDname()%></td>
			<td><%=dept.getLoc()%></td></tr>
	</table>		
	</form>
</body>
</html>