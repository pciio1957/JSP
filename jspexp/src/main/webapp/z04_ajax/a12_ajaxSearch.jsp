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
	
		$("[name=ename], [name=job]").keyup(function(event){
			// id문이 없으면 입력하자마자 결과가 출력됨 
			if(event.keyCode == 13) {
				search();
			}
		});
		
		$("#btnsch").click(function(){
			search();
		});
	});
	
	function search(){
		var xhr = new XMLHttpRequest();
		var data = "ename=" + $("[name=ename]").val() + "&job=" + $("[name=job]").val();
		xhr.open("post", "z13_data.jsp", true);
		xhr.setRequestHeader("Conten-Type", "application/x-www-form-urlencoded");
		xhr.send(data);
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				$("div").html(xhr.responseText);
			}
		}
		
	}
</script>
<body>
	<h2 align="center">ajax로 처리한 사원정보(비동기)</h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><th>직책</th><td><input type="text" name="job" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center">
			<input type="button" id="btnsch" value="검색"/>
		</td></tr>
	</table>	
	</form>
	<div></div>
	
	
	<!--  응용) 부서정보를 ajax 처리하여 출력하기 (4조 제출, 나머지 손들기) -->
	
</body>
</html>