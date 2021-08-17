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
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>

</style>
<script type="text/javascript">
	window.onload = function() {
		document.querySelector("h3").innerText="포함된 페이지";
	}

</script>
</head>
<%-- 
#jsp:forward
1. 해당 페이지로 요청값과 함께 이동처리된다.
2. request 요청값은 함께 하여 이동 처리된다.
3. 기본 형식
	<jsp:forward page="이동할 페이지"/>

--%>
<%

%>
<body>

</body>
</html>