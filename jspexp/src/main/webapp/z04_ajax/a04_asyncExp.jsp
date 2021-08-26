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

#

--%>
<%

%>
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#h2Obj").text("사원정보 비동기처리").click(function(){
			
			var xhr = new XMLHttpRequest();
			
			// 비동기로 처리
			xhr.open("get", "z04_data.txt", true);
			xhr.send();
			
			xhr.onreadystatechange = function(){
				console.log("상태값 변경 확인 : " + xhr.readyState);
				console.log("결과값 변경 확인 : " + xhr.status);
				
				if(xhr.readyState == 4 && xhr.status == 200) {
					$("#show").html(xhr.responseText);
				}
			};
			
		});
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>
	
		
	<table align="center" class="listTable">
		<tr><th>사원명</th><th>급여</th><th>부서명</th></tr>
		<tr id="show"></tr>
	</table>

</body>
</html>