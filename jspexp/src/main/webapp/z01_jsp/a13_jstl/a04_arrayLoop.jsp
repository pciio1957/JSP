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

	pageContext.setAttribute("array", new String[]{"사과", "바나나", "딸기"});
	pageContext.setAttribute("list", Arrays.asList("컴퓨터", "핸드폰", "복사기"));
	
%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){

	});
</script>
<body>
	<h2 align="center">배열의 반복문</h2>

	<table align="center" class="listTable">
		<tr><th>번호</th><th>index</th><th>첫번째값여부</th><th>두번째값여부</th><th>데이터</th></tr>
		<c:forEach var="fruit" items="${array }" varStatus="sts">
			<tr><td>${sts.count }</td><td>${sts.index }</td><td>${sts.first }</td>
			<td>${sts.last }</td><td>${fruit }</td></tr>
		</c:forEach>
	</table>

	<table align="center" class="listTable">
		<tr><th>번호</th><th>index</th><th>첫번째값여부</th><th>두번째값여부</th><th>데이터</th></tr>
		<c:forEach var="prod" items="${list }" varStatus="sts">
			<tr><td style="background:${sts.first || sts.last?'yellow':''};">${sts.count }</td><td>${sts.index }</td><td>${sts.first }</td>
			<td>${sts.last }</td><td>${prod }</td></tr>
		</c:forEach>
	</table>	
	
	
	<!--  응용) List형태로 무지개색을 선언하고 반복문을 통해 h3에 배경색상과 함께 출력하기
			(2조 제출, 나머지 손들기) -->
			
	<%
		pageContext.setAttribute("rbList", Arrays.asList("red",  "orange", "yellow", "green", "blue", "navy", "purple"));
	%>		
	<c:forEach var="rainbow" items="${rbList }" varStatus="sts">
		<h3 align="center" style="background:${rainbow};">${sts.count}) ${rainbow }</h3>
	</c:forEach>
	
	
	<table align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>