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

		
		var xhr = new XMLHttpRequest();
		
		$("[name=id],[name=pw]").keyup(function(event){
			if(event.keyCode == 13) {
				var id = $("[name=id]").val();
				var pw = $("[name=pw]").val();
				var snd = "id=" + id + "&pw=" + pw;
				console.log(snd);
				xhr.open("post", "z12_data2.jsp", true);
				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
				xhr.send(snd);
				xhr.onreadystatechange = function(){
					if(xhr.readyState == 4 && xhr.status == 200) {
						$("div").html(xhr.responseText);
					}
				}
			}
		});
	});
</script>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><th>비밀번호</th><td><input type="text" name="pw" value=""/></td></tr>
	</table>	
	</form>
	
	<div></div>
</body>
</html>