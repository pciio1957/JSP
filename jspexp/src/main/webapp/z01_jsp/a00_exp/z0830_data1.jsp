<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Front 연습</title>
<link rel="stylesheet" href="${path}/z00_com/a01_com.css">
<style>

table {
	width:70%;
	margin-bottom:20px;
	padding:20px;
}

td {
	text-align:center;	
}

</style>
</head>
<%-- 

#

--%>
<%

%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){

	});
</script>
<body>

	<h2 align="center">4번 문제 결과데이터</h2>
	
	<c:if test="${not empty empSch01 }">
	<h3 align="center">page범위 결과</h3>
	<table align="center" class="listTable">
		<tr><th>사원명</th><th>직책</th></tr>
			<tr><td>${empSch01.ename}</td><td>${empSch01.job}</td></tr>

	</table>	
	</c:if>
	
	<c:if test="${not empty empSch02 }">
	<h3 align="center">session범위 결과</h3>
	<table align="center" class="listTable">
		<tr><th>사원명</th><th>직책</th></tr>
		<tr><td>${empSch02.ename}</td><td>${empSch02.job}</td></tr>
	</table>	
	</c:if>
</body>
</html>