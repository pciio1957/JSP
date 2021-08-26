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

#연산자
1. 수치연산자
2. 비교연산자
	== (eq), != (ne)
	${num01 eq 25}
	${num01 ne 80}
	
3. 논리연산자
	&& (and)
	|| (or)
	! (not)
	${point >= 80 && point < 90}
	${point ge 80 and point lt 90}
	
4. empty 연산자
	값이 null, 빈 문자열 "", 배열 및 리스트 데이터의 길이가 0 -> true
	${empty param.name} : 요청key로 name의 값이 없을 때 true로 처리
	${not empty param.id} : 요청 id의 값이 있을 때 true로 처리된다

5. 각 범위별 기능 메소드
	${pageContext} : jsp page 객체로 다양한 객체의 범위에 따른 기능메소드를 지원함
	범위별 객체 ${pageScope}  ${requestScope}  ${sessionScope}  ${applicationScope}
	요청값 처리 ${param} ${paramValues}
	요청header ${header} ${headerValues}
	쿠키 ${cookie}
	초기파라미터 ${initParam}
	
	ex) String path = request.getContextPath();
	-> el로 ${pageContext.request.contextPath}
	
	다음시간에는 jstl의 변수 설정 (위와 같은 내용)
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	
--%>
<%

%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h2Obj").text("기타 el의 기능메소드");
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>점수</th><td><input type="text" name="point" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="확인"/>
		</td></tr>
	</table>	
	</form>
	
	<h3 align="center"> 요청 점수 : ${param.point} </h3>
	<h3 align="center"> 70점 이상 여부 : ${param.point ge 70} </h3>
	<!--  값이 있는지 확인 (boolean)  -->
	<h3 align="center"> empty : ${empty param.point} </h3>
	<!--  값이 있을 때 -->
	<h3 align="center"> not empty : ${not empty param.point} </h3>
	
	
	
	<!--  page범위별 기능 메소드  -->
	<h3 align="center"> page범위별 기능 메소드 </h3>
	${pageContext.request} 
	
	
	<table align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>