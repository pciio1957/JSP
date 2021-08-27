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

#useBean을 통한 요청값 및 검색데이터 리스트 처리 
1. form만들기
2. bean객체 생성 및 요청값 처리 
3. bean 객체 생성 및 dao처리 
4. 반복화면 리스트 

--%>
<%

%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){

	});
</script>
<body>
	<h2 align="center">DB검색 결과리스트</h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><th>직책</th><td><input type="text" name="job" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="검색"/>
		</td></tr>
	</table>	
	</form>

	<jsp:useBean id="dao" class="jspexp.z01_database.A05_PreparedDao"/>
	<jsp:useBean id="sch" class="jspexp.z02_vo.Emp"/>
	<c:set target="${sch }" property="ename" value="${(not empty param.ename)?param.ename:''}"/>
	<c:set target="${sch }" property="job" value="${(not empty param.job)?param.job:''}"/>
	<table align="center" class="listTable">
		<tr><th>사원번호</th><th>사원명</th><th>직책</th><th>급여</th><th>부서</th></tr>
		<c:forEach var="emp" items="${dao.getPreparedEmpList(sch)}" varStatus="sts">
			<tr><td>${emp.empno }</td><td>${emp.ename }</td>
			<td>${emp.job }</td><td>${emp.sal }</td><td>${emp.deptno }</td></tr>
		</c:forEach>
	</table>

	
	<!--  응용) Dept를 jstl과 함께 검색처리하기 (3조 제출, 나머지 손들기) -->
	<h2 align="center">부서정보검색(jstl)</h2>
	<form id="frm02" method="post">
	<table align="center" class="listTable">
		<tr><th>부서명</th><td><input type="text" name="dname" value="${param.dname}"/></td></tr>
		<tr><th>부서위치</th><td><input type="text" name="loc" value="${param.loc}"/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>	
	<jsp:useBean id="dsch" class="jspexp.z02_vo.Dept"/>
	<c:set target="${dsch}" property="dname" value="${(not empty param.dname)?param.dname:''}"/>
	<c:set target="${dsch}" property="loc" value="${(not empty param.loc)?param.loc:''}" />
	<table  align="center" class="listTable">
		<tr><th>부서번호</th><th>부서명</th><th>부서위치</th></tr>
		<c:forEach var="dept" items="${ dao.getDeptList(dsch) }">
			<tr><td>${dept.deptno}</td><td>${dept.dname}</td>
				<td>${dept.loc}</td></tr>
		</c:forEach>
	</table>	
	
</body>
</html>