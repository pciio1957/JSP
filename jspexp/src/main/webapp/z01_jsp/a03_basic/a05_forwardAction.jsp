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
		document.querySelector("h3").innerText="forward 처리할 페이지";
	}

</script>
</head>
<%-- 
#a05_forwardAction.jsp?name=홍길동 을 통해 요청값도 함께 전송할 수 있다

--%>
<%



%>
<body>
	<h3 align="center"></h3>
	<jsp:forward page="a06_goPage01.jsp"></jsp:forward>

</body>
</html>