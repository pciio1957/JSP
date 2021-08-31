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


		$("#btnBuy").click(function(){
			$("form").submit();
			
		});
	});
</script>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><input type="text" name="pname" value=""/></td></tr>
		<tr><th>물건가격</th><td><input type="text" name="price" value=""/></td></tr>
		<tr><th>물건갯수</th><td><input type="text" name="pcnt" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="button" id="btnBuy" value="구매"/>
		</td></tr>
	</table>	
	</form>
	
	<table align="center" class="listTable">
		<tr><th>물건명</th><th>물건가격</th><th>물건갯수</th></tr>
		<tr><td>${param.pname }</td><td>${param.price }</td><td>${param.pcnt }</td></tr>
		<tr><th>총계</th><td colspan="2">${tot }</td></tr>
	</table>	

</body>
</html>