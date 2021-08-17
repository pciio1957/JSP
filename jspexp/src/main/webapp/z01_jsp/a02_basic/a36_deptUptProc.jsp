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
</head>
<%-- 
# 

--%>
<%

String deptnoS = request.getParameter("deptno");


boolean isUpdate = false;
if(deptnoS != null) {
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	
	Dept dept = new Dept (
			Integer.parseInt(deptnoS),
			dname, loc
	);
	
	A05_PreparedDao dao = new A05_PreparedDao();
	dao.updateDept(dept);
	isUpdate= true;
}

%>
<body>
	<h3 align="center"></h3>
	<h3> 확인 : <%= deptnoS %></h3>
	
</body>
<script type="text/javascript">

var isUpdate = <%= isUpdate %>;

if(isUpdate) {
	alert("수정이 완료되었습니다!");
	location.href = "a35_deptDetail.jsp?deptno=" + deptnoS;
}

</script>
</html>