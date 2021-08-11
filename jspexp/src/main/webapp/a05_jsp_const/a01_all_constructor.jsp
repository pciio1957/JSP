<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    %>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
%>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Front 연습</title>
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
	});
</script>
</head>
<%-- 
#jsp의 구성요소
1. 디렉티브
	최상단의 page import하는 부분을 말함
	
2. 스크립트 : 스크립트릿, 표현식, 선언부
	자바 코드를 선언하여 사용하는 부분을 말함 
	선언한 자바코드 내에 변수를 이용할땐 표현식, 코드의 선언시에는 선언부를 이용함
	
3. 표현언어(el)
	
4. 기본객체
5. 정적인 데이터
6. 표준액션 태그 
7. 커스텀 태그와 표준 태그 라이브러리 (jstl)
	<c:set> <c:forEach> <c:if>

--%>
<%! 
	// 선언부(declare)
	String name = "홍길동";
	public int plus(int num01, int num02) {
		return num01 + num02;
	}
%>
<%
	// 스크립트릿
	// 데이터의 할당, 조건 반복문 처리
%>
<%= name %>
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