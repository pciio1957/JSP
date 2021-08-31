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

#forTokens
1. 구분자에 의해 데이터를 나누어서 처리하는 것을 의미한다
 	ex) 데이터(사과^바나나^딸기) : 구분자 ^에 의해 ["사과", "바나나", "딸기"]가 
 		만들어지면 이 내용을 반복문에 의해 처리되는 것을 말한다
 
2. 기본 형식
	선언 : <c:forTokens var="변수명" items="구분자포함데이터"
		delims="구분자" varStatus="sts변수">
	사용 : ${변수명} : 단위 데이터

3. 속성
	var : 구분자에 의해 추출된 단위 데이터를 할당할 변수명 지정
	items : 구분자가 포함되어 있는 문자열 데이터 ex)사과^바나나^딸기
	delims : 구분자 
	varStatus : idnex, count, first, last 등 효과적인 변수를 활용 가능
	
--%>
<%

%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){

	});
</script>
<body>
	<h2 align="center">구분자 처리</h2>
	<c:forTokens var="color" items="red, green, blue" delims="," varStatus="sts">
		<h3 align="center">${sts.count }) ${color }</h3>
	</c:forTokens>
	
	
	<!--  응용) 과일명, 사과;오렌지;수박;딸기 를 구분자로 처리하여 2x2 테이블에 출력하기 
	(1조 제출, 나머지 손들기) -->

	<table align="center" class="listTable">
		<tr>
		<c:forTokens var="fruits" items="사과;오렌지;수박;딸기" delims=";" varStatus="sts">
			<c:choose>
				<c:when test="${sts.count %3 == 0 }">
					</tr><tr><td>${fruits }</td>
				</c:when>
				<c:otherwise>
					<td>${fruits }</td>
				</c:otherwise>
			</c:choose>
		</c:forTokens>
		</tr>
	</table>	
	
	

	
	<table align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>