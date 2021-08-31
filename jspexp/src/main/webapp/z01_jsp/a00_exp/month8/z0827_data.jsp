<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var = "path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<c:set var="tot" value="${param.kor + param.eng + param.math}"/>
<c:set var="avg" value="${tot/3}"/>
<table align="center" class="listTable">
	<tr><th>국어점수</th><td>${param.kor}</td></tr>
	<tr><th>영어점수</th><td>${param.eng}</td></tr>
	<tr><th>수학점수</th><td>${param.math}</td></tr>
	<tr><th>총점</th><td>${tot}</td></tr>
	<tr><th>평균</th><td>${avg}</td></tr>
	<tr><th>평균(소숫점제거)</th><td>${Math.round(avg)}</td></tr>
	
</table>