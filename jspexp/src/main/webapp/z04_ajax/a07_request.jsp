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

#요청값에 따른 반응값 처리 
1. get방식 요청값 처리 
	url + "?key=value&key2=value2" ... 
	
2. 데이터를 처리해주는 방식
	1) .txt : 입력된 데이터를 그대로 출력
	2) .html : html 태그의 결과로 나오는 코드를 전송
	3) .jsp : jsp로 요청값을 받은 화면 처리 
	4) controller(MVC패턴)의 결과로 문자열을 받는 처리 

--%>
<%

%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){

		var xhr = new XMLHttpRequest();
		$("#btnsch").click(function(){
			var nameVal = $("[name=ename]").val();
			xhr.open("get", "z08_data.jsp?ename=" + nameVal, false);
			xhr.send();
			
			$("div").html(xhr.responseText);
		});
	});
</script>
<body>
	<h2 align="center">html 화면 호출</h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="button" id="btnsch" value="호출"/>
		</td></tr>
	</table>	
	</form>
	
	<div></div>
	
	
	<!--  응용) a08_calcu.jsp 파일에서 두 숫자를 입력받아서 [ ] [ ] [합산]
			z09_data.jsp 에 결과 @@ + @@ = @@ 로 작성 (4조 제출, 나머지 손들기) -->
</body>
</html>