<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="a01_all_constructor.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String paths = request.getContextPath();
%>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Front 연습</title>
<link rel="stylesheet" href="<%=paths%>/a00_com/a01_com.css">
<style>
	
</style>
<script src="<%=paths%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
	});
</script>
</head>
<%-- 
#디렉티브(directive)
1. jsp페이지에 대한 설정 정보를 지정
2. 디렉티브 구문
	<%@ 디렉티브이름 속성="속성값" 속성2="속성값2" %>
3. 종류
	1) page : jsp페이지에 대한 정보 지정, 문서의 타입, 출력 버퍼의 크기, 에러 페이지 등 정보 지정
	2) taglib : 사용할 태그 라이브러리 지정
	3) include : 다른 문서 포함 
	
4. page 디렉티브
	1) jsp 페이지에 대한 정보 입력
		jsp가 생성할 문서의 타입, 사용할 클래스, 버퍼 여부, 세션 여부
	2) jsp 디렉티브의 작성 예
		<%@ page contentType="text/html;".. %>
		<%@ page import="" %>
	3) 주요 속성
		contentType : jsp가 생성할 문서의 타입 지정
		import : jsp페이지에서 사용할 자바클래스 지정
		session : jsp페이지가 세션을 사용할 지에 대한 여부 지정 default는 true 
		info : jsp 페이지에 대한 설명을 입력한다
		errorPage : 에러가 발생할 때 보여줄 페이지 지정
		isErrorPage : 에러페이지의 여부 지정
--%>
<%

%>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<table align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>