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
		$("#h2Obj").text("구매정보 출력").click(function(){
			
			var xhr = new XMLHttpRequest();
			xhr.open("get", "z06_data.txt", true); // 비동기
			
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200) {
					var pro01 = eval('(' + xhr.responseText + ')');
					
					$("#tab01").find("td").eq(0).text(pro01.name);
					$("#tab01").find("td").eq(1).text(pro01.price);
					$("#tab01").find("td").eq(2).text(pro01.cnt);
				}
			};
			
			xhr.send();
		});
	});
</script>
<body>
	<h2 align="center" id="h2Obj"></h2>

	<table id="tab01" align="center" class="listTable">
		<tr><th>물건명</th><th>가격</th><th>갯수</th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>