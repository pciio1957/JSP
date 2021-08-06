<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.z01_database.*"
    import="jspexp.z02_vo.*"
    import="java.util.*"
    isErrorPage = "true"
%>
   
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 외부 CSS 설정 호출 -->
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>

</style>
<script type="text/javascript">
	window.onload = function() {
		document.querySelector("h3").innerText="시작";
	}

</script>
</head>
<%-- 
#에러 페이지 처리
1. 속성 선언
	isErrorPage = "true"
2. exception을 참조하는 여러가지 메소드를 사용할 수 있음
	

--%>
<%

%>
<body>
	<h3 align="center"></h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>에러타입</th><td><%= exception.getClass().getName() %></td></tr>
		<tr><th>에러메세지</th><td><%= exception.getMessage() %></td></tr>
		<tr><th colspan="2">잠시 기다리면 담당자와 통화가 가능합니다</th></tr>
		<tr><th>담당자</th><td>홍길동 대리(010-7777-8888)</td></tr>
	</table>	
	</form>
	<table class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>