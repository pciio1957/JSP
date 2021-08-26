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
<!--  
응용) a08_calcu.jsp 파일에서 두 숫자를 입력받아서 [ ] [ ] [합산]
	z09_data.jsp 에 결과 @@ + @@ = @@ 로 작성 (4조 제출, 나머지 손들기) 
-->
<%

%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		var xhr = new XMLHttpRequest();
		$("#btnAdd").click(function(){
			
			var numV01 = $("[name=num01]").val();
			var numV02 = $("[name=num02]").val();
			
			xhr.open("get", "z09_data.jsp?num01=" + numV01 + "&num02=" + numV02, false);
			xhr.send();
			
			$("div").html(xhr.responseText);
		});
		
		/*
			$("#btnAdd").click(plus);
			function plus() { ~~프로세스 처리}; 
			이런식으로 익명함수말고 함수를 이용할 수도 있음
		*/
	});                                                          
</script>
<body>
	<h2 align="center">응용문제 - 합산</h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr>
			<td><input type="text" name="num01" value=""/></td>
			<td><input type="text" name="num02" value=""/></td>
		</tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="button" id="btnAdd" value="합산"/>
		</td></tr>
	</table>	
	</form>
	
	<div></div>
</body>
</html>