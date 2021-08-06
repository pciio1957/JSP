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
boolean isDelete = false;

if( deptnoS != null) {
	A05_PreparedDao dao = new A05_PreparedDao();
	dao.deleteDept(Integer.parseInt(deptnoS));
	isDelete = true;
}


%>
<body>
<script type="text/javascript">

var isDelete = <%=isDelete%>;
if(isDelete){
	alert("삭제 완료");
	location.href="a30_deptList.jsp";
}


</script>
</body>
</html>