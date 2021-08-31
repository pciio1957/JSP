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

#fmt: jstl태그
1. 데이터유형을 변경하거나, 원하는 데이터를 처리할 때 주로 활용된다.
2. 공통 설정 변경
	String path = request.getContextPath()
	-> <c:set var="path" value="${pageContext.request.contextPath}"/>
	
	request.setCharachterEncoding("utf-8")
	-> <fmt:requestEncoding value="utf-8"/>
	
3. 날짜 처리
	1) 날짜 + 시간
	2) data  type은 java.util.Date를 활용한다
	3) 기본 형식
		<fmt:formatDate type="date|time|both"
			dateStyle="full|short"
			timeStype="full|short"
			pattern="yyyy/MM/dd kk:mm:ss.S"
			value="선언된 데이터"/>
			
4. 숫자처리
	1) 숫자를 통화나 소숫점 이하 지정된 형식으로 처리
	2) type의 속성
		currency : 통화단위
		percent : % 단위
		
	3) pattern : 00,000,000.000 등과 같이 
		특정한 출력 형식을 처리할 수 있다.

--%>
<%

%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){

	});
</script>
<c:set var="now" value="<%= new Date() %>"/>
<c:set var="num01" value="9524333.7432"/>
<body>
	<h2 align="center">fmt 포맷데이터</h2>
	<h3 align="center">기본 출력(날짜) : ${now }</h3>
	<h3 align="center">기본 출력(숫자) : ${num01 }</h3>
	
	<!--  fmt 적용 -->
	<h3 align="center">fmt 처리 기본(날짜) : <fmt:formatDate value="${now}"/></h3>
	<h3 align="center">fmt 처리 기본(숫자) : <fmt:formatNumber value="${num01}"/></h3>
	
	<!--  fmt 형식 지정 -->
	<h3>fmt 처리 full(날짜) : <fmt:formatDate type="date" dateStyle="full" value="${now}"/></h3>
	<h3>fmt 처리 short(날짜) : <fmt:formatDate type="date" dateStyle="short" value="${now}"/></h3>
	
	<h3>fmt 처리 full(시간) : <fmt:formatDate type="time" timeStyle="full" value="${now}"/></h3>
	<h3>fmt 처리 short(시간) : <fmt:formatDate type="time" timeStyle="short" value="${now}"/></h3>
	
	<h3>fmt 처리 : 날짜/시간 both full : <fmt:formatDate type="both" dateStyle="full" timeStyle="full" value="${now}"/></h3>
	<h3>fmt 처리 : 날짜/시간 both full : <fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${now}"/></h3>
	
	<!--  사용자 지정 형식 -->
	<h3>fmt 처리 : pattern (날짜/시간) : 
	<fmt:formatDate pattern="yyyy/MM/dd kk:mm:ss.S" value="${now }" /> </h3>
	
	<!--  통화 형식 지정 : 소숫점을 반올림, 천단위 표기 및 앞에 현재 통화단위 표시 -->
	<h3>fmt 처리 (숫자/통화) : <fmt:formatNumber type="currency" value="${num01}"/></h3>
	<h3>fmt 처리 달러 (숫자/통화) : <fmt:formatNumber type="currency" currencySymbol="$" value="${num01}"/></h3>
	<h3>fmt 처리 원 (숫자/통화) : <fmt:formatNumber type="currency" currencySymbol="원" value="${num01}"/></h3>
	
	
	<!-- 퍼센트 -->
	<h3>fmt 처리 (숫자/퍼센트) : <fmt:formatNumber type="percent" value="${0.25}"/></h3>
	
	<!-- 패턴설정 -->
	<h3>fmt 처리 (숫자/패턴 설정) : <fmt:formatNumber pattern="0, 000,000.000" value="${num01}"/></h3>
	
	
	
	<!--  응용) dao를 이용해 emplist를 가져와서 forEach 구문으로 아래 내용을 출력하되
	hiredate를 both, full 형식으로 표기하고 sal을 천단위 원으로 표기 
	comm/sal를 이용해 보너스 %를 표기하여 출력하기 (2조 제출, 나머지 손들기) -->
	
	
	<jsp:useBean id="dao" class="jspexp.z01_database.A05_PreparedDao"/>
	
	<table align="center" class="listTable">
		<tr><th>사원명</th><th>입사일</th><th>급여</th><th>보너스(%)</th></tr>
		<c:forEach var="emp" items="${dao.getEmpList() }" varStatus="sts">
			<tr>
				<td>${emp.ename }</td>
				<td><fmt:formatDate type="both" dateStyle="full" timeStyle="full" value="${emp.hiredate}"/> </td>
				<td><fmt:formatNumber type="currency" value="${emp.sal}"/></td>
				<td><fmt:formatNumber type="percent" value="${emp.comm/emp.sal}"/></td>
			</tr>
		</c:forEach>
	</table>	
	
	
	
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="검색"/>
		</td></tr>
	</table>	
	</form>
	
	<table align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>