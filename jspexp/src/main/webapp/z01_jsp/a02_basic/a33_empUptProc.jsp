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

	String empnoS = request.getParameter("empno");
	boolean isUpdate = false;

	if(empnoS != null) {
		String ename = request.getParameter("ename");
		String job = request.getParameter("job");
		String mgrS = request.getParameter("mgr");
		String hiredateS = request.getParameter("hiredate");
		String salS = request.getParameter("sal");
		String commS = request.getParameter("comm");
		String deptnoS = request.getParameter("deptno");
		
		Emp upt = new Emp(
				Integer.parseInt(empnoS),
				ename, job, 
				Integer.parseInt(mgrS), 
				hiredateS,
				Double.parseDouble(salS),
				Double.parseDouble(commS),
				Integer.parseInt(deptnoS)
		);
		
		A05_PreparedDao dao = new A05_PreparedDao();
		dao.updateEmp(upt);
		isUpdate = true;
	}
	
%>
<script type="text/javascript">

var isUpdate = <%= isUpdate %>;
alert("수정완료");
location.href = "a32_empDetail.jsp?empno=<%= empnoS %>";

</script>
<body>
	<h3 align="center"></h3>
	<h2> 수정키 : <%= empnoS %></h2>
</body>
</html>