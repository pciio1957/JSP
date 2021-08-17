<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.z01_database.*"
    import="jspexp.z02_vo.*"
    import="java.util.*"
    errorPage="z01_error.jsp"
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
		document.querySelector("h3").innerText="예외처리";
	}

</script>
</head>
<%-- 
#jsp에서 에러 처리
1. jsp에서는 에어를 해당 예외가 발생했을 때 예외페이지를 지정하여 처리한다.
2. 처리 프로세스
	1) 예외 페이지 지정 : errorPage = "처리할 예외페이지"
	2) 에러발생시 -> 지정한 예외페이지 호출


응용) a08_show.jsp를 통해서 String name=null;
	System.out.println(name.toString()); 을 선언하고
	z02_error.jsp를 통해서 에러가 처리되도록 하기  (1조)
	
--%>
<%

System.out.println(1/0);
%>
<body>
	<h3 align="center"></h3>

	
</body>
</html>