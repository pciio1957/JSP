<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.z01_database.*"
    import="jspexp.z02_vo.*"
    import="java.util.*"
    errorPage="z02_error.jsp"
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
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>

</style>
<script type="text/javascript">
	window.onload = function() {
		document.querySelector("h3").innerText="예외처리 응용문제";
	}

</script>
</head>
<%-- 
응용) a08_show.jsp를 통해서 String name=null;
	System.out.println(name.toString()); 을 선언하고
	z02_error.jsp를 통해서 에러가 처리되도록 하기  (1조)

--%>
<%

String name = null;
System.out.println(name.toString());

%>
<body>
	<h3 align="center"></h3>

</body>
</html>