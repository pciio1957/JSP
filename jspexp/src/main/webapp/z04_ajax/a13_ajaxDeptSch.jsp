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
<script src="${path}/z00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">

	function search() {
		var xhr = new XMLHttpRequest();
		var data = "dname=" + $("[name=dname]").val() + "&loc=" + $("[name=loc]").val();
		
		xhr.open("post", "z14_data.jsp", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send(data);
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.ststus == 200) {
				$("div").html(xhr.responseText);
			}
		}
	}
	
	$(document).ready(function(){
		
		$("[name=dname], [name=loc]").keyup(function(event){
			if(event.keyCode == 13) {
				search();
			}
		});
		
		$("#btnsch").click(function(){
			search();
		});

	});
</script>
<body>
	<h2 align="center">ajax로 처리한 부서정보</h2>
	
	<!--   응용) 부서정보를 ajax 처리하여 출력하기 (4조 제출, 나머지 손들기)  -->
	<form id="frm02" method="post">
	<table align="center" class="listTable">
		<tr><th>부서명</th><td><input type="text" name="dname" value="${param.dname}"/></td></tr>
		<tr><th>부서위치</th><td><input type="text" name="loc" value="${param.loc}"/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="button" id="btnsch" value="검색"/></td></tr>
	</table>	
	</form>	
	<div></div>	
	
</body>
</html>