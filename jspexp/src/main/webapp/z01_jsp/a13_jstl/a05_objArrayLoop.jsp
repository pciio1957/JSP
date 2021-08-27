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

#DB처리 리스트
1. session범위 객체.setAttribute("리스트명", dao.메소드());
	<c:forEach items="${리스트형}">
2. useBean 활용한 DB객체 호출
	<c:forEach items="${dao.메소드()}">

--%>
<%

	request.setAttribute("plist", 
			Arrays.asList(new Product("사과", 3000, 2),
							new Product("바나나", 2000, 4),
							new Product("딸기", 12000, 1)));
%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){

	});
</script>
<body>
	<h2 align="center"> 객체형 list 처리</h2>
	
	<table align="center" class="listTable">
		<tr><th>번호</th><th>물건명</th><th>가격</th><th>갯수</th></tr>
		<c:forEach var="prod" items="${plist }" varStatus="sts">
			<c:set var="tot" value="${tot + (prod.price * prod.cnt)}"/>
			<tr><td>${sts.count }</td><td>${prod.name }</td>
			<td>${prod.price }</td><td>${prod.cnt }</td></tr>
		</c:forEach>
		<tr><th>전체 총 금액</th><td colspan="3">${tot }</td></tr>
	</table>
	
	<%
	
		A05_PreparedDao dao = new A05_PreparedDao();
		request.setAttribute("empList", dao.getEmpList());
	%>
	
	
	<h3 align="center">사원정보 처리 </h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원번호</th><th>사원명</th><th>직책</th><th>급여</th><th>부서</th></tr>
		<c:forEach var="emp" items="${empList }" varStatus="sts">
			<tr><td>${emp.empno }</td><td>${emp.ename }</td>
			<td>${emp.job }</td><td>${emp.sal }</td><td>${emp.deptno }</td></tr>
		</c:forEach>
	</table>	
	</form>
	
	
	
	<jsp:useBean id="dao2" class="jspexp.z01_database.A05_PreparedDao"/>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원번호</th><th>사원명</th><th>직책</th><th>급여</th><th>부서</th></tr>
		<c:forEach var="emp" items="${dao2.getEmpList()}" varStatus="sts">
			<tr><td>${emp.empno }</td><td>${emp.ename }</td>
			<td>${emp.job }</td><td>${emp.sal }</td><td>${emp.deptno }</td></tr>
		</c:forEach>
	</table>	
	</form>	
	
	
	
	<table align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>