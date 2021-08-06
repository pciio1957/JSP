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
	boolean isDelete = false;
	
	if(empnoS != null) {
		A05_PreparedDao dao = new A05_PreparedDao();
		dao.deleteEmp(Integer.parseInt(empnoS));
		isDelete = true;
	}
%>

<body>
<script type="text/javascript">

	var isDelete = <%= isDelete %>;
	if(isDelete) {
		if(confirm("삭제되었습니다")) {
			location.href = "a28_empList.jsp";
		}
	}
</script>
</body>
</html>