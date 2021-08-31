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
	<h2 align="center">회원 MVC</h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>회원아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" id="btnSelect" value="조회"/>
		</td></tr>
	</table>	
	</form>
	
	<c:choose>
		<c:when test="${not empty member.name}">
			<table align="center" class="listTable">
				<tr><th>회원명</th><td>${member.name }</td></tr>
				<tr><th>아이디</th><td>${member.id }</td></tr>
				<tr><th>비밀번호</th><td>${member.pw }</td></tr>
				<tr><th>권한</th><td>${member.auth }</td></tr>
				<tr><th>포인트</th><td>${member.point }</td></tr>
			</table>	
		</c:when>
	</c:choose>

	
</body>
</html>