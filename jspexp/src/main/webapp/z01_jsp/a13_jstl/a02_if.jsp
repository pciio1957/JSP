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
	<h2 align="center">jstl에서 조건문 처리</h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>점수</th><td><input type="text" name="point" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="등급확인"/>
		</td></tr>
	</table>	
	</form>
	
	<c:if test="${not empty param.point}">
		<h3 align="center"> ${param.point}점에
			<c:choose>
				<c:when test="${param.point>=90}">A등급</c:when>
				<c:when test="${param.point>=80}">B등급</c:when>
				<c:when test="${param.point>=70}">C등급</c:when>
				<c:when test="${param.point>=60}">D등급</c:when>
				<c:otherwise>F등급</c:otherwise>
			</c:choose>
		</h3>
	</c:if>
	
	
	<!-- 응용) 물건가격 [ ] 갯수 [ ] [구매]
			구매 총계가 10만원 이상일 때 10%할인, 5~10미만 5%, 그 외는 3% 할인
			할인율과 최정 금액 표시 (2조 제출, 나머지 손들기) -->
	
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>물건가격</th><td><input type="text" name="price" value=""/></td></tr>
		<tr><th>물건갯수</th><td><input type="text" name="cnt" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="구매"/>
		</td></tr>
	</table>	
	</form>
	
	
	<c:if test="${not empty param.price}">
		<h3 align="center"> 구매 총계가 ${param.price * param.cnt}로 
			<c:choose>
				<c:when test="${param.price * param.cnt >= 100000}">10% 할인</c:when>
				<c:when test="${param.price * param.cnt >= 50000}">5% 할인</c:when>
				<c:otherwise>3% 할인</c:otherwise>
			</c:choose>
		</h3>
	</c:if>
	
	
	<table align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>