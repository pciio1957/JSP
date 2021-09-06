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
	<h2 align="center">회원정보 등록</h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>회원아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><th>회원비밀번호</th><td><input type="text" name="pw" value=""/></td></tr>
		<tr><th>회원이름</th><td><input type="text" name="name" value=""/></td></tr>
		<tr><th>회원권한</th><td><input type="text" name="auth" value=""/></td></tr>
		<tr><th>회원포인트</th><td><input type="text" name="point" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="button" id="btnAdd" value="등록"/>
		</td></tr>
	</table>	
	</form>

</body>
</html>