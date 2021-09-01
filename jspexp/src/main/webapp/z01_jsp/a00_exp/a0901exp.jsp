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

#정리문제
1. 날짜형 데이터에 대한 fmt 기본 형식을 기술하기
	날짜 처리
	1) 날짜 데이터에는 날짜와 시간이 결합되어있다.
	2) data  type은 java.util.Date를 활용한다
	3) 기본 형식
		<fmt:formatDate type="date|time|both"
			dateStyle="full|short"
			timeStype="full|short"
			pattern="yyyy/MM/dd kk:mm:ss.S"
			value="선언된 데이터"/>

2. 오늘 기준으로 날짜와 현재시간을 full 형식으로 출력처리하기
	(아래)

3. 숫자형 데이터의 기본 속성을 기술하기 
	숫자처리
	1) 숫자를 통화나 소숫점 이하 지정된 형식으로 처리할 수 있다
	2) type의 속성
		currency : 통화단위 (원 표시와 천 단위마다 , 적용)
		percent : % 단위 (단위뒤에 % 적용)
	3) pattern : 00,000,000.000 등과 같이 
		특정한 출력 형식을 처리할 수 있다 (사용자 지정 패턴)

4. DB 접근하여 MVC 패턴으로 데이터를 출력하는 기본 프로세스를
	controller, service, dao, view, model로 
	나누어 핵심코드와 함께 설명하기 

	1) view
		- 사용자가 확인할 초기화면 작성 
		- form을 이용해 데이터 작성 및 데이터 전송을 처리하도록 한다
		
	2) controller
		- view에서 전송된 데이터를 model에 전송하기 위해 요청값 처리
		- model 데이터 처리 
	
	3) model
		- service를 호출하여 데이터를 받아온다
		- 해당 데이터를 모델 데이터 선언한다
		request.setAttribute("모델명", "할당할 데이터객체")
	
	4) service
		- dao를 호출하여 데이터를 리턴하고 비즈니스 로직을 처리한다
	
	5) dao
		- DB와 연동하여 DB데이터를 가져온다
	

5. MVC 패턴으로 등록된 id인지 여부를 확인 처리하는 (DAO추가)
	jsp 프로그램을 구현하기
	(아래)

--%>
<%

%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){

	});
</script>
<body>
	<h2 align="center">9월 1일 응용문제</h2>
	
	<h3>오늘의 날짜</h3>
	<c:set var="now" value="<%= new Date() %>"/>
	<fmt:formatDate type="date" dateStyle="full" value="${now}"/>
	
	
	<h3 align="center">아이디 중복확인</h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="submit" value="조회"/>
		</td></tr>
	</table>	
	</form>
	
	<c:if test="${not empty param.id }">
		<c:choose>
			<c:when test="${idCheck == true }"><h3 align="center">아이디가 존재합니다</h3></c:when>
			<c:when test="${idCheck == false }"><h3 align="center">아이디를 사용할 수 있습니다</h3></c:when>
		</c:choose>
	</c:if>

</body>
</html>